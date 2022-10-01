<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link 
	rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<title>GradedAssignment5</title>

</head>

<body>
	<div class="container">
		<br />
		<br />
		<h1 style="background-color:rgb(18, 228, 18);">CUSTOMER RELATIONSHIP MANAGEMENT</h1>
		<hr />
		
		<!-- Add form -->
		<!--  <h5>To register click below</h5>
		<form action="/CustomerManagement/customer/search" class="form-inline"> 
		-->
		<!-- Add a button -->
		<a href="/CustomerManagement/customer/showFormForAdd" class="btn btn-primary btn-sm mb-3"> Add Customer </a> 
		<!-- </form> -->

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ListOfCustomer}" var="tempCustomer">
					<tr>
						<td><c:out value="${tempCustomer.firstName}" /></td>                       
						<td><c:out value="${tempCustomer.lastName}" /></td>					
						<td><c:out value="${tempCustomer.email}" /></td>
						<td>
							<!-- Add "update" button/link --> 
							<a href="/CustomerManagement/customer/showFormForUpdate?customerId=${tempCustomer.id}"           
							 class="btn btn-info btn-sm"> Update </a>                                 
							 
							<!-- Add "delete" button/link -->
							<a href="/CustomerManagement/customer/delete?customerId=${tempCustomer.id}"
							 class="btn btn-danger btn-sm"
							 onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
							 Delete </a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		<a href="/CustomerManagement/customer/displayList" class="btn btn-info btn-sm">Display Customer List</a>
		<br>
		<br>
		<a href="/CustomerManagement">Go to Home Page</a>
	</div>
	
</body>
</html>