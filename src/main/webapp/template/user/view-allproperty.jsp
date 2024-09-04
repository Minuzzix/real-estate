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


	
					<table id="example1" class="table table-hover" style="width: 100%">
        <thead style="background-color:#276569;" class="text-white">
           <tr>
								<th >No</th>
								<th>ID</th>
								<th>Owner</th>
								<th >Type</th>
								<th >Price</th>
								<th >Address</th>
								<th>City</th>
								<th >Date</th>
								<th >Description</th>
								<th>Status</th>
								<th >Image</th>
								<th >Delete</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="property" items="${allPropertyList}"
								varStatus="status">


								<tr>
									<th scope="row">${status.index + 1}</th>
									<td>P-${property.id } <a href="${pageContext.request.contextPath}/property?mode=SINGLE&propertyId=${property.id}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="19" fill="currentColor" class="bi bi-eye-fill" style="color: #22575b;" viewBox="0 0 15 16">
  									<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
  									<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
								</svg> </a></td>
									<th>${property.createdUser }</th>
									<td>${property.type}</td>
									<td>${property.price}</td>
									<td>${property.address}</td>
									<td>${property.city }</td>
									<td>${property.date}</td>
									<td>${property.description}</td>
									<td style="color:#FF0000">${property.status }</td>
									<td><img src="${property.image}" alt="Property Image"
										width="100" /></td>

									<td><a
										href="property?mode=DELETE&propertyId=${property.id}"
										class="btn btn-danger"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
  <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
</svg> </a></td>




								</tr>
							</c:forEach>
						</tbody>
        
        <tfoot style="background-color:#276569;" class="text-white">
            <tr>
                				<th >No</th>
								<th>ID</th>
								<th>Owner</th>
								<th >Type</th>
								<th >Price</th>
								<th >Address</th>
								<th>City</th>
								<th >Date</th>
								<th >Description</th>
								<th>Status</th>
								<th >Image</th>
								<th >Delete</th>
            </tr>
        </tfoot>
    </table>




	
	<script type="text/javascript">
	new DataTable('#example1');
	</script>

</body>
</html> 