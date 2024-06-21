package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Device_Order;

public class DeviceOrderImpl implements DeviceOrderDAO {

	private Connection conn;

	public DeviceOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	

	public boolean saveOrder(List<Device_Order> blist) {

		boolean f = false;
		try {

			String sql = "insert into device_order(order_id,user_name,email,address,phno,device_name,info,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Device_Order b: blist ) {
			
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getDeviceName());
				ps.setString(7, b.getInfo());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}



	public List<Device_Order> getDevice(String email) {
		List<Device_Order> list=new ArrayList<Device_Order>();
		Device_Order o=null;
		
		try {
			
			String sql="select * from device_order where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Device_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setDeviceName(rs.getString(7));
				o.setInfo(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return list;
	}



	public List<Device_Order> getAllOrder() {
		List<Device_Order> list=new ArrayList<Device_Order>();
		Device_Order o=null;
		
		try {
			
			String sql="select * from device_order";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Device_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setDeviceName(rs.getString(7));
				o.setInfo(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return list;
	}

}
