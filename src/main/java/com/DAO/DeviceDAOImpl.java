package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.DeviceDtls;

public class DeviceDAOImpl implements DeviceDAO {

	private Connection conn;

	public DeviceDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addDevices(DeviceDtls b) {
		boolean f = false;
		try {
			String sql = "insert into device_dtls(devicename,info,price,deviceCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getDeviceName());
			ps.setString(2, b.getIno());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getDeviceCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<DeviceDtls> getAllDevices() {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;
		try {
			String sql = "select * from device_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public DeviceDtls getDeviceById(int id) {
		DeviceDtls b = null;

		try {
			String sql = "select * from device_dtls where deviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditDevices(DeviceDtls b) {
		boolean f = false;
		try {
			String sql = "update device_dtls set devicename=?,info=?,price=?,status=? where deviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getDeviceName());
			ps.setString(2, b.getIno());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getDeviceId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteDevice(int id) {
		boolean f = false;
		try {
			String sql = "delete from device_dtls where deviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<DeviceDtls> getNewDevice() {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where deviceCategory=? and status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getRecentDevices() {

		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getOldDevices() {

		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where deviceCategory=? and status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getAllRecentDevice() {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getAllNewDevice() {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where deviceCategory=? and status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getAllOldDevice() {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;

		try {

			String sql = "select * from device_dtls where deviceCategory=? and status=? order by deviceId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<DeviceDtls> getDeviceByOld(String email, String cate) {
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;
		try {

			String sql = "select * from device_dtls where deviceCategory=? and email=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean oldDeviceDelete(String email, String cat,int id) {
		boolean f = false;

		try {
			String sql = "delete from device_dtls where deviceCategory=? and email=? and deviceId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<DeviceDtls> getDeviceBySearch(String ch) {
		
		List<DeviceDtls> list = new ArrayList<DeviceDtls>();
		DeviceDtls b = null;
		try {

			String sql = "select * from device_dtls where devicename like ? or info like ? or deviceCategory like ? and status=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new DeviceDtls();
				b.setDeviceId(rs.getInt(1));
				b.setDeviceName(rs.getString(2));
				b.setIno(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setDeviceCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<DeviceDtls> getAlldevices() {
		// TODO Auto-generated method stub
		return null;
	}

}
