package com.user.servlet;

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

@WebServlet("/add_old_device")
@MultipartConfig
public class AddOldDevice extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String deviceName = req.getParameter("dname");
			String info = req.getParameter("info");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String useremail=req.getParameter("user");

			DeviceDtls b = new DeviceDtls(deviceName, info, price, categories, status, fileName, useremail);
			
			DeviceDAOImpl dao=new DeviceDAOImpl(DBConnect.getConn());
			
			
			
			boolean f=dao.addDevices(b);
			HttpSession session=req.getSession();
			if(f) {
				
				String path=getServletContext().getRealPath("")+"device";
				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succMsg", "Device Add Successfully");
				resp.sendRedirect("sell_device.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("sell_device.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
