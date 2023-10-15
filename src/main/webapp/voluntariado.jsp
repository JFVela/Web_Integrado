<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base target="_parent">
<title> ONG | Voluntariado</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap">
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/css/mdb.min.css">
	
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/plugins/css/all.min.css">
<link rel="stylesheet" href="assets/css/voluntario.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900|Manjari:400,700|Nunito:300,400,600,700,800|Roboto:300,400,500,700,900&amp;display=swap"
	rel="stylesheet">
<style>

.modal-header {
	color: #fff;
	background: #428bca;
	display: flex;
	justify-content: center;
}

.help-block {
	color: red;
}

.form-group.has-error .form-control-label {
	color: red;
}

.form-group.has-error .form-control {
	border: 1px solid red;
	box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
}

.navbar-nav .nav-link {
	transition: color 0.3s;
}

.navbar-nav .nav-link:hover {
	color: red;
}

body.shimeji-pinned iframe {
	pointer-events: none;
}

body.shimeji-select-ie {
	cursor: cell !important;
}

#shimeji-contextMenu::-webkit-scrollbar {
	width: 6px;
}

#shimeji-contextMenu::-webkit-scrollbar-thumb {
	background-color: rgba(30, 30, 30, 0.6);
	border-radius: 3px;
}

#shimeji-contextMenu::-webkit-scrollbar-thumb:hover {
	background: #555;
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
					<li class="nav-item"><a class="nav-link" href="menu.html">Inicio</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Nosotros.jsp">Nosotros</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="HisExito.jsp">Historias
							de éxito</a></li>
					<li class="nav-item"><a class="nav-link" href="voluntariado.jsp">Voluntariado</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#!">Blog</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Eventos
							y noticias</a></li>
					<button type="button" class="btn btn-primary ms-3">Dona</button>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar -->

	<main role="main" tabindex="-1" id="main-content">
		<div id="cta-section" class="cta-section cta-m-section">

			<header class="c-m-cta container">
				<div class="row">
					<div class="col-md-6">
						<h1 class="c-cta__headline o-title--large pb-3">¡Únete a
							nuestro equipo de voluntarios y haz una diferencia en la
							comunidad! Tu ayuda es valiosa para nosotros.</h1>
						<div class="c-cta__content-inner">
							<button type="button" class="c__cta btn btn-rounded" data-bs-toggle="modal" data-bs-target="#exampleModal">Inscríbete</button>
						</div>
						
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
                <h5 class="modal-title form-head text-bold fs-4">Inscríbete para ser voluntario</h5>
                
            </div>
            <div class="modal-body">
                <div class="success-message" id="success" style="display: none;">
                    <h3>Tu solicitud ha sido aceptada!</h3>
                    <br/>
                    <p>Las familias agradecen tu apoyo</p>
                    <br/>
                    <p>Te llegara un email con mas información</p>
                    </div>
                <form id="contact-form" method="post" action="ServletVoluntario?accion=guardar">
                   <div class="form-group">
                        <label for="dni" class="label-form text-secondary">DNI</label>
                        <input type="text" name="dni" class="form-control dni-label" id="dni" required>
                        
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="label-form text-secondary">Nombre</label>
                        <input type="text" class="form-control name-label" name="nombre" id="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="label-form text-secondary">Apellido Paterno</label>
                        <input type="text" name="paterno" class="form-control paterno-label" id="paterno" required>
                    </div>
                    <div class="form-group">
                        <label for="materno" class="label-form text-secondary">Materno Paterno</label>
                        <input type="text" name="materno" class="form-control materno-label" id="materno" required>
                    </div>
                    <div class="form-group">
                        <label for="email" class="label-form text-secondary">E-mail</label>
                        <input type="email" name="email" class="form-control email-label" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono" class="label-form text-secondary">Télefono</label>
                        <input type="text" name="telefono" class="form-control telefono-label" id="telefono" required>
                    </div>
                    <div class="form-group">
						<label for="eventos" class="form-label text-secondary">Eventos</label>
						<select class="form-select"  name="evento" id="id-evento" >
							<option value=" ">[Seleccione evento]</option>
						</select>
					</div>	
                    <div class="form-group">
                        <label for="especialidad" class="label-form text-secondary">Especialidad</label>
                        <select class="form-select" name="especialidad"  id="id-especialidad">
                        	<option value=" ">[Seleccione tipo de voluntariado]</option>
                        </select>	
                    </div>
                   <div class="form-group">
					    <label for="ciudad" class="label-form text-secondary">Ciudad</label>
					    <select name="ciudad" class="form-control ciudad-label" id="ciudad" required>
					      	<option value=" ">[Seleccione una ciudad]</option>
					    </select>
					    
					</div>
					<div class="form-group">
					    <label for="provincia" class="label-form text-secondary">Provincia</label>
					    <select name="provincia" class="form-control provincia-label" id="provincia" required>
							<option value=" ">[Seleccione una provincia]</option>
					    </select>
					</div>
					<div class="form-group">
					    <label for="distrito" class="label-form text-secondary">Distrito</label>
					    <select name="distrito" class="form-control distrito-label" id="distrito" required>
                        	<option value=" ">[Seleccione un distrito]</option>
					    </select>
					</div>
                   
                    <div class="form-group form-check personal-group pt-3">
                        <input type="checkbox" name="personal" class="form-check-input" id="soglasieid" required>
                        <label class="form-check-label personal-label label-form fs-6 text-primary text-opacity-50" for="soglasieid">
                        Al participar en el voluntariado, acepta los términos y politicas de Renovando Vidas.</label>
                    </div>
                    <div class="text-center pt-2">
                    <button type="submit" class="submit-btn c__cta btn btn-rounded fs-5" style="margin-bottom: 10px;">Inscríbirse</button>
                    </div>
                </form>
            </div>
    </div>
  </div>
