<%@page import="com.entity.DeviceDtls"%>
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
<title>Admin : Add Mobile</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Info</h4>

						


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
						DeviceDtls b = dao.getDeviceById(id);
						%>


						<form action="../editdevices" method="post">
						<input type="hidden" name="id" value="<%=b.getDeviceId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Model Name*</label><input
									name="dname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getDeviceName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Info*</label><input
									name="info" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getIno()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label><input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>



							<div class="form-group">
								<label for="inputState">Mobile Status</label><select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Available</option>
									<option value="Inactive">Unavailable</option>
									<%
									} else {
									%>

									<option value="Inactive">Unavailable</option>
									<option value="Active">Available</option>
									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div style="margin-top: 40px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>