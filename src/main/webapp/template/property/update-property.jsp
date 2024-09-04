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
	<!-- Nav Bar -->
	
<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	<div class="modal-content detailsCard">
		<div class="modal-header navbarId">
			<h5 class="modal-title font-monospace" id="updateModalLabel">Update
				Form</h5>
			<button type="button" class="btn-close" data-dismiss="modal"
				aria-label="Close"></button>
		</div>

		<div class="modal-body mb-3 detailsCard">
			<div class="card-body">


				<form action="property" method="post" >
					<input type="hidden" name="mode" value="UPDATE"> <input
						type="hidden" name="propertyId" value="${property.id }">
					<div class="mb-3">
						<!--<label for="type" class="form-label">Type</label> <input
							type="text" class="form-control" id="type" name="type"
							value="${property.type}" required="required"> -->
						<label for="type" class="form-label">Property Type</label>
           							 <select id="type" name="type" class="form-select" >
               							 <option value="${property.type }">${property.type }</option>
               							 <option value="Apartment">Apartment</option>
                						 <option value="House">House</option>
                						 <option value="Villa">Villa</option>
                						 <option value="Condo">Condo</option>
            						</select>
					</div>
					<div class="mb-3">
							<label for="bedroom" class="form-label">Bedrooms</label>
            					<select id="bedroom" name="bedroom" class="form-select">
                					<option value="${property.bedroom }">${property.bedroom } Bedrooms</option>
                					<option value="1">1 Bedroom</option>
                					<option value="2">2 Bedrooms</option>
                					<option value="3">3 Bedrooms</option>
                					<option value="4">4+ Bedrooms</option>
            					</select>
						</div>
						<div class="mb-3">
							<label for="bathroom" class="form-label">Bathrooms</label>
            					<select id="bathroom" name="bathroom" class="form-select">
               	 					<option value="${property.bathroom }">${property.bathroom } Bathrooms</option>
                					<option value="1">1 Bathroom</option>
                					<option value="2">2 Bathrooms</option>
                					<option value="3">3 Bathrooms</option>
                					<option value="4">4+ Bathrooms</option>
            					</select>
						</div>
					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="text" class="form-control" id="price" name="price"
							value="${property.price}" required="required">
					</div>
					<div class="mb-3">
						<label for="address" class="form-label">Address</label> <input
							type="text" class="form-control" id="address" name="address"
							value="${property.address}" required="required">
					</div>
					<div class="mb-3">
							<label for="city" class="form-label">City</label> 
								<select id="city" name="city" class="form-select">
               							 <option value="${property.city }"> ${property.city }</option>
               							 <option value="Mandalay">Mandalay</option>
                						 <option value="Yangon">Yangon</option>
                						 <option value="NayPyiTaw">NayPyiTaw</option>
                						 <option value="Sagaing">Sagaing</option>
                						 <option value="PyinOoLwin">PyinOoLwin</option>
                						 <option value="TaungGyi">TaungGyi</option>
            					</select>
						</div> 
				 	<div class="mb-3">
						<label for="image" class="form-label">Image URL</label> <input
							type="url" class="form-control" id="image" name="image"
							value="${property.image}" required="required">
					</div> 
					
					<div class="mb-3">
						<label for="description" class="form-label">Description</label>
						<textarea rows="5" class="form-control" id="description"
							name="description" required="required">${property.description}</textarea>
					</div>
					
					<div class="mb-3">
							<label class="form-label">Features</label>
            					<div class="mb-2">
            					<c:choose>
									<c:when test="${property.garage }">
										<input type="checkbox" id="garage" name="garage" class="form-check-input" value="true" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="garage" name="garage" class="form-check-input" value="true">
									</c:otherwise>
								</c:choose>
									<label for="garage" class="form-check-label">With Garage</label>
            					</div>
            					
            					<div class="mb-2">
            					<c:choose>
									<c:when test="${property.pool }">
										<input type="checkbox" id="pool" name="pool" class="form-check-input" value="true" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="pool" name="pool" class="form-check-input" value="true">
									</c:otherwise>
								</c:choose>
									<label for="pool" class="form-check-label">With Pool</label>
            					</div>
            					
            					<div class="mb-2">
            					<c:choose>
									<c:when test="${property.garden }">
										<input type="checkbox" id="garden" name="garden" class="form-check-input" value="true" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="garden" name="garden" class="form-check-input" value="true">
									</c:otherwise>
								</c:choose>
									<label for="garden" class="form-check-label">With Garden</label>
            					</div>
            					
            					<div class="mb-2">
            					<c:choose>
									<c:when test="${property.gym }">
										<input type="checkbox" id="gym" name="gym" class="form-check-input" value="true" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="gym" name="gym" class="form-check-input" value="true">
									</c:otherwise>
								</c:choose>
									<label for="gym" class="form-check-label">With Gym</label>
            					</div>
						</div> 
					

	
					<button type="submit" class="btn btn-success float-end">Update</button>
					<a href="property?mode=SINGLE&propertyId=${property.id}" class="btn btn-secondary float-end me-2">Cancel</a>

				</form>
			</div>
		</div>
	</div>
</div>





</body>
</html>	