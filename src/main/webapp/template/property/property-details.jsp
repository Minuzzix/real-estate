<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--  Head -->
<head>
<c:import url="../common/header.jsp" />
<link href="../static/css/style.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 
</head>

<body style="background-color: #D3D3D3;">
	<!-- Nav Bar -->
	<c:import url="../common/nav.jsp" />


	<c:if test="${insertOk}">
		<div
			class="row alert alert-success alert-dismissible fade show text-center"
			role="alert">
			Successfully submitted. Your buying property is in Agent Pending
			List. Please Wait!!!
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</c:if>
	
	<c:if test="${not empty updateOk and not updateOk }">
					<div class="alert alert-danger" role="alert">Failed!!!</div>
				</c:if>


	<!-- property details card -->
	<div class="container">
		<div class="row">
			<div class="row g-0 mt-3">
				<div class="col-md-6 position-relative">
					<img src="${property.image }" class="img-fluid rounded-start"
						alt="${property.type }">
						
	<input type="hidden" value="${property.favorite}">
	<!-- Favorite -->
	<c:if test="${not empty currentUser}">
    <c:choose>
        <c:when test="${property.favorite}">
            <form action="favorite" method="post" class="favorite-button">
                <input type="hidden" name="mode" value="REMOVE">
                <input type="hidden" name="propertyId" value="${property.id}">
                <button type="submit" class="btn btn-success circle-button" style="background-color: #22575b;" data-bs-toggle="tooltip" data-bs-placement="top" title="remove">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
                    </svg>
                </button>
            </form>
        </c:when>
        <c:otherwise>
            <form action="favorite" method="post" class="favorite-button">
                <input type="hidden" name="mode" value="ADD">
                <input type="hidden" name="propertyId" value="${property.id}">
                <button type="submit" class="btn btn-success circle-button" style="background-color: #22575b;" data-bs-toggle="tooltip" data-bs-placement="top" title="Favorite">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                    </svg>
                </button>
            </form>
        </c:otherwise>
   	 </c:choose>
	</c:if>
</div>
				
				<div class="col-md-6">
					<div class="card-body">
						<h3 class="card-title">Type : <i class="fa-solid fa-building" style="color: #22575b;"></i> ${ property.type }</h3>
						<hr>
						
						<p class="card-text">
							Price <i class="fa-solid fa-tags" style="color: #22575b;"></i> : $ ${property.price }
						</p>
						<p class="card-text">
							Garage <i class="fa-solid fa-warehouse" style="color: #22575b;"></i>  : ${property.garage ? 'Yes' : 'No' } /
							
							Pool <i class="fa-solid fa-person-swimming" style="color: #22575b;"></i>  : ${property.pool ? 'Yes' : 'No'}
						</p>
						
						<p class="card-text">
							Garden <i class="fa-solid fa-tree" style="color: #22575b;"></i>  :  ${property.garden ? 'Yes' : 'No'} /
							
							Gym <i class="fa-solid fa-dumbbell" style="color: #22575b;"></i>  : ${property.gym ? 'Yes' : 'No'}
						</p>
						
						<h5 class="card-text">
							<i class="fa-solid fa-bed" style="color: #22575b;"></i> : ${property.bedroom } /
							<i class="fa-solid fa-bath" style="color: #22575b;"></i> : ${property.bathroom }
						</h5>
						<p class="card-text">
							Address <i class="fa-solid fa-location-dot" style="color: #22575b;"></i>  :  ${property.address }
						</p>
						<hr>
						
						<p class="card-text">
							City  :  ${property.city }
						</p>
						<p class="card-text">
							Date : ${property.date }
						</p>
						<p class="card-text">
							Image : ${property.image }
						</p>
						<p class="card-text">
							Description : ${property.description }
						</p>
						<c:if test="${user.role == 'agent' }">
							<h5 class="card-text">
							<b>Owner Id- </b> M-${property.user_id}
						</h5>
						<h5 class="card-text">
							<b>Owner Name- </b> ${property.createdUser}
						</h5>
						<!--  <h5 class="card-text">
							<b>Buyer Name- </b> ${buy.username}
						</h5> -->
						</c:if>
						
						
						<p class="card-text">

							<!-- buy -->
							<c:if
								test="${property.status == 'sold out'}">
								<h3 style="color: red;" class="mt-5">Sold Out</h3>
							</c:if>
							<c:if
								test="${property.status != 'sold out' && not empty currentUser}">
								<form action="buy" method="post" class="buy-button">
									<input type="hidden" name="mode" value="ADD"> <input
										type="hidden" name="propertyId" value="${property.id}">
									<button type="submit" class="btn btn-success mt-5">Buy <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
</svg></button>
								</form>
							</c:if>
							<c:if test="${ empty currentUser && property.status != 'sold out' }">
								<a class="btn btn-warning mt-5" data-bs-toggle="modal" data-bs-target="#loginModal" href="login?mode=LOGIN_FORM">Please Login or SignUp to buy</a>
							</c:if>
						</p>



						<c:if test="${currentUser.id == property.user_id && property.status != 'sold out'}">
							<c:url var="updateLink" value="property">
								<c:param name="mode" value="LOAD" />
								<c:param name="propertyId" value="${property.id }" />
							</c:url>
							<button type="button" class="btn btn-success float-start"
								data-toggle="modal" data-target="#updateModal">
								
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-file-earmark-arrow-up-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M6.354 9.854a.5.5 0 0 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 8.707V12.5a.5.5 0 0 1-1 0V8.707z" />
                                </svg>
								Update
							</button>
							<c:url var="deleteLink" value="property">
								<c:param name="mode" value="DELETE" />
								<c:param name="propertyId" value="${property.id }" />
							</c:url>
							<button type="button" class="btn btn-secondary float-end"
								data-toggle="modal" data-target="#deleteModal">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-trash3-fill"
									viewBox="0 0 16 16">
                                    <path
										d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5" />
                                </svg>
								Delete
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div>
		<a class=" btn btn-secondary ms-4 mt-3" href="property"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
  <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
</svg> Back</a>

	</div>

	<!-- Update properties -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="updateModalLabel" aria-hidden="true">
		<c:import url="/template/property/update-property.jsp" />
	</div>



	<!-- Delete confirmation -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<!-- delete -->
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header navbarId">
					<h5 class="modal-title font-monospace" id="deleteModalLabel">Confirm
						Deletion !</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body detailsCard">Are you sure you want to
					delete this property ?</div>
				<div class="modal-footer detailsCard">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
					<a href="${deleteLink}" class="btn btn-danger">Yes</a>
				</div>
			</div>
		</div>
	</div>


	<!-- login  -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<c:import url="/template/user/sign-in.jsp" />
	</div>



	<!-- footer -->
	<c:import url="../common/footer.jsp" />

</body>
<style>
.favorite-button {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 1;
}

.circle-button {
	border-radius: 50%;
	width: 35px;
	height: 35px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0;
}

.hidden {
    display: none;
  }
</style>


</html>