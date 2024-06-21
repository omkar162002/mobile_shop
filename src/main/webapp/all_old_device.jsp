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
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list = dao.getAllOldDevice();
			for (DeviceDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="device/<%=b.getPhotoName()%>"
							style="width: 100px; height: 130px" class="img-thumblin">
						<p><%=b.getDeviceName()%></p>
						<p><%=b.getIno()%></p>
						<p>
							Categories:
							<%=b.getDeviceCategory()%></p>
						<div class="row">
							<a href="view_devices.jsp?bid=<%=b.getDeviceId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
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

	</div>

</body>
</html>