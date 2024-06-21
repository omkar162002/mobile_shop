package com.DAO;

import java.util.List;

import com.entity.Device_Order;

public interface DeviceOrderDAO {

	public boolean saveOrder(List<Device_Order> b);
	
	public List<Device_Order> getDevice(String email);
	
	public List<Device_Order> getAllOrder();
	
}