</div>
					</div>
					<div class="col-md-6">
						<div class="o-image c-cta__image-wrap">
							<img class="c-cta__image lazyautosizes lazyloaded"
								src="assets/img/volunter01.jpg"
								data-widths="[180,360,540,720,900,1080,1296,1512,1728,1944]"
								data-aspectratio="1.5002344116268167" data-sizes="auto"
								tabindex="-1" width="2000" height="1333.125" alt="" />
						</div>
					</div>
				</div>
			</header>


		</div>
		<section id="tipos-de-voluntariado" class="container mt-5">
			<h2 class="text-center">Tipos de Voluntariado</h2>
			<hr class="my-4">
			<div class="container mt-5">
				<div class="row justify-content-center">
					<!-- Utiliza justify-content-center para centrar el contenido horizontalmente -->
					<div class="col-md-6 text-center">
						<!-- Ajusta el tamaño de la columna según tus preferencias -->
						<p class="fs-6 pb-5">Entrelazamos sueños y realidades en el
							tejido de nuestra labor voluntaria en la ONG, hilando campañas
							que despiertan la conciencia y nutren un nuevo propósito de
							cambio frente a la pobreza.</p>
					</div>
				</div>
			</div>
		</section>
		<section id="five" class="Hoja estilo1 especial">

			<section class="mvv">
				<div class="col1">
					<div class="columna1">
						<img src="assets/img/education.jpg" alt="Educación"
							class="img-fluid w-100 rounded-6">

						<h2 class="mvvtit pt-5 pb-3">Educación</h2>
						<p
							class="sm:text-sm md:text-base xl:text-xl lg:text-lg: 2xl:text-2xl">
							Impulsa la educación en tu comunidad.</p>
					</div>
				</div>

				<div class="col2">
					<div class="columna2">
						<img src="assets/img/alimentatio.jpg" alt="Educación"
							class="img-fluid w-100 rounded-6">
						<h2 class="mvvtit pt-5 pb-3">Alimentación</h2>
						<p
							class="sm:text-sm md:text-base xl:text-xl lg:text-lg: 2xl:text-2xl">
							Combate el hambre y promueve una nutrición adecuada.</p>
					</div>
				</div>

				<div class="col3">
					<div class="columna3">
						<img src="assets/img/emergency.jpeg" alt="Educación"
							class="img-fluid w-100 rounded-6">
						<h2 class="mvvtit pt-5 pb-3">Emergencias</h2>
						<p
							class="sm:text-sm md:text-base xl:text-xl lg:text-lg: 2xl:text-2xl">
							Despliega acciones para ayudar a los más necesitados.</p>
					</div>
				</div>
			</section>
		</section>
		<div id="howvol" class="container-fluid pt-5 pb-5">
			<section class="py-5">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2 class="mb-3 ">¿Cómo ser un voluntario?</h2>
							<hr class="p-2">
						</div>
					</div>
					<div class="row">

						<div class="col-md-6 col-lg-4">
							<a href="#"
								class="a-block sm d-flex align-items-center height-md"
								style="background-image: url('https://images.unsplash.com/photo-1497250681960-ef046c08a56e?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=1974&amp;q=80');">
								<div class="text">
									<div class="post-meta">
										<span class="category">Paso 1</span> <span class="mr-2">Regístrate
										</span> &bullet;
									</div>
									<h3>Inscríbete en nuestro formulario de voluntarios</h3>
								</div>
							</a>
						</div>

						<div class="col-md-6 col-lg-4">
							<a href="#"
								class="a-block sm d-flex align-items-center height-md"
								style="background-image: url('https://images.unsplash.com/photo-1497504264883-854aff4f6005?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=1974&amp;q=80');">
								<div class="text">
									<div class="post-meta">
										<span class="category">Paso 2</span> <span class="mr-2">Selecciona
											tu área </span> &bullet;
									</div>
									<h3>Elige el campo de Voluntariado que más te apasione</h3>
								</div>
							</a>
						</div>

						<div class="col-md-6 col-lg-4">
							<a href="#"
								class="a-block sm d-flex align-items-center height-md"
								style="background-image: url('https://images.unsplash.com/photo-1495287924875-c158d2e8aafc?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=1974&amp;q=80');">
								<div class="text">
									<div class="post-meta">
										<span class="category">Paso 3</span> <span class="mr-2">Capacitación
										</span> &bullet;
									</div>
									<h3>Participa en sesiones para adquirir las habilidades
										necesarias</h3>
								</div>
							</a>
						</div>

						<div class="col-md-6 col-lg-4">
							<a href="#"
								class="a-block sm d-flex align-items-center height-md"
								style="background-image: url('https://images.unsplash.com/photo-1500206329404-5057e0aefa48?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=2076&amp;q=80');">
								<div class="text">
									<div class="post-meta">
										<span class="category">Paso 4</span> <span class="mr-2">¡Comienza
											a ayudar!</span> &bullet;
									</div>
									<h3>Únete a nuestras actividades y marca la diferencia</h3>
								</div>
							</a>
						</div>


						<div class="col-md-6 col-lg-4">
							<div class="text pt-5">

								<h2
									class="text-black text-lg-center text-xxl-center fw-bold fs-1 pt-5">Únete
									ahora y sé parte de las personas que hacen del mundo uno mejor.</h2>
							</div>
						</div>


						<div
							class="col-md-6 col-lg-4 pt-5 align-content-center align-items-center">
							<div id="btnPasos" class="c-cta__content-inner">
								<buttton type="button" class="c__cta btn btn-rounded fs-4 pt-3 pb-3" data-bs-toggle="modal" data-bs-target="#exampleModal" href="">Inscríbete</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div id="fa1" class="pt-5">
			<div id="faq">
				<h1 id="faqh1">Preguntas frecuentes</h1>
				<ul>
					<li><input type="checkbox" checked> <i></i>
						<h2>¿Cómo puedo convertirme en voluntario?</h2>
						<p>Inscríbete en el fomulario, selecciona el áre en el que
							deseas apoyar y te contactaremos.</p></li>
					<li><input type="checkbox" checked> <i></i>
						<h2>¿Cuáles son los requisitos para ser voluntario?</h2>
						<p>Ser mayor de 18 años, tener tiempo disponible y ganas de
							querer ayudar.</p></li>
					<li><input type="checkbox" checked> <i></i>
						<h2>¿Cómo puedo obtener más información sobre las
							oportunidades de voluntariado disponibles?</h2>
						<p>Para más información contacta con la empresa a través del
							número proporcionado en la página.</p></li>
				</ul>
			</div>
		</div>
		
		<!-- Footer -->
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
              <p id="footerp">Organización sin fines de lucro creada para ayudar a los más neceesitados del Perú</p>
              <ul class="contact-details">
                <li id="footerli">
                  <span class="icon-earphones"></span> Telef:
                  <a id="footera"href="tel:344-755-111">344-755-111</a>
                </li>
                <li id="footerli">
                  <span class="icon-envelope-open"></span>
                  <a id="footera" href="">51, San Martín 15108</a>
                </li>
              </ul>
            </div>
          </div>
          <!-- Ends: .footer-widget -->
        </div>
        <!-- end /.col-md-4 -->
        <div class="col-md-3 col-sm-4">
          <div class="footer-widget">
            <div class="footer-menu footer-menu--1">
              <h4 id="footerh4"class="footer-widget-title">Categotoria popular</h4>
              <ul id="footerul">
                <li id="footerli">
                  <a  id="footera" href="voluntariado.jsp">Voluntariado</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Donar</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="voluntariado.jsp#howvol">¿Cómo ser voluntario?</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Admin</a>
                </li>
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
                <li id="footerli">
                  <a id="footera" href="Nosotros.jsp">Nosotros</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="HisExito.jsp">Historias de éxito </a>
                </li>
                <li id="footerli">
                  <a id="footera" href="voluntariado.jsp">Voluntariado</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Contáctanos</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Eventos &amp; Noticiaas</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Blog</a>
                </li>
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
              <h4 id="footerh4"class="footer-widget-title">Soporte de ayuda</h4>
              <ul id="footerul">
                <li id="footerli">
                  <a id="footera" href="#">Foro de soporte</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Terminos &amp; Condiciones</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Politica de privacidad</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="voluntariado.jsp#fa1">FAQ voluntariado</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">FAQ Donar</a>
                </li>
                <li id="footerli">
                  <a id="footera"  href="#">FAQ Nosotros</a>
                </li>
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
            <p id="footerp">© 2023	
              <a id="footera" href="#">Renovando Vidas</a>. Todos los derechos reservados. Creado por
              <a id="footera" href="#">J.José, Juan, Diego, Alex</a>
            </p>
          </div>

          
        </div>
      </div>
    </div>
  </div>
