<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header navbarId" style="background-color: #22575b;">
				<h5 class="modal-title font-monospace" id="profileEditModalLabel"
					style="color: white;">Update Profile <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  						<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
					</svg>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>

			<div class="modal-body detailsCard">
        <div class="card-body">
            <h5 class="card-title">Profile Information</h5>
            <form action="user" method="post">
                <input type="hidden" name="mode" value="EDIT_PROFILE">
               <input type="hidden" name="userId" value="${user.id }">
                <div class="mb-3">
                    <label for="firstName" class="form-label">Firstname</label>
                    <input type="text" class="form-control" id="firstName" name="firstname" value="${user.firstname}" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Lastname</label>
                    <input type="text" class="form-control" id="lastName" name="lastname" value="${user.lastname}" required>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                </div>
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile Number</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" value="${user.phone}" required>
                </div>
                <button type="submit" class="btn btn-primary">Done</button>
            </form>
            <a href="property?mode=LIST" class="btn btn-secondary float-end me-2">Cancel</a>
        </div>
    </div>

    
</div>
</div>


</body>
</html>