<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Renovando Vidas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link rel="stylesheet" href="assets/css/menu.css">	
	<style>
		.fondo {
		background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
			url('img/n-1.jpg');
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center top ;
		}
		.fondo-a{
			background: url("img/fd.jpg");
		}
		.altura{
			height: 450px;
			padding: 150px;
		} 
		.fond{
			background-color: white;
			display: inline-block; /* Hace que el fondo se ajuste al contenido del título */
            padding: 5px 10px; /* Ajusta el espaciado interior del fondo del título */
            border-radius: 5px; 
            color:black;
            margin-bottom: 0px;
		}
		.fond h1{
			font-size: 55px;
		}
		.parr{
			font-size: 12px;
		}
		.parr a{
			text-decoration: none;
			color: white;
		}
		.parr .color-a{
			color: rgba(128, 128, 128, 1); 
		}
		.relative-container {
		    position: relative; /* Necesario para el posicionamiento absoluto dentro */
		}

		.overlay-content {
		    position: absolute;
		    top: 50%; /* Alinea el contenido verticalmente en el centro */
		    left: 50%; /* Alinea el contenido horizontalmente en el centro */
		    transform: translate(-10%, 120%); /* Corrige la posición para centrar */
		    background-color: rgba(0, 0, 0, 0.7); /* Fondo oscuro con transparencia */
		    padding: 20px;
		    text-align: center;
		    color: white;
		    z-index: 1; /* Asegura que el div esté encima de la imagen */
		}
		.tam{
			height: 500px;
			width: 800px;
		}
		.justif{
			font-size: 20px;
			text-align: justify;
		}

		.linea-vertical {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 335px; /* Altura de la línea */
		    margin-right: 25px;
		}
		.linea-vertical1 {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 120px; /* Altura de la línea */
		    margin-right: 25px;
		}
		.linea-vertical2 {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 210px; /* Altura de la línea */
		    margin-right: 25px;
		}
		.brd{
			border-radius: 20px 0px ;
		}
		.alt{
			height: 500px;
		}
		.is-style-bottom-border{
			border-bottom: .55556rem solid #00BFFF;
		}
		.has-light-background-color {
			background-color:white;
		}
		.has-indigo-color {
			color: black;
		}
		.wp-block-group {
			box-sizing: border-box;
		}
		
		.py-4 {
		    padding-top: 1.5rem!important;
		    padding-bottom: 1.5rem!important;
		}
		.estilo-text{
			padding-top: 80px;
			padding-left: 300px;
		}
		.tam-text{
			font-size: 5rem;
		}
		.espacio-top{
			padding-top: 45px;
		}
		@media (max-width: 822px) {
		  .estilo-text{
			padding: 100px;
			}
		}
		
		@media (max-width: 615px) {
		  .estilo-text{
			padding: 20px;
			}
		}
		@media (max-width: 1030px) {
		  .linea-vertical1 {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 200px; /* Altura de la línea */
		    margin-right: 25px;
		}
		}
		@media (max-width: 768px) {
		  .linea-vertical1 {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 300px; /* Altura de la línea */
		    margin-right: 25px;
		}
		}
		@media (max-width: 1200px) {
		  .linea-vertical {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 400px; /* Altura de la línea */
		    margin-right: 25px;
		}
		}
		@media (max-width: 991px) {
		  .linea-vertical {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 550px; /* Altura de la línea */
		    margin-right: 25px;
		}
		}
		@media (max-width: 768px) {
		  .linea-vertical {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 700px; /* Altura de la línea */
		    margin-right: 25px;
		}
		}
		@media (max-width: 485px) {
		  .linea-vertical {
		    border-left: 10px solid #00BFFF; /* Grosor, estilo y color de la línea */
		    height: 900px; /* Altura de la línea */
		    margin-right: 25px;
		    }
		}
		@media (max-width: 500px) {
		 .overlay-content {
		    transform: translate(-10%, 70%); /* Corrige la posición para centrar */
		   
		}
		}
		@media (max-width: 550px) {
		 .altura{
			padding: 100px;
		} 
		}
		@media (max-width: 490px) {
		 .altura{
			padding: 70px;
		} 
		}
		@media (max-width: 459px) {
		 .altura{
			padding: 50px;
		} 
		}
		.sps{
			margin-top: 73px;
		}
		.espal{
			margin-bottom: 300px;
		}
		@media (max-width: 1200px) {
			 .espal{
		  		margin-bottom: 800px;
		  }
		}
		@media (max-width: 576px) {
			 .espal{
		  		margin-bottom: 1600px;
		  }
		}
		
	</style>
