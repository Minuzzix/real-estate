<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	type="text/javascript"></script>
<link
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<meta charset="ISO-8859-1">

</head>
<body style="background-color: #D3D3D3;">

	<div class="container">
		<table id="cancel" class="table table-hover" style="width: 100%">
			<thead style="background-color:#276569;" class="text-white">
				<tr>
					<th>No</th>
					<th>Buyer ID</th>
					<th>Buyer Name</th>
					<th>Property ID</th>
					<th>Date</th>
					<th>Declined By</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="buy" items="${declinedBuy}"
					varStatus="status">
					


					<tr>
						<th scope="row">${status.index + 1}</th>
						<td>M-${buy.user_id}</td>
						<td>${buy.username}</td>
						<td>P-${buy.property_id} <a href="${pageContext.request.contextPath}/property?mode=SINGLE&propertyId=${buy.property_id}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="19" fill="currentColor" class="bi bi-eye-fill" style="color: #22575b;" viewBox="0 0 15 16">
  									<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
  									<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
								</svg> </a></td>
						<td>${buy.buyDate}</td>
						<td>${buy.declinedBy}</td>
					</tr>
				</c:forEach>
			</tbody>
			</tbody>
			<tfoot style="background-color:#276569;" class="text-white">
				<tr>
					<th>No</th>
					<th>Buyer ID</th>
					<th>Buyer Name</th>
					<th>Property ID</th>
					<th>Date</th>
					<th>Declined By</th>
				</tr>
			</tfoot>




		</table>
	</div>




	<script type="text/javascript">
	new DataTable('#cancel');
	</script>

</body>
</html>
