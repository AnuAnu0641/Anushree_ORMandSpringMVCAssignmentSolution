<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GradedAssignment5</title>
    <style>
        table {
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 5px;
        }
    </style>
</head>
<body>
	<h3 style="text-align:center; font-weight: bold;">List of Customers</h3>
	<hr />
	<br>
	<table>
		<thead>
			<tr>
				<th>Customer Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${CustomerList}" var="tempCustomer">
					<tr>
						<td><c:out value="${tempCustomer.id}" /></td>
						<td><c:out value="${tempCustomer.firstName}" /></td>                       
						<td><c:out value="${tempCustomer.lastName}" /></td>					
						<td><c:out value="${tempCustomer.email}" /></td>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<br>
	<a href="/CustomerManagement">Go to Home Page</a>
</body>
</html>