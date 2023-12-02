<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
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
<!-- Script para redireccionar a la p�gina de inicio de sesi�n si no hay datos de empleado en la sesi�n -->
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		var datosEmpleado = "${sessionScope.datosEmpleado}";
		if (!datosEmpleado) {
			window.location.href = "Login.jsp?showMessage";
		}
	});
</script>

</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="DashBoard.jsp">INTRANET</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Lista de enlaces generada din�micamente con un forEach -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:forEach items="${sessionScope.listaEnlaces}" var="row">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${row.ruta}">${row.descripcion}</a></li>
				</c:forEach>
			</ul>
			<!-- Secci�n para mostrar informaci�n del usuario y bot�n para cerrar sesi�n -->
			<div class="flex"
				style="width: 200px !important; padding-top: 10px; font-weight: bolder;">
				<p style="color: black;">Bienvenido
					${sessionScope.datosEmpleado}! IdRol:${sessionScope.rolDelEmpleado}</p>
			</div>
			<form id="FormularioInicioSesion" method="post"
				action="ServletEmpleados?accion=CERRAR">
				<button class="btn btn-outline-success" type="submit">CERRAR</button>
			</form>
		</div>
	</div>
	</nav>


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
</html>

