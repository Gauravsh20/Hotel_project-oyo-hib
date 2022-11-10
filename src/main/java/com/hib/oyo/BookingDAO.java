package com.hib.oyo;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class BookingDAO {
	
	SessionFactory sessionFactory;
	
	public String generateBookId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Booking.class);
		List<Booking> bookinglist=cr.list();
		if (bookinglist.size()==0) {
			return "B001";
		}
		String BookIds=bookinglist.get(bookinglist.size() - 1).getBookId();
		int ids = Integer.parseInt(BookIds.substring(1));
		String bid=String.format("B%03d",++ids);
		return bid;
		}
	
	public Date convertDate(java.util.Date dt) {
		java.sql.Date sqlDate=new java.sql.Date(dt.getTime());
		return sqlDate;
	}
	
	
	public Room searchByRoomId(String roomId) {
		sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Criteria cr = session.createCriteria(Room.class);
		cr.add(Restrictions.eq("roomId", roomId));
		List<Room> roomList = cr.list();
		return roomList.get(0);
	}
	
	public String AddBooking(Booking booking) {
		sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		String bookId=generateBookId();
		booking.setBookId(bookId);
		
		java.util.Date date=new java.util.Date();
		java.sql.Date bookedDate=new Date(date.getTime());
		booking.setBookDate(bookedDate);
		
		Transaction trans=session.beginTransaction();
		session.save(booking);
		trans.commit();
		session.close();

		session = sessionFactory.openSession();
		Room room = searchByRoomId(booking.getRoomId());
		trans = session.beginTransaction();
		System.out.println(room.getRoomId());
		room.setStatus(Status.BOOKED);
		session.saveOrUpdate(room);
		trans.commit();
		session.close();
		return "***----Room Booked and Status Updated----***";
		
	}
	public Booking bookings(String bookId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Booking.class);
		criteria.add(Restrictions.eq("bookId", bookId));
		List<Booking> bookingList = criteria.list();
		
		return bookingList.get(0);
	}

	public String checkoutDAO(String bookId) {
		sessionFactory=SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		
		CheckOut checkout=new CheckOut();
		Booking booking = bookings(bookId);
		Room room = searchByRoomId(booking.getRoomId());
		int noOfDays = booking.getChkOutDate().getDate() - booking.getChkInDate().getDate() + 1;
		long billAmt = noOfDays * room.getCostPerDay();
		System.out.println(noOfDays);
		System.out.println(billAmt);
		System.out.println(bookId);
		checkout.setRoomId(booking.getRoomId());
		checkout.setNoofdays(noOfDays);
		checkout.setBillamount(billAmt);
		checkout.setBid(booking.getBookId().toString());
		Transaction trans = session.beginTransaction();
		session.save(checkout);
		trans.commit();
		session.close();
		
		room.setStatus(Status.AVAILABLE);
		
		session = sessionFactory.openSession();
		trans = session.beginTransaction();
		session.update(room);
		trans.commit();
		session.close();
		return "Room With ID "  +booking.getRoomId()+ " and bill amount of " + billAmt + " for " + noOfDays + " days checked out successfully.";		
		
	
}
	 

	

}
