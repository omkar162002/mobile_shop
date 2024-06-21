package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DeviceDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_device")
public class DeleteOldDevice extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			boolean f = dao.oldDeviceDelete(em, "Old",id);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Device Deleted");
				resp.sendRedirect("old_device.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("old_device.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
