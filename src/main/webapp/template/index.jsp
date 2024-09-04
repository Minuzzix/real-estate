<!DOCTYPE html>
<html>
<head>
<title>real-estate</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:import url="common/header.jsp" />
<link href="static/css/style.css" rel="stylesheet">
<script src="static/js/script.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body style="background-color: #D3D3D3;">
	<c:import url="common/nav.jsp" />

	<c:if test="${not empty loginOk}">
		<c:choose>
			<c:when test="${loginOk}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					Logged in to your account
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:when>
			<c:when test="${loginError}">
				<div
					class="alert alert-danger alert-dismissible fade show text-center"
					role="alert">
					${loginError }
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:when>
			<c:otherwise>
				<div
					class="alert alert-danger alert-dismissible fade show text-center"
					role="alert">
					Username or password is incorrect.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${not empty insertOk}">
		<c:choose>
			<c:when test="${insertOk}">
				<div
					class="alert alert-success alert-dismissible fade show text-center"
					role="alert">
					Successfully created form
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					Fail
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${not empty signUpOk}">
		<c:choose>
			<c:when test="${signUpOk}">
				<div
					class="alert alert-success alert-dismissible fade show text-center"
					role="alert">
					Successfully created Account
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:when>
			<c:when test="${not empty errorMessage}">
				<div
					class="alert alert-danger alert-dismissible fade show text-center"
					role="alert">
					${errorMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:when>
			<c:otherwise>
				<div
					class="alert alert-danger alert-dismissible fade show text-center"
					role="alert">
					Registration Failed! Email is already taken or Invalid Email!
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed"
					style="background-color: #276569;" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
					aria-expanded="false" aria-controls="flush-collapseOne">
					<strong class="text-white" style="text-left:200px;"> Advanced Search <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  							<path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
							</svg></strong>
				</button>
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse"
				aria-labelledby="flush-headingOne"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body" style="background-color: #D3D3D3;">

					<form action="property" method="get" class="row g-3">
						<input type="hidden" name="mode" value="ADVANCED_SEARCH">
						<div class="col-md-2">
							<label for="type" class="form-label">Type:</label> <select
								id="type" name="type" class="form-select">
								<option value="">Select Type</option>
								<option value="Apartment">Apartment</option>
								<option value="House">House</option>
								<option value="Villa">Villa</option>
								<option value="Condo">Condo</option>
							</select>
						</div>

						<div class="col-md-2">
							<label for="city" class="form-label">City:</label> <select
								id="city" name="city" class="form-select">
								<option value="">Select City</option>
								<option value="Mandalay">Mandalay</option>
								<option value="Yangon">Yangon</option>
								<option value="NayPyiTaw">NayPyiTaw</option>
								<option value="Sagaing">Sagaing</option>
								<option value="PyinOoLwin">PyinOoLwin</option>
								<option value="TaungGyi">TaungGyi</option>
							</select>
						</div>
						<div class="col-md-2">
							<label for="address" class="form-label">Address:</label> <input
								type="text" id="address" name="address" class="form-control">
						</div>
						<div class="col-md-2">
							<label for="minPrice" class="form-label">Min Price:</label> <input
								type="number" id="minPrice" name="minPrice" class="form-control">
						</div>
						<div class="col-md-2">
							<label for="maxPrice" class="form-label">Max Price:</label> <input
								type="number" id="maxPrice" name="maxPrice" class="form-control">
						</div>
						<!--   <div class="col-md-2">
                                	<label for="bedroom" class="form-label">Bedrooms:</label>
    								<input type="number" id="bedroom" name="bedroom" class="form-control">
    							</div>
    							<div class="col-md-2">
    								<label for="bathroom" class="form-label">Bathrooms:</label>
    								<input type="number" id="bathroom" name="bathroom" class="form-control">
    							</div> -->
						<!--<div class="col-md-1">
    								<label for="garage">Garage:</label>
    								<input type="checkbox" id="garage" name="garage" class="mt-3">
    								<label for="pool" class="ms-3">Pool:</label>
    								<input type="checkbox" id="pool" name="pool" class="mt-3">
    								
    							</div>
    							<div class="col-md-1">
    								<label for="garden">Garden:</label>
    								<input type="checkbox" id="garden" name="garden" class="mt-3">
    								<label for="gym" class="ms-3">Gym:</label>
    								<input type="checkbox" id="gym" name="gym" class="mt-3">
    							</div>-->


						<div class="col-md-2 d-flex align-items-end">
							<button type="submit" style="background-color: #22575b;"
								class="btn text-white">
								Filter
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
  									<path
										d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2z" />
									</svg>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed"
						style="background-color: #276569;"
						button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">
						<strong class="mb-2 text-white">List Properties <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-list-ol" viewBox="0 0 16 16">
  									<path fill-rule="evenodd"
									d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5" />
  									<path
									d="M1.713 11.865v-.474H2c.217 0 .363-.137.363-.317 0-.185-.158-.31-.361-.31-.223 0-.367.152-.373.31h-.59c.016-.467.373-.787.986-.787.588-.002.954.291.957.703a.595.595 0 0 1-.492.594v.033a.615.615 0 0 1 .569.631c.003.533-.502.8-1.051.8-.656 0-1-.37-1.008-.794h.582c.008.178.186.306.422.309.254 0 .424-.145.422-.35-.002-.195-.155-.348-.414-.348h-.3zm-.004-4.699h-.604v-.035c0-.408.295-.844.958-.844.583 0 .96.326.96.756 0 .389-.257.617-.476.848l-.537.572v.03h1.054V9H1.143v-.395l.957-.99c.138-.142.293-.304.293-.508 0-.18-.147-.32-.342-.32a.33.33 0 0 0-.342.338zM2.564 5h-.635V2.924h-.031l-.598.42v-.567l.629-.443h.635z" />
									</svg></strong>
					</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body search-results"
						style="background-color: #D3D3D3;">
						<c:if test="${not empty propertyList}">
							<ul>
								<c:forEach var="property" items="${propertyList}">
									<li><strong class="" style="color: #22575b;">Type <i class="fa-solid fa-building" style="color: #22575b;"></i> :</strong> ${property.type} <br> 
										<strong class="" style="color: #22575b;"> Price <i class="fa-solid fa-tags" style="color: #22575b;"></i> : </strong>$${property.price} <br>
										<strong class="" style="color: #22575b;">Address <i class="fa-solid fa-location-dot" style="color: #22575b;"></i> : </strong> ${property.address} ,
										 ${property.city} <a
										href="property?mode=SINGLE&propertyId=${property.id}"
										class=" btn-sm text-decoration-none">more details <svg
												xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-three-dots-vertical"
												viewBox="0 0 16 16">
  												<path
													d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0m0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0" />
											</svg></a>
									</li>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${empty propertyList}">
							<h4 class="text-danger">No properties found matching your criteria.</h4>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="map-container">
		<iframe class="position-relative rounded w-100"
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7450.176053438841!2d96.0790057226678!3d21.97174625329345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30cb72b8ac03c14b%3A0x6b27a6e68c11183c!2sMandalay%2C%20Myanmar%20(Burma)!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
			frameborder="0" allowfullscreen="" aria-hidden="false" tabindex="0"
			title="Google Maps Location"></iframe>
	</div>


	<div class="row mt-4 mb-3">
			<h2 class="font-weight-bold text-center">Properties</h2>
		</div>

	<div class="container">
		<div id="propertyCarousel" class="carousel slide"
			data-bs-ride="carousel">

			<div class="carousel-inner">
				<c:forEach var="property" items="${propertyList}" varStatus="loop">
					<c:if test="${loop.index % 4 == 0}">
						<div class="carousel-item${loop.index == 0 ? ' active' : ''}">
							<div class="row">
					</c:if>



					<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 mb-4">
						<div class="card list-card shadow-lg bg-body mb-3 h-100">
							<div class="card-img-container position-relative">
								<img src="${property.image}"
									class="card-img-top list-card-image" alt="${property.type}">
								<c:if test="${property.status == 'sold out'}">
									<div class="sold-out-overlay">
										<span class="sold-out-text">Sold Out</span>
									</div>
								</c:if>
							</div>
							<div class="card-body text-center">
								<h5 class="card-title" style="color: #22575b;">
									<i class="fa-solid fa-building" style="color: #22575b;"></i>
									${property.type}
								</h5>
								<p class="card-text" style="color: #22575b;">
									<i class="fa-solid fa-tags" style="color: #22575b;"></i> $
									${property.price}
								</p>
								<p class="card-text" style="color: #22575b;">
									<i class="fa-solid fa-location-dot" style="color: #22575b;"></i>
									</i> ${property.city}
								</p>
								<p class="card-text" style="color: #22575b;">
									<i class="fa-solid fa-bed" style="color: #22575b;"></i> :
									${property.bedroom} / <i class="fa-solid fa-bath"
										style="color: #22575b;"></i> : ${property.bathroom}
								</p>

								<a href="javascript:void(0);"
									onclick="showDetails(${property.id})"
									style="background-color: #22575b; color: #ffffff"
									class="detailsClass btn btn-white">Details <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-caret-down-fill"
										viewBox="0 0 16 16">
  <path
											d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
</svg></a>
							</div>
						</div>
					</div>

					<c:if test="${loop.index % 4 == 3 || loop.last}">
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>

	<button class="carousel-control-prev" type="button"
		data-bs-target="#propertyCarousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#propertyCarousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
	</div>
	</div>

	<div id="carouselExampleSlidesOnly" class="carousel slide mt-4"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="ad-box container mb-4">
					<div class="row">
						<div class="col-6">

							<div class="row">
								<div class="col-md-4">
									<img
										src="https://storage.pixteller.com/designs/designs-videos/1601877-5ccd7a847f751/thumb.gif"
										class="img-fluid rounded" alt="Ad Image">
								</div>
								<div class="col-md-8 d-flex flex-column justify-content-center">
									<h3 class="ad-title">Discover Your Dream Home</h3>
									<p class="ad-text">Explore the finest properties in your
										area with amazing discounts and offers. Don't miss out on the
										opportunity to own your dream home.</p>
									<a href="javascript:void(0);" class="btn btn-primary mt-2"
										style="background-color: #22575b; color: #ffffff;">Learn
										More</a>
								</div>
							</div>

						</div>
						<div class="col-6">

							<div class="row">
								<div class="col-md-4">
									<img
										src="https://images-platform.99static.com/3klCtMPXvxXy1JWakRILZLyQKAc=/0x0:960x960/500x500/top/smart/99designs-contests-attachments/92/92811/attachment_92811544"
										class="img-fluid rounded" alt="Advertisement 1">
								</div>
								<div class="col-md-8 d-flex flex-column justify-content-center">
									<h3 class="ad-title">Special Offer on Listings!</h3>
									<p class="ad-text">Get a 20% discount on our premium
										listings. Don't miss out on this limited-time offer to find
										your dream property at an unbeatable price!</p>
									<a href="javascript:void(0);" class="btn btn-primary mt-2"
										style="background-color: #22575b; color: #ffffff;">Learn
										More</a>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
			<div class="carousel-item">

				<div class="ad-box container mb-4">
					<div class="row">
						<div class="col-6">

							<div class="row">
								<div class="col-md-4">
									<img
										src="https://rodolfogrimaldi.com/wp-content/uploads/2014/02/Your-Ad-Here.gif"
										class="img-fluid rounded" alt="Ad Image">
								</div>
								<div class="col-md-8 d-flex flex-column justify-content-center">
									<h3 class="ad-title">Advertise Ad Here!</h3>
									<p class="ad-text">Contact us +95 9954167865</p>
									<a href="javascript:void(0);" class="btn btn-primary mt-2"
										style="background-color: #22575b; color: #ffffff;">Learn
										More</a>
								</div>
							</div>

						</div>

						<div class="col-6">

							<div class="row">
								<div class="col-md-4">
									<img
										src="https://rodolfogrimaldi.com/wp-content/uploads/2014/02/Your-Ad-Here.gif"
										class="img-fluid rounded" alt="Advertisement 1">
								</div>
								<div class="col-md-8 d-flex flex-column justify-content-center">
									<h3 class="ad-title">Advertise Ad Here!</h3>
									<p class="ad-text">Contact us +95 9954167865</p>
									<a href="javascript:void(0);" class="btn btn-primary mt-2"
										style="background-color: #22575b; color: #ffffff;">Learn
										More</a>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Recommendation Section -->
	<div class="container mt-5">
		<div class="row">
			<div class="col-12 text-center">
				<h2 class="font-weight-bold">
					Recommend Us
					<c:choose>
						<c:when test="${empty sessionScope.user }">

							<a class=" btn btn-secondary me-3" data-bs-toggle="modal"
								data-bs-target="#loginModal" href="login?mode=LOGIN_FORM"
								style="background-color: #22575b;" data-bs-toggle="tooltip"
								data-bs-placement="top" title="recommend Us"><i
								class="fa-solid fa-envelope-open-text"></i> </a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-secondary me-3" data-bs-toggle="modal"
								data-bs-target="#recommendModal"
								href="property?mode=VIEW_RECOMMEND"
								style="background-color: #22575b;" data-bs-toggle="tooltip"
								data-bs-placement="top" title="recommend Us"><i
								class="fa-solid fa-envelope-open-text"></i></a>
						</c:otherwise>
					</c:choose>
				</h2>

				<div id="recommendationCarousel" class="carousel slide mt-4"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach var="property" items="${recommendations}"
							varStatus="loop">
							<c:if test="${loop.index % 4 == 0}">
								<div class="carousel-item${loop.index == 0 ? ' active' : ''}">
									<div class="row">
							</c:if>

							<div class="col-md-3 col-lg-3 mb-4">
								<div class="card h-100 shadow">
									<div class="card-body">
										<h6 class="card-title">${property.message}</h6>
										<p class="card-text">
											<small class="text-muted">Post by:
												@${property.username}</small>
										</p>
										<p class="card-text">
											<small class="text-muted">Date: ${property.sendAt}</small>
										</p>
									</div>
								</div>
							</div>

							<c:if test="${loop.index % 4 == 3 || loop.last}">
					</div>
				</div>
				</c:if>
				</c:forEach>
			</div>

			<!--   <button class="carousel-control-prev" type="button" data-bs-target="#recommendationCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#recommendationCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button> -->
		</div>
	</div>
	</div>
	</div>


	<!-- Recommend -->
	<div class="modal fade" id="recommendModal" tabindex="-1"
		aria-labelledby="recommendModalLabel" aria-hidden="true">
		<c:import url="/template/user/recommend.jsp" />
	</div>


	<c:import url="common/footer.jsp" />
</body>

<script>
    function showDetails(propertyId) {
        window.location.href = "property?mode=SINGLE&propertyId=" + propertyId;
    }
</script>

<style>
.carousel-control-prev, .carousel-control-next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 30px;
	height: 30px;
	z-index: 1000;
	border: none;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.carousel-control-prev {
	left: -40px;
}

.carousel-control-next {
	right: -40px;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	color: #000;
	background-color: #22575b;
}

.map-container iframe {
	width: 100%;
	height: 500px;
	border: 0;
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	transition: transform 0.3s, box-shadow 0.3s;
}

.card-img-container {
	position: relative;
	height: 300px;
}

.card-img-top {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.sold-out-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255, 0, 0, 0.5);
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 1;
	text-align: center;
}

