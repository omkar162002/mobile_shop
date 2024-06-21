<%@page import="com.entity.User"%>
<%@page import="com.entity.DeviceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electonics : Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/mobile1.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

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
	<div class="container-fluid back-img border">
		
	</div>



	<!-- Start Recent Device -->

	<div class="container">
		<h3 class="text-center">New release</h3>
		<div class="row">
			<%
			DeviceDAOImpl dao2 = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list2 = dao2.getRecentDevices();
			for (DeviceDtls b : list2) {
			%>

			<div class="col-md-4">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="device/<%=b.getPhotoName()%>"
							style="width: 160px; height: 200px" class="img-thumblin">
						<p><%=b.getDeviceName()%></p>
						<p><%=b.getIno()%></p>
						<p>

							<%
							if (b.getDeviceCategory().equals("Old")) {
							%>

							Categories:
							<%=b.getDeviceCategory()%></p>
						<div class="row">
							<a href="view_devices.jsp?bid=<%=b.getDeviceId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
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
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
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
		<div class="text-center mt-1">
			<a href="all_recent_device.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>

		</div>
	</div>

	<!-- End Recent Device -->

	<hr>

	<!-- Start New Device -->

	<div class="container">
		<h3 class="text-center">New Devices</h3>
		<div class="row">

			<%
			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list = dao.getNewDevice();
			for (DeviceDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="device/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getDeviceName()%></p>
						<p><%=b.getIno()%></p>
						<p>
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
								class="btn
							btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_new_device.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>

		</div>
	</div>

	<!-- End New Device -->

	<hr>

	<!-- Start Old Device -->

	<div class="container">
		<h3 class="text-center">Old Devices</h3>
		<div class="row">


			<%
			DeviceDAOImpl dao3 = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list3 = dao2.getOldDevices();
			for (DeviceDtls b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="device/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getDeviceName()%></p>
						<p><%=b.getIno()%></p>
						<p>
							Categories:
							<%=b.getDeviceCategory()%></p>
						<div class="row">
							<a href="view_devices.jsp?bid=<%=b.getDeviceId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_device.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>

		</div>
	</div>

	<!-- End Old Device -->



	<%@include file="all_component/footer.jsp"%>

</body>
</html>