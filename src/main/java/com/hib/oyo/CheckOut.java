package com.hib.oyo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Billing")
public class CheckOut {
	@Id
	@Column(name="BookID")
	private String bid;
	
	@Column(name="roomId")
	private String roomId;
	
	@Column(name="billamt")
	private long billamount;
	
	@Column(name="noofdays")
	private long noofdays;
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public long getBillamount() {
		return billamount;
	}
	public void setBillamount(long billamount) {
		this.billamount = billamount;
	}
	public long getNoofdays() {
		return noofdays;
	}
	public void setNoofdays(long noofdays) {
		this.noofdays = noofdays;
	}

}
