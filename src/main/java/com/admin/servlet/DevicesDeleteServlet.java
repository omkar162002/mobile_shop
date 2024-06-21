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

@WebServlet("/delete")
public class DevicesDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteDevice(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Device Delete Successfully");
				resp.sendRedirect("admin/all_devices.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong on server");
				resp.sendRedirect("admin/all_devices.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
