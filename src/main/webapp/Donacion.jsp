<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link
	href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css"
	rel="stylesheet">

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
<link
	href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/menu.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">


<title>Donacion</title>

<%--ESTILOS --%>
<style>
.btn-neon{
		position: relative;
		display: inline-block;
		padding: 10px 15px;
		color: black;
		font-size: 16px;
		border-radius:10px;
		text-decoration: none;
		overflow: hidden;
		transition:0.2s;
		border: 2px solid #1f526d; 
		cursor: pointer;
	}
	.btn-neon:hover{
		background: #1f526d;
		box-shadow: 0 0 10px #1f526d 0 40px #1f526d 0 80px #1f526d;
		transition-delay:1s;
		color: white !important;
		border: transparent; 
	}
	.btn-neon span{
		position: absolute;
		display: block;
	}
	#span1{
		top: 0;
		left: -100%;
		width: 100%;
		height: 2px;
		background: linear-gradient(90deg, transparent, #1f526d)
	}
	.btn-neon:hover #span1{
		left:100%;
		transition: 1s;  
	}
	#span3{
		bottom: 0;
		right: -100%;
		width: 100%;
		height: 2px;
		background: linear-gradient(270deg, transparent, #1f526d)
	}
	.btn-neon:hover #span3{
		right:100%;
		transition: 1s;  
	}
	#span2{
		top: -100%;
		right: 0;
		width: 2px;
		height: 100%;
		background: linear-gradient(180deg, transparent, #1f526d)
	}
	.btn-neon:hover #span2{
		top:100%;
		transition: 1s;
		transition-delay:0.25s;
	}
	#span4{
		bottom: -100%;
		left: 0;
		width: 2px;
		height: 100%;
		background: linear-gradient(360deg, transparent, #1f526d)
	}
	.btn-neon:hover #span4{
		bottom:100%;
		transition: 1s;
		transition-delay:0.75s;
	}--%>
