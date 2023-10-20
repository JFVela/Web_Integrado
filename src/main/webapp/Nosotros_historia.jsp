<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Historia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link rel="stylesheet" href="assets/css/menu.css">

<style>
    .fondo {
        background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url('img/n-3.jpg');
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
        padding: 5px 10px;
        border-radius: 5px;
        color: black;
        margin-bottom: 0px;
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
    /*Linea de tiempo*/
    @media (min-width: 1000px) {
  #timeline .demo-card:nth-child(even) .head::after, #timeline .demo-card:nth-child(odd) .head::after {
    position: absolute;
    content: "";
    width: 0;
    height: 0;
    border-top: 15px solid transparent;
    border-bottom: 15px solid transparent;
  }

  #timeline .demo-card:nth-child(even) .head::before, #timeline .demo-card:nth-child(odd) .head::before {
    position: absolute;
    content: "";
    width: 9px;
    height: 9px;
    background-color: #bdbdbd;
    border-radius: 9px;
    box-shadow: 0px 0px 2px 8px #f7f7f7;
  }
}
/* Some Cool Stuff */
.demo-card:nth-child(1) {
  order: 1;
}

.demo-card:nth-child(2) {
  order: 4;
}

.demo-card:nth-child(3) {
  order: 2;
}

.demo-card:nth-child(4) {
  order: 5;
}

.demo-card:nth-child(5) {
  order: 3;
}

.demo-card:nth-child(6) {
  order: 6;
}

/* Border Box */
* {
  box-sizing: border-box;
}

/* Fonts */


#timeline {
  padding: 100px 0;
  background: #f7f7f7;
  border-top: 1px solid rgba(191, 191, 191, 0.4);
  border-bottom: 1px solid rgba(191, 191, 191, 0.4);
}
#timeline h1 {
  text-align: center;
  font-size: 3rem;
  font-weight: 200;
  margin-bottom: 20px;
}
#timeline p.leader {
  text-align: center;
  max-width: 90%;
  margin: auto;
  margin-bottom: 45px;
}
#timeline .demo-card-wrapper {
  position: relative;
  margin: auto;
}
@media (min-width: 1000px) {
  #timeline .demo-card-wrapper {
    display: flex;
    flex-flow: column wrap;
    width: 1170px;
    height: 1550px;
    margin: 0 auto;
  }
}
#timeline .demo-card-wrapper::after {
  z-index: 1;
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  left: 50%;
  border-left: 1px solid rgba(191, 191, 191, 0.4);
}
@media (min-width: 1000px) {
  #timeline .demo-card-wrapper::after {
    border-left: 1px solid #bdbdbd;
  }
}
#timeline .demo-card {
  position: relative;
  display: block;
  margin: 10px auto 80px;
  max-width: 94%;
  z-index: 2;
}
@media (min-width: 480px) {
  #timeline .demo-card {
    max-width: 60%;
    box-shadow: 0px 1px 22px 4px rgba(0, 0, 0, 0.07);
  }
}
@media (min-width: 720px) {
  #timeline .demo-card {
    max-width: 40%;
  }
}
@media (min-width: 1000px) {
  #timeline .demo-card {
    max-width: 450px;
    height: 400px;
    margin: 90px;
    margin-top: 45px;
    margin-bottom: 45px;
  }
  #timeline .demo-card:nth-child(odd) {
    margin-right: 45px;
  }
  #timeline .demo-card:nth-child(odd) .head::after {
    border-left-width: 15px;
    border-left-style: solid;
    left: 100%;
  }
  #timeline .demo-card:nth-child(odd) .head::before {
    left: 491.5px;
  }
  #timeline .demo-card:nth-child(even) {
    margin-left: 45px;
  }
  #timeline .demo-card:nth-child(even) .head::after {
    border-right-width: 15px;
    border-right-style: solid;
    right: 100%;
  }
  #timeline .demo-card:nth-child(even) .head::before {
    right: 489.5px;
  }
  #timeline .demo-card:nth-child(2) {
    margin-top: 180px;
  }
}
#timeline .demo-card .head {
  position: relative;
  display: flex;
  align-items: center;
  color: #fff;
  font-weight: 400;
}
#timeline .demo-card .head .number-box {
  display: inline;
  float: left;
  margin: 15px;
  padding: 10px;
  font-size: 35px;
  line-height: 35px;
  font-weight: 600;
  background: rgba(0, 0, 0, 0.17);
}
#timeline .demo-card .head h2 {
  text-transform: uppercase;
  font-size: 1.3rem;
  font-weight: inherit;
  letter-spacing: 2px;
  margin: 0;
  padding-bottom: 6px;
  line-height: 1rem;
}
@media (min-width: 480px) {
  #timeline .demo-card .head h2 {
    font-size: 165%;
    line-height: 1.2rem;
  }
}
#timeline .demo-card .head h2 span {
  display: block;
  font-size: 0.6rem;
  margin: 0;
}
@media (min-width: 480px) {
  #timeline .demo-card .head h2 span {
    font-size: 0.8rem;
  }
}
#timeline .demo-card .body {
  background: #fff;
  border: 1px solid rgba(191, 191, 191, 0.4);
  border-top: 0;
  padding: 15px;
}
@media (min-width: 1000px) {
  #timeline .demo-card .body {
    height: 315px;
  }
}
#timeline .demo-card .body p {
  font-size: 14px;
  line-height: 18px;
  margin-bottom: 15px;
}
#timeline .demo-card .body img {
  display: block;
  width: 100%;
}
#timeline .demo-card--step1 {
  background-color: #46b8e9;
}
#timeline .demo-card--step1 .head::after {
  border-color: #46b8e9;
}
#timeline .demo-card--step2 {
  background-color: #3ee9d1;
}
#timeline .demo-card--step2 .head::after {
  border-color: #3ee9d1;
}
#timeline .demo-card--step3 {
  background-color: #ce43eb;
}
#timeline .demo-card--step3 .head::after {
  border-color: #ce43eb;
}
#timeline .demo-card--step4 {
  background-color: #4d92eb;
}
#timeline .demo-card--step4 .head::after {
  border-color: #4d92eb;
}
#timeline .demo-card--step5 {
  background-color: #46b8e9;
}
#timeline .demo-card--step5 .head::after {
  border-color: #46b8e9;
}
#timeline{	
	padding-bottom: 10px;
}
/*Fin de la línea de tiempo*/
  .borde{
  		border-bottom: 4px solid #00BFFF; /* Grosor, estilo y color de la línea */
  		width: 60px;
  		margin-top: 60px;
  		margin-bottom: 40px;
  		margin-left: 350px;
  }
  .jus{
  	text-align: justify;
  	margin-bottom: 40px;
  }
  .fond0{
  	background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
            url('img/fu.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center top;
  }
  
 .gradient-section {
    position: relative;
}

.gradient-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to left, rgba(173, 216, 230, 0) 0%, rgba(173, 216, 230, 2) 50%, rgba(173, 216, 230, 10) 100%);
    z-index: 2;
}

