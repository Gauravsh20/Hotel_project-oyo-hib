package com.hib.oyo;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class RoomDAO {

	SessionFactory sessionFactory;
	
	public String generateRoomId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Room.class);
		List<Room> roomlist=cr.list();
		String roomIds=roomlist.get(roomlist.size() - 1).getRoomId();
		int ids = Integer.parseInt(roomIds.substring(1));
		String rid=String.format("R%03d",++ids);
		return rid;
		}
	
	
	public String Addroom(Room room) {
		String roomId=generateRoomId();
		room.setRoomId(roomId);
		room.setStatus(Status.AVAILABLE);
		if (sessionFactory==null) {
			sessionFactory=SessionHelper.getConnection();
		}
		Session session;
		session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		session.save(room);
		trans.commit();
		session.close();
		return "***----Add Room----***";
		
	}
	public List<Status> showAvailableRooms() {
		 sessionFactory=SessionHelper.getConnection();
			Session session=sessionFactory.openSession();
			Criteria cr=session.createCriteria(Room.class);
			cr.add(Restrictions.eq("status", Status.AVAILABLE));
			Projection projection = Projections.property("roomId"); 
			cr.setProjection(projection); 
			List<Status> list = cr.list();
			return list;
	}
	 public List<Room> showAvailRoom(){
		 sessionFactory=SessionHelper.getConnection();
			Session session=sessionFactory.openSession();
			Criteria cr=session.createCriteria(Room.class);
			List<Room> roomlist=cr.list();
			return roomlist;
			
	 }
	
	
	}
//	public String addRoom(Room room) {
//		sessionFactory = SessionHelper.getConnection();
//		Session session = sessionFactory.openSession();
//		
//		return "Connected Establishdd...";
//	}
