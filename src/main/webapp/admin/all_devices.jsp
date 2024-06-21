<%@page import="com.entity.DeviceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : All Mobile</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Model Name</th>
				<th scope="col">Info</th>
				<th scope="col">Price</th>
				<th scope="col">Mobile Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list = dao.getAllDevices();
			for (DeviceDtls b : list) {
			%>

			<tr>
				<td><%=b.getDeviceId()%></td>
				<td><img src="../device/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getDeviceName()%></td>
				<td><%=b.getIno()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getDeviceCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_devices.jsp?id=<%=b.getDeviceId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
					<a href="../delete?id=<%=b.getDeviceId()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>
						Delete</a></td>
			</tr>
			<%
			}
			%>



		</tbody>
	</table>
	<div style="margin-top: 158px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>