.navbar-nav .nav-link {
	transition: color 0.3s;
}
.estilo-parr{
	padding: 10px 80px 0 80px;
	color: #1f526d;
}
.navbar-nav .nav-link:hover {
	color: red;
}
.color-text{
	color: #043a4a;
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

.estilo-don {
	margin-bottom: 10px;
}

.custom-modal-dialog {
	border-radius: 40px;
}

.estilo-col2 {
	background-color: #faf3eb;
	border-radius: 30px;
	padding-bottom: 10px;
}

.error {
	border: 1px solid red;
	box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	color: #f00; /* Texto en rojo */
}

.success {
	border: 1px solid green;
	box-shadow: 0 0 0 0.2rem rgba(0, 128, 0, 0.18); /* Cambiado a verde */
	color: green; /* Texto en verde */
}

.desaparecer {
	display: none;
}

.tam {
	height: 605px;
}

.padd {
	padding: 40px 100px 100px 100px;
}

.contenedor {
	max-width: 900px;
	margin: 0 auto;
	border-radius: 25px;
}

.linea-azul {
	border: none; /* Elimina el borde predeterminado */
	height: 1px; /* Altura de la línea */
	background-color: #7da2b2; /* Color de fondo azul */
	width: 100%; /* Ocupa todo el ancho disponible */
}
.miDiv {
    box-shadow: -10px 10px 20px rgba(0, 0, 0, 0.5);
    transition: box-shadow 0.5s ease-in-out; /* Transición solo para la sombra */
}

.miDiv:hover {
    box-shadow: -10px 10px 20px rgba(0, 0, 0, 0.5), 0 0 20px rgba(0, 0, 0, 0.5); /* Agrega otra sombra */
    transition: box-shadow 0.5s ease-in-out; /* Ajusta la transición según sea necesario */
}

.linea-vertical {
	border-right: 1px solid #7da2b2; /* Establece un borde izquierdo */
	margin: 0 auto 0 0;
	/* Elimina el margen derecho, centra horizontalmente y evita márgenes superior e inferior */
	width: 1px;
}

.modal-body {
	margin-left: 0;
	margin-right: 0;
	padding-left: 0;
	padding-right: 0;
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

#formulario-section {
	border-radius: 30px 0px 0px 30px;
	margin-left: 80px;
}

.sombra {
	-webkit-box-shadow: 0px 5px 15px 0px rgba(112, 112, 112, 1);
	-moz-box-shadow: 0px 5px 15px 0px rgba(112, 112, 112, 1);
	box-shadow: 0px 5px 15px 0px rgba(112, 112, 112, 1);
}

.nav-link.active:focus {
	background-color: #dc3545;
	color: white;
}

.ra {
	padding: 20px
}

.spa {
	margin-left: 5px;
}

.custom-modal-row {
	max-width: 100%; /* Establece un ancho máximo para la fila */
	margin: 0 auto; /* Centra la fila horizontalmente en el modal */
}

.espace {
	margin-left: 20px;
}

.custom-modal-dialog {
	max-width: 750px; /* Establece el ancho máximo deseado */
	width: 90%; /* Puedes ajustar este valor según tus necesidades */
}

.scrollable-form {
	overflow-y: scroll;
	max-height: 370px;
	/* Establece la altura máxima según tus necesidades */
	border-radius: 15px;
}

@media ( max-width : 1900px) {
	.padd {
		padding-top: 10px;
	}
}

@media ( max-width : 1093px) {
	.padd {
		padding: 0px;
	}
}

@media ( max-width : 891px) {
	.padd {
		padding: 0px;
	}
}

.fondo {
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url('img/r2.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center top;
}

@keyframes spin { 0% {
	transform: rotate(0deg);
}
	100%{transform:rotate(360deg);}
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
					<li class="nav-item"><a class="nav-link"
						href="voluntariado.jsp">Voluntariado</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Eventos
							y noticias</a></li>
					<a type="#" class="btn btn-primary ms-3" href="Donacion.jsp">Dona</a>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar -->

	<div class="container-fluid fondo tam">
		<div class="row padd">
			<!-- Columna de la imagen -->
			<div class="col-md-9 text-light"
				style="padding-top: 170px; font-size: 50px">
				<h1 class="display-2">
					<strong>¡Un pequeño acto</strong>
				</h1>
				<h1 class="display-2">
					<strong>crea un gran impacto!</strong>
				</h1>
			</div>
		</div>
	</div>


	<!-- Modal de verificación -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered custom-modal-dialog ">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #7ca1b1;"></div>
				<div class="modal-body text-center">

					<div class="linea-azul pt-1"></div>
					<h1 class="p-4 display-5" style="color: #1f4145;">
						<strong>¿Ya tienes una cuenta?</strong>
					</h1>
					<div class="linea-azul pb-1"></div>
					<div class="row custom-modal-row">
						<div class="col mt-2">
							
							<div class="d-grid gap-2  mx-auto">
								<img src="img/amor.png" class="img-fluid mx-auto" style="height: 150px;width: 150px">
								<div class="linea-azul"></div>
								<p class="p-2">Selecciona la opción que corresponda a tu estado de registro
								 para avanzar con tu donación. Queremos
								   facilitar el proceso según tus necesidades y garantizar
								    una experiencia de donación personalizada. ¡Tu contribución
								     marca la diferencia!</p>
								<div class="btn-group mx-auto" role="group" aria-label="Basic mixed styles example">
								  <button id="id-no" type="button" class="btn btn-danger ">No</button>
								  <button id="id-si" type="button" class="btn btn-success">Si</button>
								</div>
							</div>
						</div>
						<div class="linea-vertical" style="margin-top: 15px;"></div>
						<div class="col">
							<div class="col-12 pt-4">
								<div class="desaparecer" id="email-correo" >
								<p>Por favor, ingresa tu correo electrónico para verificar tu identidad y registrar
								 tu generosidad de manera segura.</p>
								  <label id="id-emailEnvio" >Correo Electrónico</label>
								  <form id="formInputCorreo">
									  <div class="input-group m-2 ">
									  	 <span class="input-group-text" id="basic-addon1">@</span>
 										 <input type="text" class="form-control"
 										  placeholder="@.com" aria-label="Username" 
 										  id="id-ingresoCorreo" aria-describedby="basic-addon1" name="ingresoCorreo">
									  </div>
									      <div id="countdown" class="pb-2"></div>
									  
									  	<div id=msg-error></div>
										<button id="startCountdown"	class="btn btn-outline-success">Enviar</button>
								</form>
								</div>
							
								<label class="mx-auto" id="confirmationLabel"
									style="display: none">Código de confirmación</label>
									<div class="input-group mb-3">
									  <span class="input-group-text" id="inputGroup-sizing-default" style="display: none">Código</span>
									  <input type="text"  id="confirmationInput" class="form-control" 
									  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="display: none">
									</div>
									
									<div id="ms-error" class="m-2"></div>
									<button id="confirmationButton"
									style="display: none" type="button" class="mx-auto btn btn-outline-warning">Confirmar</button>
								
							</div>
							<form id="formRegistro" method="post"
								action="ServletDonante?accion=insertarModal">
								<div class="col">
									<p>¡Completa tus Datos y Haz la Diferencia!</p>
									<h4 style="color: #1f4145;">Información Personal</h4>
									<div class="d-flex">
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label">DNI</label>
											<input type="text" class="form-control" placeholder="DNI:"
												name="dni">
										</div>

										<div class="form-group spa">
											<label for="exampleInputEmail1" class="form-label">Nombre</label>
											<input type="text" class="form-control" placeholder="Nombre:"
												name="nombre">
										</div>
									</div>
									<div class="d-flex">
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label">Paterno</label>
											<input type="text" class="form-control"
												placeholder="Apelldio Paterno:" name="paterno">
										</div>



										<div class="form-group spa">
											<label for="exampleInputPassword1" class="form-label">Materno</label>
											<input type="text" class="form-control"
												placeholder="Apellido Materno:" name="materno">
										</div>
									</div>

									<div class="d-flex">
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label">Celular</label>
											<input type="text" class="form-control numcel"
												placeholder="Número Celular:" name="celular">
											<div class="mensajeCelular" style="text-align: left;"></div>
										</div>



										<div class="form-group spa">
											<label for="departamento" class="label-form text-secondary">Departamento</label>
											<select name="departamento"
												class="form-control departamento-label" id="id-departamento"
												required>
												<option value=" ">[Departamento]</option>
											</select>
										</div>
									</div>
									<div class="d-flex">
										<div class="form-group">
											<label for="provincia" class="label-form text-secondary">Provincia</label>
											<select name="provincia" class="form-control provincia-label"
												id="id-provincia" required>
												<option value=" ">[Provincia]</option>
											</select>
										</div>
										<div class="form-group spa">
												<label for="distrito" class="label-form text-secondary">Distrito</label>
												<select name="distrito" class="form-control distrito-label"
													id="id-distrito" required>
													<option value=" ">[Distrito]</option>
												</select>
											</div>
										</div>
									<div class="d-flex">
										<div class="form-group">
											<label for="exampleInputPassword1" class="form-label">Email</label>
											<input type="text" class="form-control correo"
												placeholder="@gmail.com" name="email">
											<div class="mensajeEmail" style="text-align: left;"></div>
										</div>

										<div class="form-group spa">
											<label for="exampleInputEmail1" class="form-label">Dirección</label>
											<input type="text" class="form-control"
												placeholder="Dirección:" name="direccion">
										</div>
									</div>
									<button type="submit" class="btn btn-outline-success">Registrar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="id-cerrar" type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>

	<%--TIPOS DE DONACIONES --%>
	<div class="p-5 estilo-don" id="donaAqui">
		<div class="container-fluid">
			<div class="row">
				<%--PRIMERA COLUMNA --%>
				<div class="miDiv col estilo-col2 " style="margin-right: 40px;">
					<div class="text-center p-4">
					
						<h1 class="color-text">
							<strong>Donación Física</strong>
						</h1>
						<p class="estilo-parr">Tu
							donación física tiene un impacto local. Al ofrecer recursos
							tangibles, marcas la diferencia en comunidades cercanas.</p>
						
							<div class="row">
								<div class="col">
								<img src="img/ojoq.png" class="img-fluid">
								</div>
								<div class="col pt-5">
								<div class="col">
									<img src="img/donacion-de-alimentos.png" class="img-fluid" style="height: 130px; width: 130px;">
									<p>¡Juntos podemos cambiar vidas! Sé parte del cambio: presiona aquí
									 para ser un héroe y marcar la diferencia en el
									  mundo.</p>
								</div>
								<div class="col">
									<a class="btn-neon btn-cerrar2" id="donar-fisico">
										<span id="span1"></span>
										<span id="span3"></span>
										<span id="span2"></span>
										<span id="span4"></span>
										Donar Físico</a>
								</div>
								</div>
							</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="donafisico" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Donación
										Física</h1>
									<button type="button" class="btn-close btn-cerrar"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-6 ms-auto">
												<form id="formDonante" method="post"
													action="ServletDonante?accion=insertarfi">


													<h1>Donación</h1>


													<%-- Físico --%>
													<%--Locación --%>
													<div id="location" class="form-group">
														<label for="exampleInputEmail2" class="form-label">Lugar
															de Entrega</label> <select class="form-select form-control"
															aria-label="Default select example" id="id-location"
															name="locacion">
															<option value="" selected hidden="disable">Seleccione
																tipo de donación</option>
														</select>
													</div>
													<%--Descripción --%>

													<div id="textareaDes" class="form-group">
														<label for="exampleInputEmail2" class="form-label">Descripción:</label>
														<textarea type="text" style="height: 100px" name="descrip"
															class="form-control"
															placeholder="Donaré una caja llena de alimentos no perecederos, mantas y ropa abrigada para apoyar a las personas."></textarea>
													</div>
													<%--Final  Físico --%>
												</form>

											</div>
											<div class="col-md-6 ms-auto">
												<img src="img/donar-box.jpg" class="img-fluid" style="height: 350px;">
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary btn-cerrar1"
										data-bs-dismiss="modal">Cerrar</button>
									<button id="botonexterno" class="btn btn-primary">Donar</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%--FIN DONACION FISICO --%>

				<%--SEGUNDA COLUMNA --%>
				<%--DONACION VIRTUAL --%>
				<div class="miDiv col estilo-col2">
					<div class="text-center p-4">
						<h1 class="color-text">
							<Strong>Donación Virtual</Strong>
						</h1>
						<p class="estilo-parr">Donar en
							línea es poderoso. Con tu ayuda virtual, apoyas causas en todo el
							mundo desde casa.</p>
							<div class="row">
								<div class="col">
								<img src="img/asa.png" class="img-fluid">
								</div>
								<div class="col">
								<div class="col pt-2">
									<img src="img/corazon.png" class="img-fluid" style="height: 130px; width: 130px;">
									<p>¡Transforma vidas con tu generosidad! Actúa y marca
									 la diferencia en vidas. Tu aporte  cambia realidades.
									  ¡Únete a la causa, sé el cambio!</p>
								</div>
								<div class="col">
									<a class="btn-neon btn-cerrar2" id="donar-virtual">
										<span id="span1"></span>
										<span id="span3"></span>
										<span id="span2"></span>
										<span id="span4"></span>
										Donar Virtual</a>
								</div>
								</div>
							</div>
							
					</div>
					<!-- Modal -->
					<div class="modal fade" id="donavirtual" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div
							class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="staticBackdropLabel">Donación
										Virtual</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form id="formDonante1" method="post"
											action="ServletDonante?accion=insertarvir">
											<div class="row">
												<div class="col-md-6 ms-auto">
													<img src="img/img-modal.jpg" class="img-fluid">
												</div>



												<div class="col-md-6 ms-auto">
													<%--Comienzo Formulario virtual --%>

													<h1>Donación</h1>


													<%--Condicional Virtual --%>
													<%--Campaña --%>
													<div id="campaña" class="form-group">
														<label for="exampleInputEmail2" class="form-label">Campaña</label>
														<select class="form-select form-control"
															aria-label="Default select example" id="id-campaña"
															name="camp">
															<option value="" selected hidden="disable">Seleccione
																Campaña</option>
														</select>
													</div>
													<%--Moneda --%>
													<div class="col-md-6">
														<div id="tipo-moneda" class="form-group">
															<label for="exampleInputEmail2" class="form-label">Moneda</label>
															<select class="form-select form-control"
																aria-label="Default select example" id="id-moneda"
																name="tmone">
																<option value="" selected hidden="disable">Seleccione
																	Moneda</option>
															</select>
														</div>
													</div>

													<%--Tarjeta  de Credito--%>

													<div id="info-tarj" class="form-group">
														<h2 class="my-3">INFORMACIÓN DE LA TARJETA DE CRÉDITO</h2>
														<div class="row">
															<div class="col-12">
																<label for="card_number" class="form-label">
																	Número de tarjeta *</label> <input type="text"
																	class="form-control" id="numcuen"
																	placeholder="Número de tarjeta:" name="numcuen">
															</div>
														</div>
													</div>
													<div id="tarj-adi" class="form-group">
														<div class="row">
															<div class="mb-3 col-12 col-md-6">
																<label for="cvv" class="form-label">CVC *</label> <input
																	type="password" class="form-control" id="cvv"
																	placeholder="CVV" name="cvv">
															</div>
															<div class="mb-3 col-12 col-md-6">
																<label for="expiration_month" class="form-label">Caducidad
																	*</label>
																<div class="input-group ">
																	<input type="text" class="form-control" aria-label="MM"
																		id="expirationMonth" placeholder="MM"
																		name="expirationMonth"> <span
																		class="input-group-text">/</span> <input type="text"
																		class="form-control" placeholder="YYYY"
																		aria-label="YYYY" id="expirationYear"
																		name="expirationYear">
																</div>
															</div>
														</div>
														<div id="mensajeValidacion" style="text-align: right;"></div>

													</div>
													<div>
														<div id="id-monto" class="col-md-6 form-group">
															<div class="form-group">
																<label for="exampleInputPassword1" class="form-label">Monto</label>
																<input id="monto" placeholder="Monto:" type="text"
																	class="form-control" name="monto">
															</div>
														</div>
													</div>
													<%--</form>--%>
												</div>
											</div>	
										</form>
										<%--ACA TERMINA --%>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary btn-cerrar3"
										>Cerrar</button>
									<button id="donarexterno1" class="btn btn-primary">Donar</button>
								</div>
							</div>
				
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>



	<!-- Medios de Pago -->

	<h6 class="text-center">Tu aporte hace la diferencia</h6>
	<h2 class="text-center font-weight-bold" style="margin-bottom: 40px">
		<strong>¡Quiero aportar!</strong>
	</h2>


	<section class="contenedor sombra mt-20 ">
		<ul class="nav nav-tabs justify-content-center border-0" id="myTabs"
			role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active border-0 " id="tab1-tab" data-bs-toggle="tab"
				href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">BCP</a>
			</li>
			<li class="nav-item" role="presentation"><a
				class="nav-link border-0" id="tab2-tab" data-bs-toggle="tab"
				href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">BBVA</a>
			</li>
			<li class="nav-item" role="presentation"><a
				class="nav-link border-0" id="tab3-tab" data-bs-toggle="tab"
				href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">Yape</a>
			</li>
		</ul>

		<div class="tab-content" id="myTabsContent" style="padding-top: 70px">
			<div class="tab-pane fade show active" id="tab1" role="tabpanel"
				aria-labelledby="tab1-tab">
				<!-- Contenido de la pestaña 1 -->
				<div class="container">
					<div class="row">
						<!-- Primera columna -->
						<div
							class="col-md-6 text-center align-items-center justify-content-center d-flex">
							<!-- Contenido de la primera columna -->
							<img src="img/BCP.png" class="img-fluid w-50">
						</div>

						<!-- Segunda columna -->
						<div class="col-md-6">
							<div class="row">
								<!-- Fila 1 en la segunda columna -->
								<div class="d-flex col-md-12">
									<!-- Contenido de la fila 1 -->
									<div class="align-items-center">
										<img src="img/Soles1.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div style="margin-left: 10px">
										<h5 class="">
											<strong>Soles</strong>
										</h5>
										<p>193-1572690-0-56</p>
										<p>
											<strong>CCI</strong> 002-193001572690056-14
										</p>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Fila 2 en la segunda columna -->
								<div class=" d-flex col-md-12">
									<!-- Contenido de la fila 2 -->
									<div class=" align-items-center">
										<img src="img/Soles1.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div style="margin-left: 10px">
										<h5>
											<strong>Otro Texto</strong>
										</h5>
										<p>123-4567890-0-12</p>
										<p>
											<strong>CCI</strong> 002-123004567890012-34
										</p>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Fila 3 en la segunda columna -->
								<div class="d-flex col-md-12">
									<!-- Contenido de la fila 3 -->
									<div class="align-items-center">
										<img src="img/Dolares.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div style="margin-left: 10px">
										<h5>
											<strong>Dolares</strong>
										</h5>
										<p>789-1234567-0-90</p>
										<p>
											<strong>CCI</strong> 002-789001234567090-56
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="container" style="max-width: 700px">
						<div class="row ra">
							<div class="col">
								<h5>
									<strong>Donaciones desde el extranjero</strong>
								</h5>
							</div>
						</div>
						<div class="row ra">
							<div class="col">
								<div class="d-flex align-items-center">
									<div>
										<img src="img/Ubicacion.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div class="espace">
										<h6>Esq. Av. Rivera Navarrete/Av. Juan de Arona – San
											Isidro</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="row ra">
							<div class="col">
								<div class="d-flex align-items-center">
									<div>
										<img src="img/Tarjeta.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div class="espace">
										<H6>193-1569857-1-49</H6>
									</div>
								</div>
							</div>
						</div>
						<div class="row ra">
							<div class="col">
								<div class="d-flex align-items-center">
									<div>
										<img src="img/Banco.png" style="height: 40px"
											class="img-fluid mr-2" alt="">
									</div>
									<div class="espace">
										<h6>Código SWIFT: BCPLPEPL</h6>
										<h6>CÁRITAS DEL PERÚ</h6>
										<h6>Moneda: Dólares</h6>
									</div>
									<div style="margin-left: 50px">
										<h6>Datos del banco intermediario:</h6>
										<h6>JP Morgan Chase Bank, New</h6>
										<h6>York Código Swift: CHAS US 33</h6>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>




			</div>

			<div class="tab-pane fade" id="tab2" role="tabpanel"
				aria-labelledby="tab2-tab">
				<!-- Contenido de la pestaña 2 -->
				<div class="container" style="padding-bottom: 40px">
					<div class="row">
						<!-- Primera columna -->
						<div
							class="col-md-6 d-flex align-items-center justify-content-center">
							<!-- Contenido de la primera columna -->
							<img src="img/BBVA.png" class="img-fluid w-50" alt="...">
						</div>

						<!-- Segunda columna -->
						<div class="col-md-6">
							<!-- Fila 3 en la segunda columna -->
							<div class="d-flex col-md-12 align-items-center">
								<!-- Contenido de la fila 3 -->
								<div>
									<img src="img/Soles1.png" style="height: 40px"
										class="img-fluid mr-2" alt="">
								</div>
								<div style="margin-left: 10px">
									<h5>
										<strong>Soles</strong>
									</h5>
									<p>789-1234567-0-90</p>
									<p>
										<strong>CCI</strong> 002-789001234567090-56
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div class="tab-pane fade" id="tab3" role="tabpanel"
				aria-labelledby="tab3-tab">
				<!-- Contenido de la pestaña 3 -->
				<div class="container" style="padding-bottom: 40px">
					<div class="row">
						<!-- Primera columna -->
						<div
							class="col-md-4 d-flex align-items-center justify-content-center">
							<!-- Contenido de la primera columna -->
							<img src="img/Yape.png" class="img-fluid" style="height: 150px"
								alt="...">
						</div>

						<!-- Segunda columna -->
						<div class="col-md-8">
							<div class="row">
								<!-- Fila 1 en la segunda columna -->
								<div class="col-md-12">
									<!-- Contenido de la fila 1 -->
									<p>Puedes realizar tu aporte en cualquiera de las
										siguientes cuentas.</p>
								</div>
							</div>
							<div class="row">
								<!-- Fila 2 en la segunda columna -->
								<div class="col-md-12">
									<!-- Contenido de la fila 2 -->
									<div class="d-flex">
										<div class="container">
											<div class="row">
												<div class="col-md-10 mx-auto text-center">
													<!-- Aquí creamos el cuadro morado -->
													<div class="text-white p-4"
														style="background-color: purple; border-radius: 10px">
														<img src="img/QR.jpeg" class="img-fluid"
															style="height: 200px" alt="...">
													</div>
													<button type="button" style="font-size: 18px"
														class="btn text-white btn-info mt-3">
														<Strong>913746209</Strong>
													</button>
												</div>
											</div>
										</div>

										<div class="container">
											<div class="row">
												<div class="col-md-10 mx-auto text-center">
													<!-- Aquí creamos el cuadro morado -->
													<div class="text-white p-4"
														style="background-color: purple; border-radius: 10px">
														<img src="img/QR.jpeg" class="img-fluid"
															style="height: 200px" alt="...">
													</div>
													<button type="button" style="font-size: 18px"
														class="btn text-white btn-info mt-3">
														<Strong>913746209</Strong>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- Fila 3 en la segunda columna -->
								<div class="col-md-12">
									<!-- Contenido de la fila 3 -->

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</section>

	<!-- Carrusel -->
	<div class="container text-center mt-5">
		<h1>
			<strong>Kits de Donación</strong>
		</h1>
		<p>Tenemos preparados kits de ayuda humanitaria para atender a las
			familias vulnerables.</p>
		<hr class="bg-danger"
			style="height: 4px; width: 150px; margin: 0 auto;">


		<div class="row">
			<div class="owl-carousel owl-theme">
				<div class="item">
					<div class="card card border-0">
						<div class="card-body ">
							<img src="img/Higiene.png" alt="" class="card-img-top">
							<hr />
							<h5 class="text-center">Kit de Higiene</h5>
							<p>Llevarás artículos de higiene personal a una familia de 5
								miembros.</p>
							<button type="button"
								class="btn btn-outline-primary scroll-to-formulario">Donando
								S/.100</button>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="card card border-0">
						<div class="card-body">
							<br> <br> <img src="img/Com.png" alt=""
								class="card-img-top">
							<hr />
							<h5 class="text-center">Kit de Comida</h5>
							<p>Llevarás alimento no perecible a una familia 4 miembros
								por 7 días.</p>
							<button type="button"
								class="btn btn-outline-primary scroll-to-formulario ">Donando
								S/.100</button>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="card card border-0">
						<div class="card-body">
							<img src="img/ropa.png" alt="" class="card-img-top">
							<hr />
							<h5 class="text-center">Kit de Ropa</h5>
							<p>Llevarás abrigo ante las heladas y friaje a una familia de
								5 miembros.</p>
							<button type="button"
								class="btn btn-outline-primary scroll-to-formulario ">Donando
								S/.100</button>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="card card border-0">
						<div class="card-body">
							<img src="img/Juguetes.png" alt="" class="card-img-top">
							<hr />
							<h5 class="text-center">Kit de Juguetes</h5>
							<p>Llevarás utensilios de cocina para una familia de miembros</p>
							<button type="button"
								class="btn btn-outline-primary scroll-to-formulario">Donando
								S/.100</button>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="card card border-0">
						<div class="card-body">
							<img src="img/Medicina.png" alt="" class="card-img-top">
							<hr />
							<h5 class="text-center">Kit de Medicina</h5>
							<p>Llevarás medicamentos para tratar los problemas de salud.</p>
							<button type="button"
								class="btn btn-outline-primary scroll-to-formulario ">Donando
								S/.100</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Apartado siguiente -->
	<div class="container-fluid bg-dark text-light p-5">
		<div class="row">
			<div class="col-md-6">
				<!-- Columna de la imagen -->
				<img src="img/vl.jpg" class="img-fluid ml-4" alt="...">
			</div>
			<div class="col-md-6">
				<!-- Columna de texto -->
				<div class="pt-5">
					<h1>Tu colaboración</h1>
					<h1>es importante</h1>
					<p class="lead my-4">Ayúdanos a transformar la vida de las
						personas en situación de pobreza y vulnerabilidad, desarrollando
						juntos programas, proyectos e intervenciones que mejoren su
						calidad de vida.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- map -->
	<section class="p-5">
		<div class="container">
			<div class="row g-4">
				<div class="col-md">
					<h2 class="text-center mb-4">
						<strong>Entrega Física</strong>
					</h2>
					<ul class="list-group list-group-flush lead">
						<li class="list-group-item"><span class="fw-bold">Localización:</span>
							Ancon,Lima-Perú</li>
						<li class="list-group-item"><span class="fw-bold">Horario
								de Atención:</span> 8:00 am - 23:00 pm</li>
						<li class="list-group-item"><span class="fw-bold">Telefóno:</span>
							913746209</li>
						<li class="list-group-item"><span class="fw-bold">Correo
								Electronico:</span> u21216975@utp.edu.pe</li>
						<li class="list-group-item"><span class="fw-bold">Recuerda...</span>
							Al conectar con la causa de donación muestras tu contribución
							marcando una diferencia real, motivando a ser parte del cambio</li>

					</ul>
				</div>
				<div class="col-md">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d250044.83577748813!2d-77.42498272823141!3d-11.697914333027477!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105d5451df56977%3A0xc8b24208cd77794!2zQW5jw7Nu!5e0!3m2!1ses-419!2spe!4v1694738306792!5m2!1ses-419!2spe"
						width="700" height="350" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</section>

	<div class="container-fluid bg-dark text-light p-5">
		<div class="row">
			<div
				class="col-md-12 d-flex justify-content-center align-items-center">
				<div>
					<h1 class="mb-3">Con tu donación seguiremos</h1>
					<h1 class="mb-3">transformando vidas.</h1>
				</div>
				<button type="button" style="margin-left: 25px;"
					class="btn btn-success scroll-to-formulario">Realiza tu
					Donación</button>
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
	
	<%--LIBRERIAS --%>
		<!-- Libreria principal de jQuery -->
		<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	
		<!-- Libreria JS de bosstrap -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
		<!-- Libreria para validar (Bootstrap Validator) -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
	
		<!-- Otras bibliotecas que puedas necesitar -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
			integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
	<%--FIN DE LAS LIBRERIAS--%>
	
	
	<%--ESTILO PARA EL NAV --%>
	<script>
		var navBar = document.querySelector('.js-nav-bar');
		if (typeof navBar === 'object')
			document.documentElement.style.setProperty('--nav-height',
					navBar.offsetHeight + 'px');
	</script>
	
	<%--Carrusel responsivo --%>
	<script>
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:3
	        },
	        1000:{
	            items:5
	        }
	    }
	})
	</script>

	<%--ALERTAS CON TOAST --%>
	<c:if test="${sessionScope.MENSAJE!=null}">
		<script>
		    var mensaje = "${sessionScope.MENSAJE}";
		    if (mensaje !== null && mensaje !== "") {
		    	if (mensaje.includes("Exitosa")) {
		            Swal.fire({
		                title: "Donación Exitosa!",
		                text: "Tu donación se ha registrado exitosamente. Agradecemos tu generosidad!",
		                icon: "success",
		                confirmButtonText: "Cerrar"
		            });
		        } else if (mensaje.includes("Fallida")) {
		            Swal.fire({
		                title: "Donación Fallida",
		                text: "Tu donación ha fallado debido a saldo insuficiente. Por favor, verifica tu saldo e inténtalo de nuevo.",
		                icon: "error",
		                confirmButtonText: "Cerrar"
		            });
		        }else if (mensaje.includes("donante")) {
		            Swal.fire({
		                title: "Registro Existoso",
		                text: "Has sido registrado exitosamente.",
		                icon: "success",
		                confirmButtonText: "Cerrar"
		            });
		        }else if (mensaje.includes("error")) {
		            Swal.fire({
		                title: "Registro Fallido",
		                text: "Hubo un error en el proceso del registro",
		                icon: "error",
		                confirmButtonText: "Cerrar"
		            });
		        }
		    }
		</script>
	</c:if>
	<%--REMOVER LAS ALERTAS --%>
	<c:remove var="MENSAJE" scope="session" />
	
	<%--SCRIPT PARA CARGAR LOS JSON AL COMBOBOX --%>
	<script>
		CargarLocaciones();
		CargarCampaña();
		CargatTipoMoneda();
		
		function CargarLocaciones(){
			$.get("ServletLocacionJSON",function(response){
				$.each(response,function(index,item){
					$("#id-location").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
				})
			})	
		}
		function CargarCampaña(){
			$.get("ServletCampañaJSON",function(response){
				$.each(response,function(index,item){
					$("#id-campaña").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
				})
			})
		}
		function CargatTipoMoneda(){
			$.get("ServletMonedaJSON",function(response){
				$.each(response,function(index,item){
					$("#id-moneda").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
				})
			})
		}
	</script><%--FIN DE LA CARGA DE DATOS --%>

	<%--VERIFICAR SI LOS DATOS DE LA TARJETA COINCIDEN--%>
	<script>
		$(document).ready(function () {
	   	 var enableCustomValidations = true; 
	 
	    $("#monto").prop("disabled", true);
	    
	    $("#numcuen, #cvv, #expirationMonth, #expirationYear").on("keyup", function () {
	        if (enableCustomValidations) {
	            validarTarjeta();
	        }
	    });
	  
	    function validarTarjeta() {
	        // valores de los campos de la tarjeta
	        var numcuen = $("#numcuen").val();
	        var cvv = $("#cvv").val();
	        var expirationMonth = $("#expirationMonth").val();
	        var expirationYear = $("#expirationYear").val();
	        var mensajeElemento = $("#mensajeValidacion"); // Obtén el elemento para mostrar el mensaje
	        var tmone = $("#id-moneda").val();
	        
	        if (!numcuen || !cvv || !expirationMonth || !expirationYear) {
	            mensajeElemento.text(""); 
	            return;
	        }
		  <%--AJAX PARA VALIDAR LA TARJETA--%>
	        $.ajax({
	            type: "POST",
	            url: "ServletTarjetaVerificacion", 
	            data: {
	                numcuen: numcuen,
	                cvv: cvv,
	                expirationMonth: expirationMonth,
	                expirationYear: expirationYear
	            },
	            success: function (response) {
	                if (response === "valido") {
	                    mensajeElemento.text("Tarjeta válida"); // Actualiza el contenido con el mensaje de tarjeta válida
	                    $("#numcuen, #cvv, #expirationMonth, #expirationYear").removeClass("error");
	                    $("#numcuen, #cvv, #expirationMonth, #expirationYear").addClass("success");
	                    mensajeElemento.css("color", "green");
	                    $("#monto").prop("disabled", false);
	                    $("#formDonante").off('submit');
	                } else {
	                    mensajeElemento.text("Tarjeta no válida"); // Actualiza el contenido con el mensaje de tarjeta no válida
	                    $("#numcuen, #cvv, #expirationMonth, #expirationYear").removeClass("success");
	                    $("#numcuen, #cvv, #expirationMonth, #expirationYear").addClass("error");
	                    mensajeElemento.css("color", "red");
	                    $("#monto").prop("disabled", true);
	                    $("#formDonante").on('submit', function (e) {
	                        e.preventDefault();
	                        $("#numcuen").focus();
	                    });
	                }
	            }
	        });
	    }
	});
	</script><%--FIN DEL AJAX --%>

	<%--PLUGIN BOOTSTRAP VALIDATOR --%>
	<script>    
	    $(document).ready(function(){     
	        $('#formDonante').bootstrapValidator({      
	        	 fields:{
	        		 locacion:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				}
		        			} 
	        		 },descrip:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				}
	        			} 
	        		}
	        	 }	        	 
	        });   
				
	    });
	    </script>
	    
	    <script>
    $(document).ready(function() {
        $('#formRegistro').bootstrapValidator({
            fields: {
                dni: {
                    validators: {
                        notEmpty: {
                            message: 'Este campo es obligatorio'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
                            message: 'Este campo debe contener solo números'
                        },
                        stringLength: {
                            min: 6,
                            max: 9,
                            message: 'Rango de 6-9'
                        }
                    }
                },
                nombre: {
                    validators: {
                        notEmpty: {
                            message: 'Campo nombre es obligatorio'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
                            message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
                        }
                    }
                },
                paterno: {
                    validators: {
                        notEmpty: {
                            message: 'Campo paterno es obligatorio'
                        }
                    }
                },
                materno: {
                    validators: {
                        notEmpty: {
                            message: 'Campo materno es obligatorio'
                        }
                    }
                },
                celular: {
                    validators: {
                        notEmpty: {
                            message: 'El campo celular es obligatorio'
                        },
                        stringLength: {
                            min: 9,
                            max: 9,
                            message: 'El número de celular debe tener exactamente 9 dígitos'
                        },
                        regexp: {
                            regexp: /^9[0-9]{8}$/, // Comienza con 9 seguido de 8 dígitos
                            message: 'El número de celular debe comenzar con el primer dígito "9" y contener 9 dígitos en total'
                        },
                        callback: {
                            message: 'El número de celular no puede ser negativo',
                            callback: function(value, validator, $field) {
                                // Convierte el valor a un número entero
                                var celular = parseInt(value, 10);
                                // Comprueba si el valor es negativo
                                if (celular < 0) {
                                    return false;
                                }
                                return true;
                            }
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Campo email es obligatorio'
                        },
                        emailAddress: {
                            message: 'El campo email debe contener una dirección de correo electrónico válida'
                        }
                    }
                },
                direccion: {
                    validators: {
                        notEmpty: {
                            message: 'Campo direccion es obligatorio'
                        }
                    }
                },
                departamento: {
                    validators: {
                        notEmpty: {
                            message: 'Campo ciudad es obligatorio'
                        }
                    }
                },
                distrito: {
                    validators: {
                        notEmpty: {
                            message: 'Campo ciudad es obligatorio'
                        }
                    }
                },
                provincia: {
                    validators: {
                        notEmpty: {
                            message: 'Campo ciudad es obligatorio'
                        }
                    }
                }
            }
        });
    });
