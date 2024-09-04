<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
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
	<c:import url="../common/nav.jsp" />


	<!-- <div
		style="display: flex; justify-content: space-between; align-items: center;">
		<h3 class=" font-monospace"></h3>
		<a type="button" class="btn-close me-5" aria-label="Close"
			href="property?mode=LIST"></a>
	</div>-->


	
	<div class="container">
		<table id="favorite" class="table table-hover" style="width: 100%">
			<thead style="background-color:#276569;" class="text-white">
				<tr>
					<th>No</th>
					<th>Type</th>
					<th>Price</th>
					<th>Address</th>
					<th>City</th>
					<th>Date</th>
					<th>Description</th>
					<th>Image</th>
					<th>View</th>
					<th>Remove</th>
		        	


				</tr>
			</thead>
			<tbody>

				<c:forEach var="property" items="${favoriteList}" varStatus="status">


					<tr>
						<td scope="row">${status.index + 1}</td>
						<td>${property.type}</td>
						<td>${property.price}</td>
						<td>${property.address}</td>
						<td>${property.city}</td>
						<td>${property.date}</td>
						<td>${property.description }</td>
						<td><img src="${property.image}" alt="Property Image"
							width="100" /></td>
						<td>
							<a href="property?mode=SINGLE&propertyId=${property.id}" class="btn btn-success">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  									<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
  									<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
								</svg>  </a>
						</td>
					  	<td>
							<form action="${pageContext.request.contextPath}/favorite"
								method="post">
								<input type="hidden" name="mode" value="REMOVE"> <input
									type="hidden" name="propertyId" value="${property.id}">
								<button type="submit" class="btn btn-danger"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                 <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                               </svg> </button>
							</form>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
			</tbody>
			<tfoot style="background-color:#276569;" class="text-white">
				<tr>
					<th>No</th>
					<th>Type</th>
					<th>Price</th>
					<th>Address</th>
					<th>City</th>
					<th>Date</th>
					<th>Description</th>
					<th>Image</th>
					<th>View</th>
					<th>Remove</th>

				</tr>
			</tfoot>
		</table>
	</div>




	<c:import url="../common/footer.jsp" />
	<script type="text/javascript">
	new DataTable('#favorite');
	</script>

</body>
</html>
