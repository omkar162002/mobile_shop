<%@page import="com.entity.User"%>
<%@page import="com.entity.DeviceDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Device Details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
	DeviceDtls b = dao.getDeviceById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="device/<%=b.getPhotoName()%>"
					style="height: 160px; width: 130px"><br>
				<h4 class="mt-3">
					Model Name :<span class="text-success"> <%=b.getDeviceName()%></span>
				</h4>
				<h4>
					Color :<span class="text-success"> <%=b.getIno()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"> <%=b.getDeviceCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getDeviceName()%></h2>

				<%
				if ("Old".equals(b.getDeviceCategory())) {
				%>
				<h5 class="text-primary">Contact to Seller</h5>
				<h6 class="text-primary">
					<i class="fas fa-envelope"></i> EMail:
					<%=b.getEmail()%></h6>

				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<%
				if ("Old".equals(b.getDeviceCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-danger"><i
						class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>

				<%
				} else {
				%>
				<div class="text-center p-3">
				
				
				<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-primary"><i
								class="fas fa-cart-plus"></i>Add to cart</a>
								<a href="" class="btn btn-danger"><i
						class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getDeviceId()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary"><i
								class="fas fa-cart-plus"></i>Add to cart</a>
								<a href="" class="btn btn-danger"><i
						class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
							<%
							}
							%>
					
				</div>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> 
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>