</script>


	<script>
	jQuery(document).ready(function ($) {
	    $('#id-ingresoCorreo').on('input', function () {
	        // Limpia los mensajes de error
	        clearErrorMessages();

	        // Ejecuta la validación y la verificación de existencia del correo
	        validateAndCheckEmail();
	    });

	    $('#formInputCorreo').validate({
	        rules: {
	            name: "required",
	            ingresoCorreo: {
	                required: true,
	                email: true
	            }
	        },
	        messages: {
	            name: "Por favor, escriba su nombre",
	            ingresoCorreo: {
	                required: "Por favor, ingresa el correo electrónico",
	                email: "Por favor, introduce un correo electrónico válido"
	            }
	        },
	        errorPlacement: function (error, element) {
	            error.insertAfter(element.closest('div'));
	        },
	        errorClass: "error", // La clase CSS que se añadirá a los elementos con errores
	        submitHandler: function (form, event) {
	            event.preventDefault(); // Evita la recarga de la página por defecto

	            var emailObtenido = $("#id-ingresoCorreo").val().trim();
	
	            // Verifica si el correo existe
	            checkEmailExistence(emailObtenido, function (emailExistente) {
	                if (emailExistente) {
	                    // Si el correo existe, envía el formulario
	                   enviarCorreo();
	                   enviarCodigoCorreo();
	                } else {
	                    // Si el correo no existe, aplica estilos de error manualmente
	                    $("#id-ingresoCorreo").addClass("error");
	                    $("#msg-error").text("El correo ingresado no existe");
	                    $("#msg-error").addClass("error");
	                }
	            });
	        }

	    });

	    // Función para ejecutar la validación y la verificación de existencia del correo
	    function validateAndCheckEmail() {
	        // Obtiene el valor del campo de entrada de correo electrónico
	        var emailValue = $("#id-ingresoCorreo").val().trim();

	        // Ejecuta la validación del formulario solo si el campo tiene datos
	        if (emailValue) {
	            // Validación del formulario
	            $('#formInputCorreo').validate().element("#id-ingresoCorreo");

	            // Verifica la existencia del correo solo si el campo tiene datos y la validación es exitosa
	            if ($('#formInputCorreo').valid()) {
	                checkEmailExistence(emailValue, function (emailExistente) {
	                    if (!emailExistente) {
	                        // Si el correo no existe, muestra el mensaje de error
	                        $("#id-ingresoCorreo").addClass("error");
	                        $("#msg-error").text("El correo ingresado no existe");
	                        $("#msg-error").addClass("error");
	                    }
	                });
	            }
	        }
	    }

	    // Función para limpiar los mensajes de error
	    function clearErrorMessages() {
	        $("#id-ingresoCorreo").removeClass("error");
	        $("#msg-error").text("");
	        $("#msg-error").removeClass("error");
	    }

	    function checkEmailExistence(email, callback) {
	        // Tu función actual para verificar la existencia del correo
	        $.get("ServletDonanteJSON", function (response) {
	            var emailExistente = false;

	            $.each(response, function (index, item) {
	                var jsonEmail = item.email;
	                if (email === jsonEmail) {
	                    emailExistente = true;
	                }
	            });

	            callback(emailExistente);
	        });
	    }
	});

	</script>






	<script>    
	    $(document).ready(function(){     
	        $('#formDonante1').bootstrapValidator({      
	        	 fields:{
	        		 numcuen:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				},regexp: {
	        				      regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
	        				      message: 'Este campo debe contener solo números'
	        				},
	        				stringLength: {
	        		            min: 9,
	        		            max: 10,
	        		            message: 'Rango de 9-10'
	        		        }
	        			}
	        		},cvv:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				},regexp: {
	        				      regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
	        				      message: 'Este campo debe contener solo números'
	        				},
	        				stringLength: {
	        		            min: 3,
	        		            max: 4,
	        		            message: 'Rango de 3-4'
	        		        }
	        			}
	        		},expirationMonth:{
	        			validators:{
	        				notEmpty:{
	        					message:'Obligatorio*'
	        				},regexp: {
	        				      regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
	        				      message: 'Este campo debe contener solo números'
	        				},
	        				stringLength: {
	        		            min: 2,
	        		            max: 2,
	        		            message: 'Error'
	        		        }
	        			}
	        		},expirationYear:{
	        			validators:{
	        				notEmpty:{
	        					message:'Obligatorio*'
	        				},regexp: {
	        				      regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
	        				      message: 'Este campo debe contener solo números'
	        				},
	        				stringLength: {
	        		            min: 4,
	        		            max: 4,
	        		            message: 'Error'
	        		        }
	        			}
	        		},tdon:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				}
	        			}
	        		},tmone:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				}
	        			}
	        		},camp:{
	        			validators:{
	        				notEmpty:{
	        					message:'Este campo es obligatorio'
	        				}
	        			}
	        		},monto:{
	        			validators: {
	        		        notEmpty: {
	        		            message: 'El campo monto es obligatorio'
	        		        },
	        		        greaterThan: {
	        		            value: 0,
	        		            inclusive: false,
	        		            message: 'El monto debe ser un número positivo'
	        		        },regexp: {
	        				      regexp: /^[0-9]+$/, // Expresión regular para aceptar solo números
	        				      message: 'Este campo debe contener solo números'
	        				},
	        				between:{
        		 				min:1,
        		 				max:9000,
        		 				message:'Campo MONTO acepta solo números rango 1 - 9000'
        		 			}
        		 			
	        		    }
	        		}
	        	 }	        	 
	        });   
				
	    });
	    
	</script><%--FIN DE LA VALIDACIÓN CON EL PLUGIN --%>


	<%--ACCIONES DEL BOTON QUE ESTA AFUERA DEL "FORM" --%>
	<script>
		document.getElementById('botonexterno').addEventListener('click', function () {
		    var formDonante = $('#formDonante').bootstrapValidator();
		    formDonante.data('bootstrapValidator').validate(); // Activa la validación
		
		    if (formDonante.data('bootstrapValidator').isValid()) {
		        document.getElementById('formDonante').submit(); // Envía el formulario si es válido
		    }
		});
		document.getElementById('donarexterno1').addEventListener('click', function () {
		    var formDonante = $('#formDonante1').bootstrapValidator();
		    formDonante.data('bootstrapValidator').validate(); // Activa la validación
		
		    if (formDonante.data('bootstrapValidator').isValid()) {
		        document.getElementById('formDonante1').submit(); // Envía el formulario si es válido
		    }
		});
	</script>
	
	<%--DESPLAZAMIENTO AUTOMATICO--%>
	<script>
	    // Obtén una lista de todos los botones con la clase "scroll-to-formulario"
	    var scrollButtons = document.querySelectorAll('.scroll-to-formulario');
	    var formularioSection = document.getElementById('donaAqui');
	
	    // Agrega un evento de clic a cada botón
	    scrollButtons.forEach(function(button) {
	        button.addEventListener('click', function() {
	            // Desplázate suavemente hacia la sección del formulario
	            formularioSection.scrollIntoView({
	                behavior: 'smooth'
	            });
	        });
	    });
	</script>
	
	<%--SCRIPT PARA LLENAR LOS COMBOBOX DE DEPARTAMENTO,DISTRITO Y PROVINCIA 
		DEL ARCHIVO MAP.PE.JSON--%>
	<script>
	    function cargarDatosYManejarCambios(ciudadSelect, provinciaSelect, distritoSelect) {
	    	// Realizar una solicitud AJAX para cargar el archivo JSON
	    	const xhr = new XMLHttpRequest();
	    	xhr.open('GET', 'assets/map.pe.json', true);
	
	    	xhr.onload = function() {
	    		if (xhr.status === 200) {
	    			const data = JSON.parse(xhr.responseText);
	
	    			// Llenar el select de ciudades
	    			for ( const ciudad in data) {
	    				ciudadSelect.options.add(new Option(ciudad, ciudad));
	    			}
	
	    			// Manejar el cambio en el select de ciudades
	    			ciudadSelect
	    					.addEventListener(
	    							'change',
	    							function() {
	    								// Obtener la provincia seleccionada
	    								const selectedCiudad = ciudadSelect.value;
	    								const provincias = data[selectedCiudad];
	
	    								// Limpiar y llenar el select de provincias
	    								provinciaSelect.innerHTML = '<option value="">[Seleccione una provincia]</option>';
	    								for ( const provincia in provincias) {
	    									provinciaSelect.options.add(new Option(
	    											provincia, provincia));
	    								}
	    							});
	    			// Manejar el cambio en el select de provincias
	    			provinciaSelect
	    					.addEventListener(
	    							'change',
	    							function() {
	    								// Obtener la provincia y ciudad seleccionadas
	    								const selectedCiudad = ciudadSelect.value;
	    								const selectedProvincia = provinciaSelect.value;
	    								const distritos = data[selectedCiudad][selectedProvincia];
	
	    								// Limpiar y llenar el select de distritos
	    								distritoSelect.innerHTML = '<option value="">[Seleccione un distrito]</option>';
	    								for ( const distrito in distritos) {
	    									// Debes acceder al valor del distrito en lugar de todo el objeto distritos
	    									distritoSelect.options.add(new Option(
	    											distrito, distritos[distrito]));
	    								}
	    							});
	    		}
	    	};
	
	    	xhr.send();
	    }
		<%--CARGAMOS LOS DATOS OBTENIDOS--%>
	    // Llama a la función para el primer formulario
	    const ciudadSelect1 = document.getElementById('id-departamento');
	    const provinciaSelect1 = document.getElementById('id-provincia');
	    const distritoSelect1 = document.getElementById('id-distrito');
	    cargarDatosYManejarCambios(ciudadSelect1, provinciaSelect1, distritoSelect1);
	
	</script><%--FIN DE LA SCRIPT DEL CARGADO DE DATOS --%>
	
	<%--MUESTRA DATOS SEGÚN LAS OPCIONES--%>
	<script>
		$(document).ready(function() {
		  // Oculta el formulario al principio
		  $('#formRegistro').hide();
		  $('#email-correo').hide();
		
		  // Función para mostrar el formulario y ocultar el campo de correo
		    function mostrarFormulario() {
		        $('#formRegistro').show();
		        $('#email-correo').hide();
		    }

		    // Función para mostrar el campo de correo y ocultar el formulario
		    function mostrarCorreo() {
		        $('#email-correo').show();
		        $('#formRegistro').hide();
		    }

		    // Muestra u oculta el formulario al hacer clic en "SI" o "NO"
		    $('#id-no').click(mostrarFormulario);

		    $('#id-si').click(mostrarCorreo);

		});
		
	</script>
	<script>
	$(document).ready(function() {
	    let botonOrigen = "";
	    // Código para manejar el clic en "Donar en Físico"
	    $("#donar-fisico").click(function() {
	        botonOrigen = "fisico";
	        $("#staticBackdrop").modal("show");
	    });

	    // Código para manejar el clic en "Donar en Virtual"
	    $("#donar-virtual").click(function() {
	        botonOrigen = "virtual";
	        $("#staticBackdrop").modal("show");
	    });

	    // Función para manejar el clic en el botón de confirmación
	    function handleConfirmationButtonClick() {
	        var codigo = $("#confirmationInput").val().trim();

	        // Validar la longitud del código
	        if (codigo.length !== 8) {
	            $("#ms-error").text("El código debe tener exactamente 8 caracteres");
	            $("#ms-error").addClass("error");
	            $("#confirmationInput").addClass("error");
	            return;
	        }

	        $.ajax({
	            type: "POST",
	            url: "ServletDonacionEmail",
	            data: {
	                tipo: "tipo2",
	                codigo: codigo
	            },
	            success: function(response) {
	                if (response === "valido") {
	                    // Abrir el modal según el botón original presionado
	                    if (botonOrigen === "fisico") {
	                        $("#donafisico").modal("show");
	                        $('#staticBackdrop').modal("hide");
	                    } else if (botonOrigen === "virtual") {
	                        $("#donavirtual").modal("show");
	                        $('#staticBackdrop').modal("hide");
	                    }
	                    $("#confirmationInput").removeClass("error");
	        	        $("#ms-error").text("");
	        	        $("#ms-error").removeClass("error");
	                } else {
	                	$("#ms-error").text("Código incorrecto");
	                	$("#ms-error").addClass("error");
	        	        $("#confirmationInput").addClass("error");
	                }
	            },
	            error: function() {
	                console.error("Error en la solicitud AJAX");
	            }
	        });
	    }

	    // Agregar evento de escucha para el evento input en el campo de confirmación
	    $("#confirmationInput").on("input", function() {
	        $("#ms-error").text("");
	        $("#ms-error").removeClass("error");
	        $("#confirmationInput").removeClass("error");
	    });

	    // Asociar el evento de clic al botón de confirmación
	    $("#confirmationButton").click(handleConfirmationButtonClick);
	});
