package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DeviceDAOImpl;
import com.DB.DBConnect;
import com.entity.DeviceDtls;

@WebServlet("/editdevices")
public class EditDevicesServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String deviceName = req.getParameter("dname");
			String info = req.getParameter("info");
			String price = req.getParameter("price");
			String status = req.getParameter("status");

			DeviceDtls b = new DeviceDtls();
			b.setDeviceId(id);
			b.setDeviceName(deviceName);
			b.setIno(info);
			b.setPrice(price);
			b.setStatus(status);
			
			DeviceDAOImpl dao=new DeviceDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditDevices(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Device Update Successfully");
				resp.sendRedirect("admin/all_devices.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/all_devices.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
