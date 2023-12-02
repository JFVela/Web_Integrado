<jsp:include page="intranet.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DashBoard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css"
	rel="stylesheet">
<style>
body {
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.background-image {
	width: 100%;
	height: 100vh;
	object-fit: cover;
	object-position: center center;
	position: fixed;
	z-index: -1;
}

.welcome-container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	background-color: rgba(0, 0, 0, 0.7);
	border-radius: 15px;
	color: white;
	text-align: center;
	font-size: 20px;
	font-family: 'Arial', sans-serif;
}

.user-details {
	text-align: left; /* Alineación a la izquierda */
}

.inspirational-message {
	font-size: 15px; /* Tamaño de fuente de 15px */
	font-style: italic; /* Estilo cursiva */
	text-align: justify; /* Alineación justificada */
}
</style>
</head>
<body>
	<!-- Background Image -->
	<img src="img/FondoDashboard.jpg" alt="Fondo" class="background-image">

	<!-- Welcome Container -->
	<div class="welcome-container">
		<p>¡BIENVENIDO!</p>
		<div class="user-details">
			<p>
				ID: <span id="userCode">${sessionScope.codigoEmpreado}</span>
			</p>
			<p>
				USER: <span id="userName">${sessionScope.datosEmpleado}</span>
			</p>
			<p>
				ROL: <span id="roleName">${sessionScope.nombreRol}</span>
			</p>
		</div>
		<div class="inspirational-message">
			<p>Recuerda, cada día es una nueva oportunidad para hacer la
				diferencia. ¡Juntos podemos lograr grandes cosas!</p>
			<p>¡Gracias por ser parte de esta familia! Que tu día esté lleno
				de logros y satisfacciones.</p>

		</div>
	</div>
</body>
<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- libreria JS de bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- libreria JS de la tabla -->
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- libreria para validar (bootstrap validator) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.INICIO!=null}">
	<script>
		toastr.success("${sessionScope.INICIO}", toastr.options = {
			"timeOut" : "2000",
			"positionClass " : " toast-top-right ",
		});
	</script>
</c:if>

<!-- eliminar atributo de tipo sesiÃ³n MENSAJE -->
<c:remove var="INICIO" scope="session" />
</html>