</script>


	
	<%--ACCION DE OCULTAR CAMPOS Y MOSTRAR EL CONTADOR AL ENVIAR AL EMAIL --%>
	<script>
    function enviarCodigoCorreo() {
        var countdownElement = document.getElementById("countdown");
        var confirmationLabel = document.getElementById("confirmationLabel");
        var confirmationInput = document.getElementById("confirmationInput");
        var confirmationButton = document.getElementById("confirmationButton");
        var botonenviar = document.getElementById("startCountdown");
        var emailEnvio = document.getElementById("id-emailEnvio");
        var ingresoCorreo = document.getElementById("id-ingresoCorreo");
        var span = document.getElementById("basic-addon1");
		var span1= document.getElementById("inputGroup-sizing-default");
		ingresoCorreo.readOnly = true;
        // Muestra el contador y comienza el temporizador
        countdownElement.style.display = "block";
        var seconds = 5;
        var countdownInterval = setInterval(function () {
            countdownElement.innerText = seconds;
            seconds--;

            if (seconds < 0) {
                clearInterval(countdownInterval);
                countdownElement.style.display = "none";
                ingresoCorreo.style.display = "none";
                emailEnvio.style.display = "none";
                botonenviar.style.display = "none";
                span.style.display = "none";
                confirmationLabel.style.display = "block";
                
                // Muestra el div oculto con el id "confirmationInput"
                confirmationInput.style.display = "block";
                span1.style.display = "block";
                confirmationButton.style.display = "block";
            }
        }, 1000);
    }
