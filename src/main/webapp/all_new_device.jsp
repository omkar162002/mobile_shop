<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.DeviceDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.DeviceDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f0f1f2;">

<%
	User u = (User) session.getAttribute("userobj");
	%>

<c:if test="${not empty addCart }">
<div id="toast">${addCart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addCart" scope="session"/>

</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

			<%
			DeviceDAOImpl dao = new DeviceDAOImpl(DBConnect.getConn());
			List<DeviceDtls> list = dao.getAllNewDevice();
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
								class="btn btn-success btn-sm ml-1">View Details</a> 
								
								<a href=""
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

	</div>

</body>
</html>