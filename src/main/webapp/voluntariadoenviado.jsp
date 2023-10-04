<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // Obtener la sesión existente o null si no existe
    HttpSession sessio = request.getSession(false);

    // Verificar si el usuario está autenticado
    Boolean autenticado = (sessio != null && sessio.getAttribute("voluntario") != null && (Boolean) sessio.getAttribute("voluntario"));

    if (autenticado != null && autenticado) {
        // El usuario está autenticado, mostrar el contenido de la página
    } else {
        // El usuario no está autenticado, redirigir voluntariado
        response.sendRedirect("voluntariado.jsp");
    }
%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	
<link rel="stylesheet"
	href="https://mdbootstrap.com/api/snippets/static/download/MDB5-Pro-Advanced_6.4.1/plugins/css/all.min.css">
<link rel="stylesheet" href="assets/css/volenv.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900|Manjari:400,700|Nunito:300,400,600,700,800|Roboto:300,400,500,700,900&amp;display=swap"
	rel="stylesheet">
<style>

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
					<li class="nav-item"><a class="nav-link" href="#!">Nosotros</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#!">Historias
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

<main>
<div id="__next">
<div class="sc-1dddf74d-0 coysMw">
<div aria-hidden="false" class="sc-1dddf74d-1 gqKMTm">
	<div class="sc-40aa91e1-6 gmSAms">
		<div class="sc-51c12d65-0 dYSiPu">
			<div class="sc-51c12d65-1 eiMKJA">
				<h1 class="sc-51c12d65-3 bdLOnx">¡Estás dentro del voluntariado!</h1>
				<h2 class="sc-51c12d65-4 benWpN">Te enviaremos un email a 
					<span id="email"></span> cuando sea tu turno de ayudar a la comunidad.</h2>
				<div>
					<div class="sc-bb267fd9-1 cGCLHA">
						<a class="sc-bb267fd9-2 fopBtT" href="voluntariado.jsp">Volver a voluntariados</a>
					</div>
					<h3 class="sc-bb267fd9-0 dQQKZW">¿Quieres saber más?</h3>
					<p class="sc-40aa91e1-1 kvLTRA">Mientras esperas, echa un vistazo a nuestras historias y eventos que se estan relizando.<a href="HisExito.jsp"> 👇</a></p>
				</div>
			</div>
			<div class="sc-51c12d65-2 gOtVzG">
				<a class="sc-4ffe2525-0 fzWmrg" href="voluntariado.jsp#fa1">
				<div class="sc-4ffe2525-1 jQhqCk">¿Todavía tienes preguntas? </div>
					<div class="sc-4ffe2525-2 ixCKCP">Nuestras preguntas frecuentes proporcionan más información sobre los voluntariados</div></a>
			</div>
		</div>
	</div>
</div>
</div>
</div>


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
              <p id="footerp">Organización sin fines de lucro creada para ayudar a los mas neceesitados del Perú</p>
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
                  <a id="footera" href="#">Nosotros</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Historias de exito </a>
                </li>
                <li id="footerli">
                  <a id="footera" href="voluntariado.jsp">Voluntariado</a>
                </li>
                <li id="footerli">
                  <a id="footera" href="#">Contactanos</a>
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
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	

	<script>

	
		var navBar = document.querySelector('.js-nav-bar');
		if (typeof navBar === 'object')
			document.documentElement.style.setProperty('--nav-height',
					navBar.offsetHeight + 'px');
	</script>
	
	
	<script>
	 $(document).ready(function() {
         // Captura el correo del formulario enviado (desde la URL)
         const urlParams = new URLSearchParams(window.location.search);
         const correoVoluntario = urlParams.get('q');

         // Actualiza el texto en la página con el correo dinámico
         $("#email").text(correoVoluntario);
        });
    </script>
    <script type="text/javascript">
 // Función para cerrar la sesión
    function cerrarSesion() {
        // Realiza una solicitud AJAX para cerrar la sesión en el servidor
        $.ajax({
            type: "POST",
            url: "CerrarSesionServlet", 
            success: function() {
                console.log("Sesión cerrada");
            },
            error: function() {
                console.error("Error al cerrar la sesión");
            }
        });
    }

    // Asigna la función cerrarSesion al evento beforeunload 
    $(window).on('beforeunload', function() {
        cerrarSesion();
    });
    </script>
    
    
	</body>
</html>