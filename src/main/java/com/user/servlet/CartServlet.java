package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DeviceDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.DeviceDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			DeviceDtls b = dao.getDeviceById(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setDeviceName(b.getDeviceName());
			c.setInfo(b.getIno());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Device added to cart");
				resp.sendRedirect("all_new_device.jsp");
				
			} else {
				session.setAttribute("failed", "Something went wrong on server");
				resp.sendRedirect("all_new_device.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
