<!DOCTYPE html>
<html>
<head>
    <link href="static/css/style.css" rel="stylesheet">
</head>
<body>
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header navbarId" style="background-color: #22575b;">
                <h5 class="modal-title font-monospace text-large" id="userModalLabel" style="color: white;">REGISTER FORM <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
  <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
</svg></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body detailsCard">
                <div class="card-body">
                    <form action="user" method="post">
                        <input type="hidden" name="mode" value="SIGNUP">
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="firstname" name="firstname" required="required">
                            <label for="firstname">Firstname</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="lastname" name="lastname" required="required">
                            <label for="lastname">Lastname</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="username1" name="username1" required="required">
                            <label for="username1">Username</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="email1" name="email1" required="required">
                            <label for="email1">Email</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="mobile" name="mobile" required="required">
                            <label for="mobile">Mobile number</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input type="password" class="form-control" id="password1" name="password1" required="required">
                            <label for="password1">Password</label>
                        </div>
                       <!--   <div class="form-floating mb-4">
    						<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required="required">
    						<label for="confirmPassword">Confirm Password</label>
						</div>-->
                        <button type="submit" class="btn btn-success float-end">SignUp <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
</svg></button>
                    </form>
                    <p style="font-size: 0.8rem">
                        Already have an account? Sign in <a class="text-decoration-none text-muted" data-bs-toggle="modal"
                            data-bs-dismiss="modal" data-bs-target="#loginModal" href="login?mode=LOGIN_FORM">here</a>
                    </p>
                </div>
            </div>
            <!-- <div class="modal-footer detailsCard">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>  -->
        </div>
    </div>
</body>

<style>
.modal-header {
    border-bottom: none;
}
.modal-title {
    font-size: 1.5rem;
	font-weight: bold;
}
.modal-content {
	border-radius: 1rem;
	overflow: hidden;
}
.modal-body {
	padding: 2rem;
}
.form-floating input {
	border-radius: 0.5rem;
}
.btn-success {
	border-radius: 0.5rem;
   	font-weight: bold;
}
.btn-close {
  	filter: invert(1);
}
.detailsCard {
  	background-color: #f7f9fa;
}
.modal-footer {
   	border-top: none;
}
</style>
</html>
