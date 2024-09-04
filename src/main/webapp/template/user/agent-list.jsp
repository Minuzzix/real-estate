<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<c:import url="../common/nav.jsp" />

 <div style="display: flex; justify-content: space-between; align-items: center;">
        <h3 class="font-monospace"></h3>
        <a type="button" class="btn-close me-5" aria-label="Close" href="property?mode=LIST"></a>
    </div>

<div class="container">
	<table id="agent" class="table table-hover" style="width: 100%">
		<thead style="background-color:#276569;" class="text-white">
			<tr>
				<th>No</th>
				<th>ID</th>
				<th>Username</th>
				<th>Email</th>
				<th>Phone</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${agentList}" varStatus="status">
				<tr>
					<th>${status.index + 1}</th>
					<th>A-${user.id }</th>
					<td>${user.username }</td>
					<td>${user.email }</td>
					<td>${user.phone }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

<c:import url="../common/footer.jsp" />

<script type="text/javascript">
	new DataTable('#agent');
</script>

</body>
</html>
