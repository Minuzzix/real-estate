<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <c:import url="../common/header.jsp" />
    <script src="https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <meta charset="ISO-8859-1">
</head>
<body style="background-color: #D3D3D3;">
    <c:import url="../common/nav.jsp" />

    <!--  <div style="display: flex; justify-content: space-between; align-items: center;">
        <h3 class="font-monospace">Buy List</h3>
        <a type="button" class="btn-close me-5" aria-label="Close" href="property?mode=LIST"></a>
    </div> -->

    <div class="container">
        <table id="buy" class="table table-hover" style="width: 100%">
            <thead style="background-color:#276569;" class="text-white">
                <tr>
                    <th>No</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Description</th>
                    <th>View</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="property" items="${buy}" varStatus="status">
                    <tr>
                        <th scope="row">${status.index + 1}</th>
                        <td>${property.type}</td>
                        <td>${property.price}</td>
                        <td>${property.address}</td>
                        <td>${property.city}</td>
                        <td>${property.description}</td>
                        <td>
							<a href="property?mode=SINGLE&propertyId=${property.id}" class="btn btn-success">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
</svg> View </a>
						</td>
                        <td><img src="${property.image}" alt="Property Image" width="100" /></td>
                    </tr>
                </c:forEach>
            </tbody>
            <tfoot style="background-color:#276569;" class="text-white">
                <tr>
                    <th>No</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Description</th>
                    <th>View</th>
                    <th>Image</th>
                </tr>
            </tfoot>
        </table>
    </div>

    <c:import url="../common/footer.jsp" />
    <script type="text/javascript">
        new DataTable('#buy');
    </script>
</body>
</html>
