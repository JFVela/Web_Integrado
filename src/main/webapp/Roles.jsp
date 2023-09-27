<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Roles</title>
<!-- BOOSTRAP -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
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
</style>

</head>
<body style="background: #fffbc1;">
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="MenuAdmin.jsp">MENÚ</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="MenuAdmin.jsp">DASHBOARD</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ServletEmpleados?accion=listado">Empleados</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ServletVoluntario?accion=listar">Voluntarios</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ServletDonante?accion=listado">Donantes</a></li>
				</ul>
				<a class="btn btn-outline-success" href="menu.jsp">CERRAR</a>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1 class="mt-5 text-center">Roles de la empresa</h1>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">Agregar rol</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Formulario</h1>
					</div>
					<div class="modal-body">
						<!-- GRABAR -->

						<form id="FormularioRol" method="post"
							action="ServletRol?accion=grabar">

							<div class="form-group">
								<label for="" class="form-label">Nombre del Rol</label>
								<input type="text" class="form-control" name="nombre">
							</div>
							<div class="form-group">
								<label for="" class="form-label">Descripción</label> <input
									type="text" class="form-control" name="descripcion">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" action="">Guardar</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">Cerrar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>



		<div class="mt-3">
			<!-- CREAR TABLA -->
			<table id="TablaRol" class="table table-striped" style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre del Rol</th>
						<th>Descripción</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.rol}" var="row">
						<tr>
							<td>${row.id}</td>
							<td>${row.nombre}</td>
							<td>${row.descripcion}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>

<!-- Libreria principal -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- Libreria JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Libreria js de la tabla -->
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<!-- Libreria para validar -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script>
	new DataTable('#TablaRol');
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#FormularioRol')
								.bootstrapValidator(
										{
											fields : {
												nombre : { 
													validators : {
														notEmpty : {
															message : 'Campo de nombre es obligatorio'
														},
														regexp : {
															regexp : /^[A-Za-z0-9ÁÉÍÓÚáéíóúÑñ\s,.;:¡!¿?"'()]+$/,
															message : 'El nombre solo puede contener letras, números, espacios y signos de puntuación'
														}
													}
												},
												descripcion : {
													validators : {
														notEmpty : {
															message : 'Campo de descripcion es obligatorio'
														},
														regexp : {
															regexp : /^[A-Za-z0-9ÁÉÍÓÚáéíóúÑñ\s,.;:¡!¿?"'()]+$/,
															message : 'La descripcion solo puede contener letras, números, espacios y signos de puntuación'
														}
													}
												}
											}
										});
					});
</script>


</html>