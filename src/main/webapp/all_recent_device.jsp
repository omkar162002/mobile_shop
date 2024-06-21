<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.DeviceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Devices</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color: #f5dedc;
}
</style>
</head>
<body style="background-color: #f0f1f2;">


<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">


			<%
			DeviceDAOImpl dao2 = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list2 = dao2.getAllRecentDevice();
			for (DeviceDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="device/<%=b.getPhotoName()%>"
							style="width: 100px; height: 130px" class="img-thumblin">
						<p><%=b.getDeviceName()%></p>
						<p><%=b.getIno()%></p>
						<p>

							<%
							if (b.getDeviceCategory().equals("Old")) {
							%>

							Categories:
							<%=b.getDeviceCategory()%></p>
						<div class="row">
							<a href="view_devices.jsp?bid=<%=b.getDeviceId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories:
						<%=b.getDeviceCategory()%></p>
						<div class="row">
						
						
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getDeviceId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i>Add cart</a>
							<%
							}
							%>
							
							
						
							
							
						
							 <a href="view_devices.jsp?bid=<%=b.getDeviceId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>



					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>

	</div>

</body>
</html>