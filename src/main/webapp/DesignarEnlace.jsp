<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designar Enlaces</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
body {
	font-family: verdana;
	font-size: 12px;
}

.modal-header, h4, .close {
	background-color: #286090;
	color: white !important;
	text-align: center;
	font-size: 20px;
}

.form-control, .form-select {
	height: 30px !important;
	font-size: 12px;
	/*padding-left: 40px!important;*/
}

fieldset, legend {
	all: revert;
}

.reset {
	all: revert;
}

.btn-danger {
	margin: 0px !important;
	height: 30px !important;
	padding-top: 3px !important;
}

.btn-info {
	margin: 0px !important;
	height: 30px !important;
	padding-top: 3px !important;
}

.colorBloqueado {
	background: #F7EEC5;
}

.form-control:focus {
	background: #F7EEC5;
}
</style>
<script src="https://kit.fontawesome.com/1da5200486.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>
<body>
	<div class="container">
		<h1 class="mt-5 text-center">Designación de Enlaces</h1>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#modalRequerimiento">Nueva Asignación</button>

		<!-- Modal -->
		<div class="modal fade" id="modalRequerimiento" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Asignar
							Enlaces a un Rol</h1>
					</div>
					<div class="modal-body">
						<form action="ServletRequerimiento?accion=GRABAR" method="POST">
							<div class="row mt-3">
								<div class="col-lg-6">
									<fieldset class="reset">
										<legend class="reset">Consulta Rol</legend>
										<div class="row mt-3">
											<label for="inputEmail3" class="col-sm-2">Rol</label>
											<div class="form-group col-sm-6">
												<select class="form-select" id="idRol">
													<option value=" ">[Seleccione Rol]</option>
												</select>
											</div>
										</div>
										<br>
										<table id="tableEnlaces" class="table table-striped mt-4"
											style="width: 100%">
											<thead>
												<tr>
													<th>ID</th>
													<th>Descripcion</th>
													<th>Ruta</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<!-- LISTA DE ENLACES -->
											</tbody>
										</table>
									</fieldset>
								</div>
								<div class="col-lg-6">
									<fieldset class="reset">
										<legend class="reset">Enlace/Rol</legend>
										<table id="tableAsignacionesRolesyEnlaces"
											class="table table-striped mt-4" style="width: 100%">
											<thead>
												<tr>
													<th>ID</th>
													<th>Rol</th>
													<th>ID</th>
													<th>Enlace</th>
													<th></th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</fieldset>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-save"></i>
								</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">
									<i class="fa-regular fa-folder-closed"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>



		<div class="mt-3">
			<table id="TablaAsignarEnlace" class="table table-striped" style="width: 100%">
				<thead>
					<tr>
						<th>ID-Rol</th>
						<th>Nombre del Rol</th>
						<th>ID-Enlace</th>
						<th>Nombre del Enlace</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<!--Se genera la tabla-->
				</tbody>
			</table>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
<script>
    // Cargar datos al cargar la página
    cargarRol();
    cargarEnlaces();
    cargarAsignarEnlace();

    // Cargar opciones de roles en el select
    function cargarRol() {
        $.get("ServletRolJSON", function(response) {
            $.each(response, function(index, item) {
                // Agrega el atributo nombreRol a la opción
                const option = $("<option>")
                    .attr("value", item.id)
                    .attr("nombreRol", item.nombre)
                    .text(item.nombre);

                // Agrega la opción al elemento select
                $("#idRol").append(option);
            });
        });
    }

    // Cargar datos de enlaces
    function cargarEnlaces() {
        $.get("ServletEnlaceJSON", function(response) {
            let botonAgregar = "<button type='button' class='btn btn-warning btn-adicionar'><i class='fa-solid fa-plus'></i></button>";
            $.each(response, function(index, item) {
                $("#tableEnlaces").append("<tr><td>" + item.id_enlace + "</td>" +
                    "<td>" + item.descripcion + "</td>" +
                    "<td>" + item.ruta + "</td>" +
                    "<td>" + botonAgregar + "</td></tr>");
            });

            // Inicializar la tabla DataTable
            $(document).ready(function() {
                $('#tableEnlaces').DataTable({
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por página",
                        "zeroRecords": "No se encontraron registros",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                        "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                        "infoFiltered": "(filtrados de un total de _MAX_ registros)",
                        "search": "Buscar:",
                        "paginate": {
                            "first": "Primero",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Último"
                        }
                    }
                });
            });
        });
    }

    // Cargar datos de asignación de enlaces
    function cargarAsignarEnlace() {
        $.get("ServletAsignarEnlaceJSON?accion=TABLA", function(response) {
            $.each(response, function(index, item) {
                let botonEditar = "<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
                let botonEliminar = "<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
                $("#TablaAsignarEnlace").append("<tr><td>" + item.roles_id_rol + "</td>" +
                    "<td>" + item.nombreRol + "</td>" +
                    "<td>" + item.enlace_id_enlace + "</td>" +
                    "<td>" + item.nombreEnlace + "</td>" +
                    "<td>" + botonEditar + "</td><td>" + botonEliminar + "</td></tr>");
            });

            // Inicializar la tabla DataTable
            $(document).ready(function() {
                $('#TablaAsignarEnlace').DataTable({
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por página",
                        "zeroRecords": "No se encontraron registros",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                        "infoEmpty": "Mostrando 0 a 0 de 0 registros",
                        "infoFiltered": "(filtrados de un total de _MAX_ registros)",
                        "search": "Buscar:",
                        "paginate": {
                            "first": "Primero",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Último"
                        }
                    }
                });
            });
        });
    }

    // Listar enlaces seleccionados
    function listaEnlacesSeleccionados() {
        let botonEliminar = "<button type='button' class='btn btn-danger btn-eliminar'><i class='fas fa-trash-alt'></i></button>";
        $.get("ServletRequerimiento?accion=LISTAR", function(response) {
            $.each(response, function(index, item) {
                $("#tableAsignacionesRolesyEnlaces").append("<tr><td>" + item.ROL + "</td>" +
                    "<td>" + item.nombreRol + "</td><td>" + item.ENLACE + "</td><td>" + item.nombreEnlace + "</td><td>" + botonEliminar + "</td></tr>");
            });
        });
    }

    // Manejar evento al hacer clic en un botón de adición
    $(document).on("click", ".btn-adicionar", function() {
        let IdRol = $("#idRol").val();
        console.log(IdRol);
        let IdEnlace = $(this).parents("tr").find("td")[0].innerHTML;
        console.log(IdEnlace);

        let botonEliminar = "<button type='button' class='btn btn-danger btn-eliminar'><i class='fas fa-trash-alt'></i></button>";
        $.get("ServletAsignarEnlaceJSON?accion=ADICIONAR&ROL=" + IdRol + "&ENLACE=" + IdEnlace, function(response) {
            console.log(response);
            $.each(response, function(index, item) {
                $("#tableAsignacionesRolesyEnlaces").append("<tr><td>" + item.ROL + "</td>" +
                    "<td>" + item.nombreRol + "</td><td>" + item.ENLACE + "</td><td>" + item.nombreEnlace + "</td><td>" + botonEliminar + "</td></tr>");
            });
        });
    });

</script>

		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>