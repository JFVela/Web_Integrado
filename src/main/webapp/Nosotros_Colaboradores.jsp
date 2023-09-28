<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Colaboradores</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link rel="stylesheet" href="assets/css/menu.css">
<style>
	.fondo {
		background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
			url('img/nc-1.jpg');
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center top;
	}
	
	.altura {
		height: 400px;
		padding: 120px;
	}
	.fond {
		background-color: white;
		display: inline-block;
		/* Hace que el fondo se ajuste al contenido del título */
		padding: 5px 10px;
		/* Ajusta el espaciado interior del fondo del título */
		border-radius: 5px;
		color: black;
		margin-bottom: 0px;
		font-size: 50px;
	}
	
	.fond h1 {
		font-size: 55px;
	}
	
	.parr {
		font-size: 12px;
	}
	
	.parr a {
		text-decoration: none;
		color: white;
	}
	
	.parr .color-a {
		color: rgba(128, 128, 128, 1);
	}
	
	.borde {
		border-bottom: 4px solid #00BFFF;
		/* Grosor, estilo y color de la línea */
		width: 60px;
		margin-bottom: 70px;
		margin-left: 350px;
	}
	.jus {
		text-align: justify;
		margin-bottom: 40px;
		padding-top: 30px;
	}
	
	.jus1 {
		text-align: justify;
		padding: 10px;
	}
	.jus2{
		text-align: justify;
	}
	
	.espaciado {
		padding: 20px 100px 20px 100px;
	}
	
	.tam-img {
		height: 100px;
		width: 100px;
		margin-left: 90px;
	}
	
	.bg {
		background: #f7f7f7;
	}
	
	.linea-vertical {
		border-left: 10px solid #00BFFF;
		/* Grosor, estilo y color de la línea */
		height: 335px; /* Altura de la línea */
		margin-right: 25px;
	}
	.est-p {
		text-align: justify;
		padding-right: 200px;
	}
	
	.espa-r {
		padding-right: 100px;
	}
	
	.qa-item {
		padding: 15px 0;
		margin-bottom: 15px;
		margin-top: 30px;
		border-top: 1px solid #00BFFF;
	}
	
	@media ( max-width : 620px) {
		.altura {
			padding: 70px;
			height: 350px;
		}
		.fond {
			font-size: 40px;
		}
	}
	
	@media ( max-width : 567px) {
		.altura {
			padding: 20px;
			height: 300px;
		}
	}
	
	@media ( max-width : 428px) {
		.fond {
			font-size: 30px;
		}
		.altura {
			height: 200px;
		}
	}
	@media ( max-width : 1250px) {
		.borde {
			margin-left: 300px;
		}
	}
	
	@media ( max-width : 1200px) {
		.borde {
			margin-left: 250px;
		}
	}
	
	@media ( max-width : 992px) {
		.borde {
			margin-left: 180px;
		}
		.linea-vertical {
			height: 530px; /* Altura de la línea */
		}
	}
	
	@media ( max-width : 930px) {
		.linea-vertical {
			height: 450px; /* Altura de la línea */
		}
	}
	
	@media ( max-width : 769px) {
		.borde {
			margin-left: 140px;
		}
	}
	
	@media ( max-width : 767px) {
		.linea-vertical {
			height: 800px; /* Altura de la línea */
		}
	}
	
	@media ( max-width : 500px) {
		.linea-vertical {
			height: 800px; /* Altura de la línea */
		}
	}
	@media ( max-width : 420px) {
		.linea-vertical {
			height: 800px; /* Altura de la línea */
		}
	}
	
	@media ( max-width : 519px) {
		.linea-vertical {
			height: 800px; /* Altura de la línea */
		}
	}
	@media ( max-width : 500px) {
		.linea-vertical {
			height: 960px; /* Altura de la línea */
		}
	}
	.espac1{
		margin-top: 73px;
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
					<li class="nav-item"><a class="nav-link" href="#!">Historias
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
<div class="espac1">
	<section class="fondo text-light altura">
			<div class="container ">
				<div class="row">
					<div >
						<div>
							<p class="parr">
								 <a href="menu.jsp">Inicio</a> > 
                       			 <a href="Nosotros.jsp">Nosotros</a> >
                       			 <a href="Nosotros_Colaboradores.jsp" class="color-a">Nuestra Colaboradores</a> 
                       			 </p>
						</div>
						<div>
							<h1 class="fond"><strong>NUESTROS</strong></h1><br>
							<h1 class="fond"><strong>COLABORADORES</strong></h1>
						</div>
					</div>
				</div>
			</div>
		</section>
</div>
	<%--Fin de la Primera Seccion --%>

	<%--Segunda Sección --%>
	<section>
	<div class="container pt-3">
		<div class="row">
			<div class="col-7 mx-auto">
				<div class="text-center pt-5">
					<h1 style="font-size: 60px">Nuestros Impulsores Iniciales</h1>
					<p class="jus text-secondary">
						Nuestra ONG está compuesta por un equipo apasionado
						de estudiantes universitarios que están comprometidos
						con la creación de un impacto positivo en nuestra
						comunidad y más allá. Juntos, combinamos una
					    variedad de talentos, conocimientos y experiencias
						para llevar a cabo nuestra misión. Conócenos un
				        poco mejor:
					</p>
				</div>
				<div class="borde"></div>
			</div>
		</div>
	</div>
</section>
	<%--Fin de la Segunda Sección --%>
	<%--Colaboradores --%>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="qa-item">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h3>Diego Mathias Bautista<br> López</h3>
								<img src="img/00.png" class="card-img-top tam-img" alt="...">
								
							</div>
							<div class="col-md-8">
								<p class="jus2">
									Diego es un estudiante de Ingeniería de Sistemas
						        	 con un profundo interés en la tecnología y la 
						        	 innovación. Su experiencia en gestión de proyectos
						        	  y su habilidad para resolver problemas son 
						        	  fundamentales para la implementación exitosa de 
						        	  nuestras iniciativas tecnológicas.
								</p>
							</div>
						</div>
					</div>
					<div class="qa-item">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h3>Alex Eduardo Zurita Julca</h3>
								<img src="img/11.webp" class="card-img-top tam-img" alt="...">
								
							</div>
							<div class="col-md-8">
								<p class="jus2">
									 Juan es un estudiante de Ingeniería de Sistemas 
						        	 apasionado por la programación y la solución de 
						        	 desafíos tecnológicos. Desarrolla aplicaciones y 
						        	 sistemas que mejoran nuestra eficiencia interna y 
						        	 nuestra capacidad para alcanzar a la comunidad.
								</p>
							</div>
						</div>
					</div>
					<div class="qa-item">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h3>Juan Ramon Figueroa Vela</h3>
								<img src="img/22.png" class="card-img-top tam-img" alt="...">
								
							</div>
							<div class="col-md-8">
								<p class="jus2">
									Juan es un estudiante de Ingeniería de Sistemas 
									 apasionado por la programación y la solución de 
									 desafíos tecnológicos. Desarrolla aplicaciones y 
									 sistemas que mejoran nuestra eficiencia interna y 
									 nuestra capacidad para alcanzar a la comunidad.
								</p>
							</div>
						</div>
					</div>
					<div class="qa-item">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h3>Juan José Vilcahuaman Alvarado</h3>
								<img src="img/33.png" class="card-img-top tam-img" alt="...">
								
							</div>
							<div class="col-md-8">
								<p class="jus2">
									Juan es un estudiante de Ingeniería de Software 
									apasionado por el desarrollo de aplicaciones y 
									software de calidad. Contribuye a la creación y 
									mejora de nuestras herramientas tecnológicas, 
									asegurando que estén alineadas con nuestra misión.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%--Fin de la sección:Colaboradores --%>
	<%--cuarta seccion --%>
	<section>
			<div class="container mt-5">
				<div class="row ">
					<div class="col-9 mx-auto d-flex">
					<div class="linea-vertical"></div>
					<div>
						<h1 class="display-2">Invitación a futuros</h1>
						<h1 class="display-2">Colaboradores</h1>
						<p class="est-p">
						Estamos emocionados por el apoyo inicial que hemos
						 recibido, y esperamos que más personas se unan a
						  nosotros en nuestro viaje para crear un impacto
						   positivo en la comunidad. Si estás interesado en
						    colaborar con nosotros o conocer más acerca de
						     nuestro proyecto, ¡no dudes en ponerte en contacto
						      con nosotros!
						   </p>
					</div>
					</div>
					
				</div>
			</div>
		</section>
	<%--fin de la cuarta seccion --%>
	
	
	<%--Quinta Sección --%>
	<section class="mt-5 pb-4">
		<div class="container-fluid">
			<div class="row ">
				<div class="col bg ">
				<img src="img/download.png" class="img-fluid" alt="...">
				</div>
				<div class="col p-5">
					<h1 class="display-4">Principal Aliado</h1>
					<p class="espa-r jus2">La Universidad Tecnológica del Perú es nuestro principal
					 aliado en la misión de nuestra ONG. Esta institución 
					 académica de renombre ha demostrado un compromiso 
					 excepcional con nuestra visión de crear un mundo mejor
					  a través del servicio comunitario y la responsabilidad
					   social. Su apoyo inquebrantable ha sido fundamental
					    en cada paso de nuestro camino.</p>
				</div>
			</div>
		</div>
	</section>
	<%--fin de la Quinta seccion --%>
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