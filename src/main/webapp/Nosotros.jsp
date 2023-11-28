<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nosotros</title>
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
	integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap">
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/css/mdb.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/plugins/css/all.min.css">
<link rel="stylesheet" href="assets/css/menu.css">

<style>
.nav-link.active:focus {
	background-color: #dc3545;
	color: white;
}

.espace {
	margin-top: 88px;
}
/* Estilo predeterminado para la tarjeta */
.tarjeta {
	position: relative;
	overflow: hidden;
	transition: transform 0.3s ease;
	border: none;
	border-radius: 0;
}

/* Estilo para el fondo en estado normal (sin pasar el mouse) */
.tarjeta::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0); /* Color de fondo transparente */
	transition: transform 0.3s ease, background-color 0.3s ease;
	/* Transición para el efecto de escala y el cambio de color */
	z-index: 1; /* Coloca el fondo sobre el contenido */
}

/* Estilo para el fondo al pasar el mouse */
.tarjeta:hover::before {
	background-color: rgba(0, 0, 255, 0.3);
	/* Fondo ligeramente transparente al pasar el mouse */
	transform: scale(0.9); /* Achica el fondo hacia adentro */
}

/* Estilo para el contenido de texto dentro de la tarjeta */
.tarjeta-texto {
	position: relative;
	z-index: 2; /* Coloca el contenido de texto sobre el fondo */
	padding: 20px; /* Espaciado interior para el contenido de texto */
}

/* Estilo para el fondo blanco al pasar el mouse */
.tarjeta::after {
	content: "";
	position: absolute;
	top: -10px;
	/* Ajusta el espacio del fondo blanco desde la parte superior */
	left: -10px;
	/* Ajusta el espacio del fondo blanco desde la izquierda */
	right: -10px; /* Ajusta el espacio del fondo blanco desde la derecha */
	bottom: -10px;
	/* Ajusta el espacio del fondo blanco desde la parte inferior */
	background-color: rgba(255, 255, 255, 0);
	/* Color de fondo blanco transparente */
	transition: background-color 0.3s ease;
	/* Transición para el cambio de color de fondo */
	z-index: 0; /* Coloca el fondo blanco detrás del contenido */
	pointer-events: none;
	/* Evita que el fondo blanco bloquee interacciones con el contenido */
}

/* Estilo para el fondo blanco al pasar el mouse */
.tarjeta:hover::after {
	background-color: rgba(255, 255, 255, 0.8);
	/* Fondo blanco transparente al pasar el mouse */
}

/* Estilo para el contenido de texto dentro de la tarjeta */
.tarjeta-texto {
	position: relative;
	z-index: 2; /* Coloca el contenido de texto sobre el fondo */
	padding: 40px; /* Espaciado interior para el contenido de texto */
}

.tamaño-card {
	height: 44rem;
}

.fond {
	background: #ffffff;
	display: inline-block;
	/* Hace que el fondo se ajuste al contenido del título */
	padding: 5px 10px;
	/* Ajusta el espaciado interior del fondo del título */
	border-radius: 5px;
	margin-bottom: 0px;
	color: black;
}

.fon2 {
	background-color: #4a4f53;
	display: inline-block;
	/* Hace que el fondo se ajuste al contenido del título */
	padding: 5px 10px;
	/* Ajusta el espaciado interior del fondo del título */
	border-radius: 5px;
	color: white;
	font-size: 17px;
	margin-top: 7px;
	margin-right: 100px;
}

.container-fluid {
	padding-left: 0;
	padding-right: 0;
}

.estilo-boton {
	background-color: transparent;
	color: transparent;
	border: none;
}
/* Cambia el fondo del botón al pasar el ratón sobre la tarjeta */
.tarjeta:hover .estilo-boton {
	background-color: transparent;
	/* Cambia el color de fondo al color deseado */
	color: white;
	/* Puedes ajustar el color de texto según tus preferencias */
	border: 2px solid white;
}

.tarjeta:hover .fon2 {
	background-color: transparent;
	/* Cambia el color de fondo al color deseado */
}

.justi {
	text-align: justify;
}

.linea {
	margin: 0 auto;
	width: 150px;
}