</footer>
	</main>
	
	
<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- libreria JS de bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<script  src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/js/mdb.min.js"></script>
	<script type="text/javascript"
		src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/plugins/js/all.min.js"></script>
	<script src="assets/js/voluntariado.js"></script>
	<script src="assets/js/validacion.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
	
	<script type="text/javascript">
		{
		}
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/breakp
	<oints.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.1.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<!-- libreria para validar (bootstrap validator) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	
	<script>

	
		var navBar = document.querySelector('.js-nav-bar');
		if (typeof navBar === 'object')
			document.documentElement.style.setProperty('--nav-height',
					navBar.offsetHeight + 'px');
	</script>
	
	<script>
	//invocar funcion
	cargarCategoria();
	//crear funcion para leer JSON
	function cargarCategoria(){
		$.get("ServletEventosJSON", function(response){
			//bucle each "for"
			$.each(response,function(index,item){
				//lenar combo
				$("#id-evento").append("<option value='"+item.id_evento+"'>"+item.nombre+"</option")
			})
			console.log(response);
		})
		
		
		
		$.get("ServletEspecialidadesJSON", function(response){
			$.each(response, function(index,item){
				$("#id-especialidad").append("<option value='"+item.IdEspecialidades+"'>"+item.nombre+"</option")
			})
		})
		
		
	}	
	</script>
	
	
	
	<script> //Script para cargar dinamicamente los select de Ciudad, Distrito y Provincia.
    // Obtener una referencia a los elementos select
    const ciudadSelect = document.getElementById('ciudad');
    const provinciaSelect = document.getElementById('provincia');
    const distritoSelect = document.getElementById('distrito');

    // Realizar una solicitud AJAX para cargar el archivo JSON
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'assets/map.pe.json', true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            const data = JSON.parse(xhr.responseText);

            // Llenar el select de ciudades
            for (const ciudad in data) {
                ciudadSelect.options.add(new Option(ciudad, ciudad));
            }

            // Manejar el cambio en el select de ciudades
            ciudadSelect.addEventListener('change', function () {
                // Obtener la provincia seleccionada
                const selectedCiudad = ciudadSelect.value;
                const provincias = data[selectedCiudad];

                // Limpiar y llenar el select de provincias
                provinciaSelect.innerHTML = '<option value="">[Seleccione una provincia]</option>';
                for (const provincia in provincias) {
                    provinciaSelect.options.add(new Option(provincia, provincia));
                }
            });
         	// Manejar el cambio en el select de provincias
            provinciaSelect.addEventListener('change', function () {
                // Obtener la provincia y ciudad seleccionadas
                const selectedCiudad = ciudadSelect.value;
                const selectedProvincia = provinciaSelect.value;
                const distritos = data[selectedCiudad][selectedProvincia];

                // Limpiar y llenar el select de distritos
                distritoSelect.innerHTML = '<option value="">[Seleccione un distrito]</option>';
                for (const distrito in distritos) {
                    // Debes acceder al valor del distrito en lugar de todo el objeto distritos
                    distritoSelect.options.add(new Option(distrito, distritos[distrito]));
                }
            });
        }
    };

    xhr.send();
