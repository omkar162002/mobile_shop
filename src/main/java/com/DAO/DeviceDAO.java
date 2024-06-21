package com.DAO;

import java.util.List;

import com.entity.DeviceDtls;

public interface DeviceDAO {

	public boolean addDevices(DeviceDtls b);

	public List<DeviceDtls> getAlldevices();

	public DeviceDtls getDeviceById(int id);

	public boolean updateEditDevices(DeviceDtls b);

	public boolean deleteDevice(int id);

	public List<DeviceDtls> getNewDevice();
	
	public List<DeviceDtls> getRecentDevices();
	
	public List<DeviceDtls> getOldDevices();
	
	public List<DeviceDtls> getAllRecentDevice();
	
	public List<DeviceDtls> getAllNewDevice();
	
	public List<DeviceDtls> getAllOldDevice();
	
	public List<DeviceDtls> getDeviceByOld(String email, String cate);
	
	public boolean oldDeviceDelete(String email, String cat, int id);
	
	public List<DeviceDtls> getDeviceBySearch(String ch);
	
}
