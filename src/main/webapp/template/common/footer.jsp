<%@taglib uri="jakarta.tags.core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">	</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted" style="background-color: #ffffff;">


  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4 mt-3">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Real Estate
          </h6>
          <p>
            Browse our curated selection of real estate properties to find your ideal home. Get expert guidance and stay informed on our list for your home-buying journey."
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4 mt-3">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
          <p>
            <a href="#" class="text-reset text-decoration-none">JavaEE</a>
          </p>
          <p>
            <a href="" class="text-reset text-decoration-none">Servlet</a>
          </p>
          <p>
            <a href="" class="text-reset text-decoration-none">Bootstrap</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4 mt-3">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="" class="text-reset text-decoration-none">Properties</a>
          </p>
          <p>
            <a href="" class="text-reset text-decoration-none">Settings</a>
          </p>
          <p>
            <a href="" class="text-reset text-decoration-none">Search</a>
          </p>
          <p>
            <a href="" class="text-reset text-decoration-none">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4 mt-3">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> Myanmar, Mandalay</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            kopo@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +959 456 987 321</p>
          <p><i class="fas fa-print me-3"></i> +959 456 987 321</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->
   <section class="text-center" >
        <p class="d-flex justify-content-center align-items-center">
          <span class="me-3">Register for free - </span>
          <a data-mdb-ripple-init type="button" class="btn btn-outline-light btn-rounded" style="background-color: #22575b;"
          data-bs-toggle="modal" data-bs-dismiss="modal" data-bs-target="#userModal" href="user?mode=SIGNUP">
            Sign up <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5"/>
</svg>
          </a>
        </p>
      </section>

  <!-- Copyright -->
  <div class="text-center p-4 text-white" style="background-color: #22575b;">
    © 2021 Copyright:
    <a class="text-reset fw-bold text-white text-decoration-none" href="">realestate.com</a>
  </div>
  <!-- Copyright -->
  
  <!-- Register -->
	<div class="modal fade" id="userModal" tabindex="-1"
		aria-labelledby="userModalLabel" aria-hidden="true">
		<c:import url="/template/user/sign-up.jsp" />
	</div>
</footer>
<!-- Footer -->