.col-text {
    position: relative;
    z-index: 3;
    padding-right: 20px; /* Espacio entre el texto y el degradado */
}

.col-image {
    position: relative;
    z-index: 1;
}

.pad{
	padding: 90px;
	font-size: 22px;
}
@media (max-width: 440px) {
	 .altura{
	 		padding: 70px;
	} 
}
@media (max-width: 1200px) {
	 .borde{

  		margin-left: 250px;
  }
}
@media (max-width: 1000px) {
	 .borde{

  		margin-left: 200px;
  }
}
@media (max-width: 777px) {
	 .borde{

  		margin-left: 150px;
  }
}
@media (max-width: 520px) {
	 .borde{

  		margin-left: 100px;
  }
}
.spp{
	margin-top: 73px;
}
.jus2{
	text-align: justify;
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
<div class="spp">
	<section class="fondo text-light altura">
    <div class="container ">
        <div class="row">
            <div>
                <div>
                    <p class="parr">
                        <a href="menu.jsp">Inicio</a> > 
                        <a href="Nosotros.jsp">Nosotros</a> >
                        <a href="Nosotros_historia.jsp" class="color-a">Nuestra Historia</a> 
                    </p>
                </div>
                <div class="fond">
                    <h1><strong>NUESTRA HISTORIA</strong></h1>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
<%--Fin de la Primera Seccion --%>

<%--Segunda Seccion --%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-7 mx-auto">
				<div class="text-center">
					<div class="borde"></div>
					<p class="jus">Hace más de tres décadas, en un rincón olvidado 
					de la ciudad, un grupo de estudiantes universitarios
					 decidió marcar la diferencia de una manera que cambiaría 
					 para siempre la vida de aquellos que más lo necesitaban.
					  Así comenzó la inspiradora historia de "Renovando Vidas",
					   una ONG humanitaria que ha iluminado corazones y 
					   transformado realidades.La chispa que dio origen a esta
					    organización nació del corazón compasivo de un grupo de
					     amigos universitarios que compartían una profunda 
					     preocupación por las desigualdades que observaban a
					      su alrededor. La falta de recursos y oportunidades 
					      en algunas comunidades los impulsó a tomar medidas 
					      concretas.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%--Final de la Segunda Seccion --%>

<section class="gradient-section">
    <div class="gradient-overlay"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-6 col-text pad ">
                <p class="jus2">
                    La motivación detrás de la creación de 'Renovando Vidas'
                     era simple pero profundamente arraigada en el amor por la
                      humanidad.
                    <br> <br>
                   La motivación detrás de la creación de 'Renovando Vidas'
                    era simple pero profundamente arraigada en el amor por la 
                    humanidad. Estos jóvenes habían presenciado de cerca el 
                    sufrimiento de las personas sin hogar, los niños que no 
                    podían acceder a la educación y las familias que luchaban 
                    por sobrevivir.
                </p>
            </div>
            <div class="col-6 col-image">
                <img src="img/ss.jpg" class="img-fluid h-100 w-100" alt="...">
            </div>
        </div>
    </div>
</section>


<%--Linea de Tiempo --%>
<section id=timeline>
	<h1>LÍNEA DE TIEMPO</h1>
	<p class="leader">Explora la evolución de Renovando Vidas a lo largo de su impactante viaje humanitario en nuestra línea de tiempo.</p>
	<div class="demo-card-wrapper">
		<div class="demo-card demo-card--step1">
			<div class="head">
				<div class="number-box">
					<span>01</span>
				</div>
				<h2><span class="small">Renovando Vidas</span> Fundación</h2>
			</div>
			<div class="body">
				<p>
				Fundada en 2005, "Renovando Vidas" surgió con la misión de 
				ayudar a las comunidades necesitadas. Inicialmente, se enfocó
				 en brindar apoyo alimentario y educación básica.
				</p>
				<img src="img/l-1.jpg" class="img-fluid" alt="...">
			</div>
		</div>

		<div class="demo-card demo-card--step2">
			<div class="head">
				<div class="number-box">
					<span>02</span>
				</div>
				<h2><span class="small">Primeros Proyectos Ayuda</span>Humanitaria</h2>
			</div>
			<div class="body">
				<p>
					En 2006, la ONG lanzó proyectos de distribución de 
					alimentos y educación para niños desfavorecidos.
				</p>
				<img src="img/l-3.jpg" class="img-fluid" alt="...">
			</div>
		</div>

		<div class="demo-card demo-card--step3">
			<div class="head">
				<div class="number-box">
					<span>03</span>
				</div>
				<h2><span class="small">Crecimiento y</span>Expansión</h2>
			</div>
			<div class="body">
				<p>
					Para 2010, "Renovando Vidas" había crecido 
					significativamente y ampliado sus operaciones 
					en todo el país, incluyendo programas de capacitación
					 vocacional.
				</p>
				<img src="img/l-4.jpg" class="img-fluid" alt="...">
			</div>
		</div>

		<div class="demo-card demo-card--step4">
			<div class="head">
				<div class="number-box">
					<span>04</span>
				</div>
				<h2><span class="small">Logros</span> Destacados</h2>
			</div>
			<div class="body">
				<p>
					En 2015, recibieron el Premio de Excelencia en Ayuda 
					Humanitaria y completaron proyectos de viviendas para
					familias afectadas por desastres.
				</p>
				<img src="img/l-5.jpg" class="img-fluid" alt="...">
			</div>
		</div>

		<div class="demo-card demo-card--step5">
			<div class="head">
				<div class="number-box">
					<span>05</span>
				</div>
				<h2><span class="small">Proyección</span> Futura</h2>
			</div>
			<div class="body">
				<p>
					En 2023, la ONG se enfoca en expandir sus programas educativos
					y proyectos sostenibles para abordar desafíos ambientales.
				</p>
				<img src="img/l-6.jpg" class="img-fluid" alt="...">
			</div>
		</div>
    
	</div>
</section>
<%--Fin de la Linea de tiempo --%>

<!-- Apartado siguiente -->
	<div class="container-fluid fond0 text-light p-5">
		<div class="row">
			<div class="col-md-6">
				<!-- Columna de la imagen -->
				<img src="img/ns-1.jpg" class="img-fluid img-res"  alt="...">
			</div>
			<div class="col-md-6">
				<!-- Columna de texto -->
				<div class="p-5">
					<h1 class="display-2">ACTUALIDAD</h1>
					<p class="lead my-4 jus2">
						Hoy, "Renovando Vidas" es un faro de esperanza en 
						medio de la oscuridad, recordándonos a todos que un 
						acto de amor puede cambiar el mundo. La visión de este
					    grupo de estudiantes universitarios se ha convertido 
					    en una fuerza transformadora que sigue inspirando a 
					    generaciones a hacer el bien y renovar vidas, un acto
					    de amor que ilumina el camino hacia un mundo más 
					    compasivo y solidario.
						</p>
				</div>
			</div>
		</div>
	</div>
	
	<section>
		<div class="container my-5">
			<div class="position-relative p-3 text-center text-muted bg-body border border-dashed rounded-5">
				<img class="bi mt-5 mb-3 img-fluid" alt="" src="img/r2.jpg">
				<h1 class="text-body-emphasis">Se parte de Nosotros</h1>
				<p class="col-lg-6 mx-auto mb-4">
      				Únete a nosotros y sé parte de este compromiso humanitario.
      				 Jumbotron difuminado: contenido provisional y motivación.
				</p>
				<a class="btn btn-primary px-5 mb-5" href="voluntariado.jsp">ÚNETE</a>
			</div>
		</div>
	</section>
	
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
