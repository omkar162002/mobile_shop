package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.DeviceDAOImpl;
import com.DB.DBConnect;
import com.entity.DeviceDtls;

@WebServlet("/add_devices")
@MultipartConfig
public class DevicesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String deviceName = req.getParameter("dname");
			String info = req.getParameter("info");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();

			DeviceDtls b = new DeviceDtls(deviceName, info, price, categories, status, fileName, "admin");
			
			DeviceDAOImpl dao=new DeviceDAOImpl(DBConnect.getConn());
			
			
			
			boolean f=dao.addDevices(b);
			HttpSession session=req.getSession();
			if(f) {
				
				String path=getServletContext().getRealPath("")+"device";
				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Mobile Add Successfully");
				resp.sendRedirect("admin/add_devices.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/add_devices.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
