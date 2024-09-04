<%@taglib uri="jakarta.tags.core" prefix="c"%>
 <nav class="navbar navbar-expand-xxl navbar-light shadow-lg" style="background-color:#22575b;">
	<div class="container-fluid mb-2 ">
	<!-- Home Logo -->
		<a class="navbar-brand  fs-5 ms-3" style="color: white;" href="property">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-buildings" viewBox="0 0 16 16">
  				<path d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022M6 8.694 1 10.36V15h5zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5z"/>
  				<path d="M2 11h1v1H2zm2 0h1v1H4zm-2 2h1v1H2zm2 0h1v1H4zm4-4h1v1H8zm2 0h1v1h-1zm-2 2h1v1H8zm2 0h1v1h-1zm2-2h1v1h-1zm0 2h1v1h-1zM8 7h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zM8 5h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zm0-2h1v1h-1z"/>
			</svg>
		</a>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
			 <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-5 ">
				<!-- Add Home -->
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<a class="nav-link active" data-bs-toggle="modal" data-bs-target="#loginModal" href="#" style="color: white;">Add Homes
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
                                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z" />
                                <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5" />
                            </svg>
                        </a>
					</c:when>
					
					<c:otherwise>
						<a class="nav-link active" data-bs-toggle="modal" data-bs-target="#addModal" href="#" style="color: white;">Add Homes
						     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16">
                                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z" />
                                <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5" />
                             </svg> 
                        </a>
                    </c:otherwise>
                </c:choose>
             
             	<!-- User -->
				<c:if test="${not empty sessionScope.user}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle ms-3" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						   	<span class="rounded-circle bg-secondary text-white px-3 py-2">${user.username.charAt(0)}</span>
						</a>
						
						
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li>
								<a class="dropdown-item" href="user?mode=VIEW_PROFILE">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    	<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                                    	<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
                                	</svg> View Profile
                                </a>
								<li><hr class="dropdown-divider"></li>

							<li><a class="dropdown-item" href="property?mode=LISTVIEW"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"/>
</svg> My Properties</a></li>
							
							<li><a class="dropdown-item" href="favorite?mode=LISTFAV"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-heart" viewBox="0 0 16 16">
  <path d="M8 6.982C9.664 5.309 13.825 8.236 8 12 2.175 8.236 6.336 5.309 8 6.982"/>
  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.707L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.646a.5.5 0 0 0 .708-.707L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
</svg> My Favorites</a></li>
							
								
							<c:if test="${user.role == 'user' }">
								<li><a class="dropdown-item" href="buy?mode=LISTBUY"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-check" viewBox="0 0 16 16">
  <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207l-5 5V13.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 2 13.5V8.207l-.646.647a.5.5 0 1 1-.708-.708z"/>
  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.707l.547.547 1.17-1.951a.5.5 0 1 1 .858.514"/>
</svg> Buy List</a></li>
								
							</c:if>
							
								<li><hr class="dropdown-divider"></li>
							<li>
								<a class="dropdown-item" href="login?mode=LOGOUT">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                      	<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z" />
                                      	<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z" />
                                	</svg> Logout
                                </a>
                            </li>
						</ul>
				   	 </li>
				</c:if>	
			</ul>
		
		
		
		
		<!-- Search -->
<form class="search-form d-flex position-absolute top-50 start-50 translate-middle" action="property" method="get">
    <input type="hidden" name="mode" value="SEARCH">
    <input class="form-control search-input" name="query" type="search" placeholder="Search for properties" aria-label="Search">
    <button class="btn search-button" type="submit">
        <i class="fas fa-search"></i> Search
    </button>
</form>

		
		
		<!-- Our Agents -->
        <c:if test="${user.role == 'user' }">
			<a class="nav-link active ms-3" href="user?mode=LISTAGENT" style="color: white;">Our Agents</a>
		</c:if>
		
		
		<!-- Dash-board -->			
		<c:if test="${user.role == 'agent' }">
			<a class="nav-link active ms-3" href="agent" style="color: white;">Dashboard </a>
		</c:if>	
		   	
		<!-- Login and Logout -->
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<a class=" btn btn-secondary" data-bs-toggle="modal" data-bs-target="#loginModal" href="login?mode=LOGIN_FORM" style="background-color: #22575b;">Login 
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
  						<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
					</svg>
				</a>
			</c:when>
			<c:otherwise>
				<a class=" btn btn-secondary" href="login?mode=LOGOUT" style="background-color: #22575b;">Logout 
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z"/>
  						<path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
					</svg>
				</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>

	<!-- Register -->
	<div class="modal fade" id="userModal" tabindex="-1"
		aria-labelledby="userModalLabel" aria-hidden="true">
		<c:import url="/template/user/sign-up.jsp" />
	</div>

	<!-- login  -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<c:import url="/template/user/sign-in.jsp" />
	</div>

	<!-- Add New Property Form -->
	<div class="modal fade" id="addModal" tabindex="-1"
		aria-labelledby="addModalLabel" aria-hidden="true">
		<c:import url="/template/property/add-property.jsp" />
	</div>
	
	<!--  <div class="modal fade" id="userUpdateModal" tabindex="-1"
		aria-labelledby="userUpdateModalLabel" aria-hidden="true">
		<c:import url="/template/user/update-profile.jsp" />
	</div> -->
</nav>

<style>
.search-form {
    width: 100%;
    max-width: 350px;
}

.search-input {
    border-radius: 20px 0 0 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 10px;
}

.search-button {
    border-radius: 0 20px 20px 0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px 20px;
    background-color: #6c757d;
    color: white;
    border: none;
}

.search-button i {
    margin-right: 5px;
}

.search-button:hover {
    background-color: #5a6268;
}

</style>