.fondo-g {
	background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
		url('img/fn-1.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center top;
}
</style>
</head>
<body>
<!-- Navbar -->
	<jsp:include page="nabvar.jsp"></jsp:include>
	<!-- Navbar -->
	


	<%--Secciones en forma de tarjeta --%>
	<section class="espace">
		<div class="container-fluid">
			<div class="row">
				<div class="d-flex">
					<div class="w-100">
						<div class="card text-bg-dark tarjeta tamaño-card">
							<img src="img/ll.jpg" class="card-img" alt="...">
							<div class="card-img-overlay">
								<div class="tarjeta-texto">
									<h1 class="card-title fond text-dark">
										<strong>RENOVANDO</strong>
									</h1>
									<br>
									<h1 class="card-title fond text-dark">
										<strong>VIDAS</strong>
									</h1>
									<p class="card-text fon2">Conoce más sobre nuestra
										organización,valores, visión y misión.</p>
									<a class="btn estilo-boton" href="Nosotros_vsm.jsp">VER MÁS</a>
								</div>
							</div>
						</div>
					</div>
					<div class="w-100">
						<div class="card text-bg-dark tarjeta tamaño-card">
							<img src="img/dd.jpg" class="card-img h-100" alt="...">
							<div class="card-img-overlay">
								<div class="tarjeta-texto">
									<h1 class="card-title fond text-dark">
										<strong>NUESTRA</strong>
									</h1>
									<br>
									<h1 class="card-title fond text-dark">
										<strong>HISTORIA</strong>
									</h1>
									<p class="card-text fon2">Enterate más sobre la historia de
										nuestra organización.</p>
									<a class="btn estilo-boton" href="Nosotros_historia.jsp">VER
										MÁS</a>
								</div>
							</div>
						</div>
					</div>
					<div class="w-100">
						<div class="card text-bg-dark tarjeta tamaño-card">
							<img src="img/bb.jpg" class="card-img h-100" alt="...">
							<div class="card-img-overlay">
								<div class="tarjeta-texto">
									<h1 class="card-title fond text-dark">
										<strong>NUESTROS</strong>
									</h1>
									<br>
									<h1 class="card-title fond text-dark">
										<strong>COLABORADORES</strong>
									</h1>
									<p class="card-text fon2">Encuentra aquí las entidades que
										colaboran a nuesta causa.</p>
									<a class="btn estilo-boton" href="Nosotros_Colaboradores.jsp">VER
										MÁS</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%--Fin de las secciones --%>

	<%--Ultima Sección --%>
	<section class="sp">
		<div class="container-fluid fondo-g p-5">
			<div class="row">
				<div class="col-7 mx-auto text-light text-center">
					<h1 class="fw-bold">POR UN FUTURO MEJOR</h1>
					<hr class="linea">
					<p class="justi pt-3 ">Renovando Vidas es un faro de esperanza
						en un mundo que a menudo enfrenta desafíos abrumadores. Su
						dedicación incansable a la transformación de vidas ha tocado
						corazones y cambiado destinos. Cada contribución, grande o
						pequeña, se traduce en un cambio significativo. Únete a nosotros
						en el apoyo a esta causa digna y sé parte del cambio que Renovando
						Vidas está liderando en nuestro mundo.Su enfoque en la igualdad,
						la compasión y la sostenibilidad guía cada paso que dan,
						asegurando que su labor tenga un impacto duradero. Con Renovando
						Vidas, puedes estar seguro de que tu ayuda marca la diferencia y
						contribuye a un mundo más justo y solidario. ¡Únete a esta causa
						inspiradora hoy mismo!"</p>
				</div>
			</div>
		</div>
	</section>
	<%--Fin de la ultima Sección --%>

	<!-- Footer -->
	<footer class="footer-area footer--light">
		<div class="footer-big">
			<!-- start .container -->
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="footer-widget">
							<div class="widget-about">
								<img src="assets/img/footerimg.jpg" alt="" class="img-fluid">
								<p id="footerp">Organización sin fines de lucro creada para
									ayudar a los más neceesitados del Perú</p>
								<ul class="contact-details">
									<li id="footerli"><span class="icon-earphones"></span>
										Telef: <a id="footera" href="tel:344-755-111">344-755-111</a>
									</li>
									<li id="footerli"><span class="icon-envelope-open"></span>
										<a id="footera" href="">51, San Martín 15108</a></li>
								</ul>
							</div>
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-md-4 -->
					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu footer-menu--1">
								<h4 id="footerh4" class="footer-widget-title">Categotoria
									popular</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="voluntariado.jsp">Voluntariado</a>
									</li>
									<li id="footerli"><a id="footera" href="Donacion.jsp">Donar</a>
									</li>
									<li id="footerli"><a id="footera"
										href="voluntariado.jsp#howvol">¿Cómo ser voluntario?</a></li>
									<li id="footerli"><a id="footera" href="#">Admin</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-md-3 -->

					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu">
								<h4 id="footerh4" class="footer-widget-title">ONG</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="Nosotros.jsp">Nosotros</a>
									</li>
									<li id="footerli"><a id="footera" href="HisExito.jsp">Historias
											de éxito </a></li>
									<li id="footerli"><a id="footera" href="voluntariado.jsp">Voluntariado</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Contáctanos</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Eventos
											&amp; Noticiaas</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- end /.col-lg-3 -->

					<div class="col-md-3 col-sm-4">
						<div class="footer-widget">
							<div class="footer-menu no-padding">
								<h4 id="footerh4" class="footer-widget-title">Soporte de
									ayuda</h4>
								<ul id="footerul">
									<li id="footerli"><a id="footera" href="#">Foro de
											soporte</a></li>
									<li id="footerli"><a id="footera" href="#">Terminos
											&amp; Condiciones</a></li>
									<li id="footerli"><a id="footera" href="#">Politica de
											privacidad</a></li>
									<li id="footerli"><a id="footera"
										href="voluntariado.jsp#fa1">FAQ voluntariado</a></li>
									<li id="footerli"><a id="footera" href="#">FAQ Donar</a></li>
									<li id="footerli"><a id="footera" href="#">FAQ
											Nosotros</a></li>
								</ul>
							</div>
							<!-- end /.footer-menu -->
						</div>
						<!-- Ends: .footer-widget -->
					</div>
					<!-- Ends: .col-lg-3 -->

				</div>
				<!-- end /.row -->
			</div>
			<!-- end /.container -->
		</div>
		<!-- end /.footer-big -->

		<div class="mini-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copyright-text">
							<p id="footerp">
								© 2023 <a id="footera" href="#">Renovando Vidas</a>. Todos los
								derechos reservados. Creado por <a id="footera" href="#">J.José,
									Juan, Diego, Alex</a>
							</p>
						</div>


					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Fin del Footer -->
</body>
</html>