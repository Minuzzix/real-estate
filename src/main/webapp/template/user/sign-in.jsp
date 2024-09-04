<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--  Head -->
<head>
<link href="static/css/style.css" rel="stylesheet">
</head>

<body>
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header navbarId" style="background-color: #22575b;">
				<h5 class="modal-title font-monospace" id="loginModalLabel"
					style="color: white;">Login Here <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  						<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
					</svg>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body detailsCard">
				<div class="card-body">
					<form action="login" method="post">
						<input type="hidden" name="mode" value="LOGIN">
							<div class="form-floating mb-4">
								<input type="text" class="form-control" id="username" name="username" required="required"> 
								<label for="username" class="form-label">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  										<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
									</svg> Username or email 
								</label>
							</div>
							<div class="form-floating mb-4">
								<input type="password" class="form-control" id="password" name="password" required="required"> 
								<label for="password" class="form-label">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
  										<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
									</svg> Password
								</label>
								<input type="checkbox" id="check" class="mt-3"><small class="text-muted"> Show Password</small>
							</div>
						<button type="submit" class="btn btn-success float-end">Login 
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  								<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
  								<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
							</svg>
						</button>
					</form>
					<p style="font-size: 0.8rem"> Doesn't have an account? Sign up 
						<a class="text-decoration-none text-muted " data-bs-toggle="modal" data-bs-dismiss="modal" data-bs-target="#userModal" href="user?mode=SIGNUP">here</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	const password = document.getElementById("password");
	const check = document.getElementById("check");
	
	check.onchange = function(e){
		password.type = check.checked ? "text" : "password";
	};
</script>
</html>