.sold-out-text {
	font-size: 2rem;
	color: white;
	font-weight: bold;
	text-transform: uppercase;
	text-shadow: 1px 1px 2px black;
}

.card-body {
	padding: 1rem;
	flex: 1;
}

.card-title, .card-text {
	margin: 0.5rem 0;
}

.card-group {
	margin-bottom: 1rem;
}

.btn-close {
	padding: 0.75rem;
	margin-left: auto;
	color: inherit;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.card img, .card .card-body {
	transition: transform 0.3s, box-shadow 0.3s;
}

.detailsClass {
	margin-top: 10px;
}

.ad-box {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 8px; 
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
	overflow: hidden;
	transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.ad-box:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px); 
}

.ad-box img {
	max-width: 100%;
	height: auto;
	border-radius: 5px;
	margin-bottom: 15px; 
}

.ad-box h3 {
	margin-top: 0;
	font-size: 1.75rem; 
	color: #333;
}

.ad-box p {
	margin: 10px 0;
	color: #666;
}

.ad-box .btn {
	margin-top: 10px;
	border-radius: 25px; 
	padding: 10px 20px;
	background-color: #22575b;
	color: #ffffff;
	border: none;
	transition: background-color 0.3s ease;
	
}

.ad-box .btn:hover {
	background-color: #1e4a50; 
}

.filter-form-container {
	padding: 20px;
	margin-bottom: 20px;
}

.filter-form {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
}

.filter-form .form-group {
	flex: 1;
	min-width: 200px;
}

.filter-form .form-label {
	margin-bottom: 5px;
	font-weight: bold;
}

.filter-form .form-control {
	border-radius: 5px;
	border: 1px solid #ced4da;
	padding: 10px;
}

.filter-form .form-select {
	border-radius: 5px;
	border: 1px solid #ced4da;
	padding: 10px;
}

.filter-form .btn {
	background-color: #22575b;
	color: #ffffff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-weight: bold;
}

.filter-form .btn:hover {
	background-color: #ffffff;
}

@media ( max-width : 767px) {
	.filter-form {
		flex-direction: column;
	}
	.filter-form .form-group {
		flex: none;
		width: 100%;
	}
}

.search-form {
	padding: 20px;
}

.search-form label {
	margin-top: 10px;
}

.search-results ul {
	list-style-type: none;
	padding: 0;
}

.search-results li {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

.search-results a {
	float: right;
}
</style>

</html>
