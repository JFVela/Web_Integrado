<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>navbar</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap">
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/css/mdb.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/plugins/css/all.min.css">
<link rel="stylesheet" href="assets/css/menu.css">
</head>

<body>
	<main>
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-scroll fixed-top shadow-0 border-bottom">
			<div id="navv" class="container">
				<a class="navbar-brand" href="#!"> <img id="logoimg"
					src="assets/img/logo1.png" alt="ONG">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link" href="menu.html">Inicio</a></li>
						<li class="nav-item"><a class="nav-link" href="Nosotros.jsp">Nosotros</a></li>
						<li class="nav-item"><a class="nav-link" href="HisExito.jsp">Historias
								de éxito</a></li>
						<li class="nav-item"><a class="nav-link"
							href="voluntariado.jsp">Voluntariado</a></li>

						<a type="" class="btn btn-primary ms-3" href="Donacion.jsp">Dona</a>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Navbar -->
	</main>

	<!-- Librería principal de jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

	<!-- Librería JS de Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>


	<script>
		$(document).ready(function() {
			$('[data-mdb-toggle="collapse"]').each(function() {
				$(this).collapse();
			});
		});
	</script>

	<script>
		var navBar = document.querySelector('.js-nav-bar');
		if (navBar) {
			document.documentElement.style.setProperty('--nav-height',
					navBar.offsetHeight + 'px');
		}
	</script>
	<script>
		$(".option").click(function() {
			$(".option").removeClass("active");
			$(this).addClass("active");
		});
	</script>
</body>

</html>
