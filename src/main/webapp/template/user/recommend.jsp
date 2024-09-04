<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="recommendation-form-container mt-4">
					<h4 class="font-weight-bold">We Value Your Feedback</h4>
					<p class="font-weight-bold text-muted">Share your thoughts with
						us.</p>
					<p class="font-weight-bold text-muted">Your feedback helps us
						improve!</p>
					<form action=property method="post" class="recommendation-form">
						<input type="hidden" name="mode" value="ADD_RECOMMEND">
						<div class="form-group">
							<label for="message" class="form-label">Message <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-envelope-paper"
									viewBox="0 0 16 16">
  <path
										d="M4 0a2 2 0 0 0-2 2v1.133l-.941.502A2 2 0 0 0 0 5.4V14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V5.4a2 2 0 0 0-1.059-1.765L14 3.133V2a2 2 0 0 0-2-2zm10 4.267.47.25A1 1 0 0 1 15 5.4v.817l-1 .6zm-1 3.15-3.75 2.25L8 8.917l-1.25.75L3 7.417V2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1zm-11-.6-1-.6V5.4a1 1 0 0 1 .53-.882L2 4.267zm13 .566v5.734l-4.778-2.867zm-.035 6.88A1 1 0 0 1 14 15H2a1 1 0 0 1-.965-.738L8 10.083zM1 13.116V7.383l4.778 2.867L1 13.117Z" />
</svg></label>
							<textarea id="message" name="message" class="form-control"
								rows="2" required></textarea>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">
								Post
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  <path
										d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z" />
</svg>
							</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">
								Close
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path
										d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
</svg>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




</body>
<style>
.recommendation-container {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
}

.recommendation-item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.recommendation-item:last-child {
	border-bottom: none;
}

.recommendation-item .card {
	border-radius: 5px;
}

.recommendation-item .card-body {
	padding: 15px;
}

.recommendation-form-container {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 20px;
}

.recommendation-form .form-group {
	margin-bottom: 15px;
}

.recommendation-form .form-label {
	margin-bottom: 5px;
	font-weight: bold;
}

.recommendation-form .form-control {
	border-radius: 5px;
	border: 1px solid #ced4da;
	padding: 10px;
}

.recommendation-form .btn-primary {
	background-color: #22575b;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-weight: bold;
}

.recommendation-form .btn-primary:hover {
	background-color: #1e4d4f;
}
</style>
</html>