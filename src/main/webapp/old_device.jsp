<%@page import="com.entity.DeviceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Devices</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center">${failedMsg }</div>


		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Model Name</th>
					<th scope="col">Info</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
				List<DeviceDtls> list = dao.getDeviceByOld(email, "Old");
				for (DeviceDtls b : list) {
				%>
				<tr>
					<td><%=b.getDeviceName()%></td>
					<td><%=b.getIno()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getDeviceCategory()%></td>
					<td><a
						href="delete_old_device?em=<%=email%>&&id=<%=b.getDeviceId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>



			</tbody>
		</table>
	</div>
</body>
</html>