</head>
<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-scroll fixed-top shadow-0 border-bottom">
		<div id="navv" class="container">
			<a class="navbar-brand" href="#!"> <img id="logoimg"
				src="assets/img/logo1.png" alt="ONG">
			</a>
			<button class="navbar-toggler collapsed" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="navbar-collapse collapse" id="navbarSupportedContent"
				style="">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="menu.jsp">Inicio</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Nosotros.jsp">Nosotros</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="HisExito.jsp">Historias
							de éxito</a></li>
					<li class="nav-item"><a class="nav-link"
						href="voluntariado.jsp">Voluntariado</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Blog</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Eventos
							y noticias</a></li>
					<button type="button" class="btn btn-primary ms-3" >Dona</button>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar -->
	
	<%--Primera Seccion --%>
		<div class="sps">
			<section class="fondo text-light altura">
			<div class="container ">
				<div class="row">
					<div>
						<div>
							<p class="parr">
								 <a href="menu.jsp">Inicio</a> > 
                       			 <a href="Nosotros.jsp">Nosotros</a> >
                       			 <a href="Nosotros_vsm.jsp" class="color-a">Renovando Vidas</a> 
                       			 </p>
						</div>
						<div class="fond">
							<h1><strong>RENOVANDO VIDAS</strong></h1>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	<%--Fin de la Primera Seccion --%>
	
	<%--Segunda sección --%>
	<section class="pt-5">
		<div class="container">
			<div class="row ">
				<div class="relative-container">
					<div class="bg-dark text-light overlay-content">
					<h1>¿Quienes Somos?</h1>
					<h4>Mejoramos la vida de las mujeres, sus familias y 
						comunidades hacia la justicia social.</h4>
					</div>
				</div>
				<img src="img/n-2.jpg" class="img-fluid tam l-" alt="...">
			</div>
		</div>
	</section>
	<%--Fin de la Segunda sección --%>
	<section>
			<div class="container mt-5">
				<div class="row text-center">
					<div class="col-9 mx-auto d-flex">
					<div class="linea-vertical"></div>
						<p class="justif">Renovando Vidas es una organización sin fines de lucro 
						   comprometida con la transformación positiva de comunidades
						   desfavorecidas. Fundada en 20XX, nuestra misión es 
						   promover el Desarrollo Humano Integral, basado en valores
						   de igualdad, solidaridad y el respeto a la dignidad de 
						   cada individuo.<br><br>A lo largo de los años, "Renovando Vidas"
						   ha colaborado estrechamente con una red de asociados a 
						   nivel nacional, trabajando incansablemente para mejorar 
						   la vida de aquellos que más lo necesitan. <br><br>Además, somos 
						   parte de la comunidad global de organizaciones 
						   comprometidas con el cambio social, formando parte de 
						   alianzas internacionales que buscan un mundo más justo y 
						   equitativo."Renovando Vidas" se enorgullece de ser un 
						   actor activo en la lucha contra la pobreza y de trabajar 
						   incansablemente para crear un futuro mejor para todos.
						   </p>
					</div>
				</div>
			</div>
		</section>
	
	<%--Tercera Sección: Mision y vision --%>
	<section class="mt-5">
		<div class="container-fluid ">
			<div class="row text-light justify-content-center">
				<div class="col-5 text-center mx-3 bg-info brd p-2">
					<h2>Misión</h2>
					<p class="justif text-center"><strong>Despertando sueños, transformamos vidas</strong></p>
					<p class="justif">
					   Nuestra misión es promover el desarrollo
					   humano integral y sostenible de las personas
					   en condici6n de vulnerabilidad, en alianza
					   con otras instituciones y organizaciones de
					   la sociedad civil. Guiados por principios
					   éticos y valores universales, trabajamos
					   incansablemente para construir un mundo
					   más justo y solidario.
					 </p>
				</div>
				<div class="col-5 text-center mx-3 bg-info brd p-2">
					<h2>Visión</h2>
					<p class="justif text-center"><strong>Visión:  "Rumbo a la autogestión para la acción"</strong></p>
					<p class="justif">
						Para el año 2024, nos convertiremos en una
						red humanitaria lider y de referencia a nivel
						nacional, extendiendo nuestra mano
						solidaria a quienes mås Io necesitan,
						transformando vidas y contribuyendo al
						florecimiento de una sociedad mås
						igualitaria y compasiva.
					</p>
				</div>
			</div>
		</div>
	</section>
	<%--Final de la Tercera Sección: Mision y vision --%>
	
	<%--Cuarta Sección --%>
	<section>
			<div class="container mt-5">
				<div class="row text-center">
					<div class="col-9 mx-auto d-flex">
					<div class="linea-vertical1"></div>
						<p class="justif">Transformando almas, reviviendo
						 esperanzas y renovando vidas. Nuestra ONG, 'Renovando
						 Vidas', se compromete a inspirar un cambio 
						 significativo en la sociedad. Trabajamos 
						 incansablemente para empoderar a aquellos que más lo
						 necesitan y construir un mundo más justo y solidario.
						 Juntos, creamos un futuro lleno de oportunidades y 
						 transformamos vidas con compasión y dedicación.
						   </p>
					</div>
				</div>
			</div>
		</section>
		<%--Cuarta Sección --%>
		
		<%--Quinta Sección --%>
		<div class="espal">
			<section class="mt-5">
			<div class="container-fluid">
				<div class="row text-light ">
					<div class="fondo-a alt">
						<div class="d-flex estilo-text">
							<div>
								<div class="linea-vertical2"></div>
							</div>
							<div>
								<h1 class="tam-text">Valores</h1>
								<h1 class="tam-text">institucionales</h1>
							</div>
						</div>
						<div class="row justify-content-center gy-4 p-5">
							<div class="col-lg-5 col-xl-3 col-sm-6 offset-lg-false offset-xl-0">
								<div class="wp-block-group is-style-bottom-border 
								has-indigo-color has-light-background-color has-text-color 
								has-background px-3 px-sm-4 py-4 is-layout-constrained 
								wp-block-group-is-layout-constrained">
									<div class="wp-block-group__inner-container">
										<div class="row justify-content-end">
											<div class="col-6">
												<figure class="wp-block-image size-large">
													<img src="img/pulso.png" class="img-fluid" alt="...">
												</figure>
											</div>
										</div>
										<h4 class="wp-block-heading">
											Primero
											<br>
											Las Personas
										</h4>
										<p style="font-size:16px">
											Trabajamos de la mano de las personas desde la 
											empatía, la solidaridad y el mutuo reconocimiento.
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-xl-3 col-sm-6 offset-lg-false offset-xl-0 espacio-top">
								<div class="wp-block-group is-style-bottom-border has-indigo-color
								 has-light-background-color has-text-color has-background px-3 
								 px-sm-4 py-4 is-layout-constrained wp-block-group-is-layout-constrained">
									<div class="wp-block-group__inner-container">
										<div class="row justify-content-end">
											<div class="col-6">
												<figure class="wp-block-image size-large">
												<img src="img/motivacion.png" class="img-fluid" alt="...">
												</figure>
											</div>
										</div>
										<h4 class="wp-block-heading">
											Actuamos
											<br>
											con integridad
										</h4>
										<p style="font-size:16px">
											Llevamos la ética, el respeto y la transparencia a cada
											 lugar y en todo lo que hacemos.
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-xl-3 col-sm-6 offset-lg-false offset-xl-0">
								<div class="wp-block-group is-style-bottom-border has-indigo-color
								 has-light-background-color has-text-color has-background px-3 px-sm-4
								  py-4 is-layout-constrained wp-block-group-is-layout-constrained">
									<div class="wp-block-group__inner-container">
										<div class="row justify-content-end">
											<div class="col-6">
												<figure class="wp-block-image size-large">
													<img src="img/apoyo.png" class="img-fluid" alt="...">
												</figure>
											</div>
										</div>
										<h4 class="wp-block-heading">
											Buscamos la excelencia
											<br>
											y la innovación
										</h4>
										<p style="font-size:16px">
											Cuestionamos, desaprendemos, recreamos y transformamos realidades.
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-xl-3 col-sm-6 offset-lg-false offset-xl-0 espacio-top">
								<div class="wp-block-group is-style-bottom-border has-indigo-color has-light-background-color has-text-color has-background px-3 px-sm-4 py-4 is-layout-constrained wp-block-group-is-layout-constrained">
									<div class="wp-block-group__inner-container">
										<div class="row justify-content-end">
											<div class="col-6">
												<figure class="wp-block-image size-large">
												<img src="img/atencion.png" class="img-fluid" alt="...">
												</figure>
											</div>
										</div>
										<h4 class="wp-block-heading">
											Llevamos los derechos
											<br>
											a la práctica
										</h4>
										<p style="font-size:16px">
											Vivimos con igualdad y respetamos la diversidad y el 
											ejercicio de derechos de las personas.
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
		<%--Final Quinta sección --%>
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
									ayudar a los mas neceesitados del Perú</p>
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
									<li id="footerli"><a id="footera" href="#">Donar</a></li>
									<li id="footerli"><a id="footera"
										href="voluntariado.jsp#howvol">¿Cómo ser voluntario?</a></li>
									<li id="footerli"><a id="footera" href="MenuAdmin.jsp">Admin</a></li>
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
									<li id="footerli"><a id="footera" href="#">Nosotros</a></li>
									<li id="footerli"><a id="footera" href="#">Historias
											de exito </a></li>
									<li id="footerli"><a id="footera" href="voluntariado.jsp">Voluntariado</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Contactanos</a>
									</li>
									<li id="footerli"><a id="footera" href="#">Eventos
											&amp; Noticias</a></li>
									<li id="footerli"><a id="footera" href="#">Blog</a></li>
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