</script>

<script>
$(document).ready(function() {
    // Detecta cambios en el campo de DNI
    $("#dni").on("input", function() {
        console.log("Input event triggered."); // Para verificar si se dispara el evento

        // Obtén el valor del campo de DNI
        var dni = $(this).val();
        
        // Realiza la solicitud AJAX solo si el DNI tiene 8 caracteres 
        if (dni.length === 8) {
            $.ajax({
                type: "POST", // Método HTTP POST
                url: "ServletVoluntario", // URL del servlet
                data: {
                    accion: "verificarDNI", // Acción para el servlet
                    dni: dni // Valor del DNI
                },
                success: function(data) {
                    // La solicitud fue exitosa, data contiene la respuesta JSON del servlet
                    console.log("Received JSON response: ", data); // Verifica la respuesta JSON
                    
                    if (data.status === "dni_existente") {
                        // El DNI existe, muestra un SweetAlert
                        Swal.fire({
                        	 title: '¡Voluntario ya registrado!',
                        	  text:'El DNI: '+ dni+' ya esta registrado, espera una respuesta en tu email',
                        	  imageUrl: 'https://media0.giphy.com/media/AO5qaphTxRnyw/giphy.gif?cid=ecf05e47o1crybylqqrjk5k3v6ep6hiqcy37rvh85eqsiii2&ep=v1_gifs_related&rid=giphy.gif&ct=g',
                        	  imageWidth: 400,
                        	  imageHeight: 200,
                        	  imageAlt: 'imgError',
						});
                    } else {
                    }
                },
                error: function() {
                    // Ocurrió un error en la solicitud AJAX
                    console.error("Error en la solicitud AJAX");
                }
            });
        }
    });
});
</script>


	
	<script type="text/javascript"> //validacion
	$(document).ready(function() {
	    $('#contact-form').bootstrapValidator({
	        fields: {
	            nombre: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo nombre es obligatorio'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ\.]{2,20}$/,
	                        message: 'Campo nombre con errores (Letras, espacio, vocales con tilde)'
	                    }
	                }
	            },
	            paterno: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo apellido paterno es obligatorio'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ\.]{2,20}$/,
	                        message: 'Campo apellido paterno con errores (Letras, espacio, vocales con tilde y .)'
	                    }
	                }
	            },
	            materno: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo apellido materno es obligatorio'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑ\.]{2,20}$/,
	                        message: 'Campo apellido materno con errores (Letras, espacio, vocales con tilde y .)'
	                    }
	                }
	            },
	            dni: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo DNI es obligatorio'
	                    },
	                    regexp: {
	                        regexp: /^[0-9]{8}$/,
	                        message: 'Campo DNI con errores (8 dígitos numéricos)'
	                    }
	                }
	            },
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo email es obligatorio'
	                    },
	                    emailAddress: {
	                        message: 'El campo email no es válido'
	                    }
	                }
	            },
	            telefono: {
	                validators: {
	                    notEmpty: {
	                        message: 'El campo teléfono es obligatorio'
	                    },
	                    regexp: {
	                        regexp: /^[0-9]{9}$/,
	                        message: 'Campo teléfono con errores (9 dígitos numéricos)'
	                    }
	                }
	            },
	            evento: {
	                validators: {
	                    notEmpty: {
	                        message: 'Por favor seleccione un evento'
	                    }
	                }
	            },
	            especialidad: {
	                validators: {
	                    notEmpty: {
	                        message: 'Por favor seleccione una especialidad'
	                    }
	                }
	            },
	            ciudad: {
	                validators: {
	                    notEmpty: {
	                        message: 'Por favor seleccione una ciudad'
	                    }
	                }
	            },
	            provincia: {
	                validators: {
	                    notEmpty: {
	                        message: 'Por favor seleccione una provincia'
	                    }
	                }
	            },
	            distrito: {
	                validators: {
	                    notEmpty: {
	                        message: 'Por favor seleccione un distrito'
	                    }
	                }
	            },
	            personal: {
	                validators: {
	                    notEmpty: {
	                        message: 'Debe aceptar los términos y políticas'
	                    }
	                }
	            }
	        }
	    });
	});



	</script>
</body>
</html>