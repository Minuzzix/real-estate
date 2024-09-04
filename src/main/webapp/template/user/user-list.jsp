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
				
                <th>ID</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Username</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>CreatedAt</th>
                <th>Action</th>
                <th>Ban</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>M-${user.id}</td>
                    <td>${user.firstname}</td>
                    <td>${user.lastname}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.phone}</td>
                    <td>${user.createdAt}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.enable}">
                                <a href="agent?mode=DISABLE&userId=${user.id}" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
  <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
</svg> Active</a>
                            </c:when>
                            <c:otherwise>
                                <a href="agent?mode=ENABLE&userId=${user.id}" class="btn btn-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-dash" viewBox="0 0 16 16">
  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
  <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
</svg> Block</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    
                    <td>
    <form action="agent" method="get" class="ban-form">
        <input type="hidden" name="mode" value="BAN">
        <input type="hidden" name="userId" value="${user.id}">
        <select name="banMinutes" required>
            <option value="" disabled selected>Duration</option>
            <option value="1">1 Minute</option>
            <option value="10">10 Minutes</option>
            <option value="30">30 Minutes</option>
            <option value="45">45 Minutes</option>
            <option value="60">1 Hours</option>
        </select>
        <button type="submit" class="ban-button">Ban</button>
    </form>
</td>
                    
                </tr>
            </c:forEach>
        </tbody>
   <tfoot style="background-color:#276569;" class="text-white">
            <tr>
                <th>ID</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Username</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>CreatedAt</th>
                <th>Action</th>
                <th>Ban</th>
            </tr>
        </tfoot>
    </table>




	
	<script type="text/javascript">
	new DataTable('#example1');
	</script>
	

</body>
<style>
    .ban-form {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .ban-form select {
        padding: 5px;
        border-radius: 4px;
        border: 1px solid #ccc;
        font-size: 14px;
    }
    .ban-button {
        background-color: #808080;
        border: none;
        color: #fff;
        border-radius: 4px;
        padding: 5px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    .ban-button:hover {
        background-color: #FF0000;
    }
</style>
</html>