</script>


	
	<%--AJAX PARA EL ENVIO DE CORREOS ELECTRONICOS--%>
	<script>
		<%--ENVIA EL CODIGO AL EMAIL--%>
		function enviarCorreo() {
		    var correo = document.getElementById("id-ingresoCorreo").value;
		    $.ajax({
		        type: "POST",
		        url: "ServletDonacionEmail",
		        data: {
		            tipo: "tipo1",
		            correo: correo
		        },
		        success: function(response) {
		        },
		        error: function() {
		            // Puedes manejar el error aquí si es necesario
		        }
		    });
		}
	</script>
	<script>
	$(document).on("click","#id-cerrar",function(){

		$("#formRegistro").trigger("reset");
		$("#formInputCorreo").trigger("reset");
		$("#formRegistro").data("bootstrapValidator").resetForm(true);
		 $("#id-ingresoCorreo").removeClass("error");
	        $("#msg-error").text("");
	        $("#msg-error").removeClass("error");
	     // Resetear la validación de jQuery Validation
	        var validator = $("#formInputCorreo").validate();
	        $('#formRegistro').hide();
			 $('#email-correo').hide();
	        validator.resetForm();
	        $("#confirmationInput").removeClass("error");
	        $("#ms-error").text("");
	        $("#ms-error").removeClass("error");
	        $("#confirmationInput").val("");
	        $("#confirmationLabel").hide();
	        $("#inputGroup-sizing-default").hide();
	        $("#confirmationInput").hide();
	        $("#ms-error").hide();
	        $("#confirmationButton").hide();
	})
	
	</script>
	<%--FIN DE LA SCRIPT DEL AJAX --%>

	<%--No se para que sirve, acciones de pestañas?
	<script>
	   const tabs = document.querySelectorAll('.nav-link[data-bs-toggle="tab"]');
	
	   tabs.forEach(tab => {
	      tab.addEventListener('click', () => {
	         tabs.forEach(t => t.classList.remove('active'));
	         tab.classList.add('active');
	      });
	   });
	</script> --%>
	

</body>

</html>