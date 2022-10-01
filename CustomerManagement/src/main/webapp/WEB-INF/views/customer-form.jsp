<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	  integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	  crossorigin="anonymous">

<title>GradedAssignment5</title>
</head>
<body>
	<div class="container">
		<h1 style="background-color:rgb(18, 228, 18);">CUSTOMER RELATIONSHIP MANAGEMENT</h1>
		<hr>
		
		<p class="h4 mb-4">Save Customer</p>

		<form action="/CustomerManagement/customer/save" method="POST">

			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="customerId" value="${AddOrUpdateCustomer.id}" />

			<div class="form-inline">                                                                                        <!--  AddOrUpdateCustomer.firstName => firstName is field of Customer.class -->
				<input type="text" name="customerFirstName" value="${AddOrUpdateCustomer.firstName}"                           
					class="form-control mb-4 col-4" placeholder="First Name">
			</div>

			<div class="form-inline">
				<input type="text" name="customerLastName" value="${AddOrUpdateCustomer.lastName}"
					class="form-control mb-4 col-4" placeholder="Last Name">
			</div>

			<div class="form-inline">
				<input type="text" name="customerEmail" value="${AddOrUpdateCustomer.email}"
					class="form-control mb-4 col-4" placeholder="Email Id">
			</div>

			<button type="submit" class="btn btn-info col-2">Save</button>

		</form>

		<hr>
		<a href="/CustomerManagement/customer/list">Back to Customer List</a>

	</div>

</body>
</html>