<jsp:include page="intranet.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Roles</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css"
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

	<div class="container">
		<h1 class="mt-5 text-center">Roles de la empresa</h1>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-agregar"
			data-bs-toggle="modal" data-bs-target="#exampleModal"
			id="botonAgregar">Agregar rol</button>


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
								<label for="" class="form-label">Cod</label> <input type="text"
									class="form-control" name="codigo" id="id-codigo" value="0"
									readonly>
							</div>

							<div class="form-group">
								<label for="" class="form-label">Nombre del Rol</label> <input
									type="text" class="form-control" name="nombre" id="id-nombre">
							</div>
							<div class="form-group">
								<label for="id-descripcion" class="form-label">Descripción</label>
								<textarea class="form-control" name="descripcion"
									id="id-descripcion" rows="3"></textarea>
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
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
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

<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
		var tipoMensaje = "${sessionScope.TIPO_MENSAJE}";
		toastr[tipoMensaje]("${sessionScope.MENSAJE}", toastr.options = {
			"timeOut" : "2000",
			"positionClass " : " toast-top-right ",
		});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session" />
<script>

//TOMAMOS EL VALOR DEL ROL
var rolDelEmpleado = ${sessionScope.rolDelEmpleado};
console.log(rolDelEmpleado);
//OCULTA EL BOTON AGREGAR SEGUN EL ROL
if (rolDelEmpleado !== 1 && rolDelEmpleado !== 2) {
    $(document).ready(function() {
        $("#botonAgregar").hide();
    });
}

cargarRoles();
function cargarRoles() {
    //$.get("ServletRolJSON", function(response) {
    $.get("ServletRol?accion=listado", function(response) {
    	$.each(response, function(index, item) {
        let botonEditar = (rolDelEmpleado !== 1 && rolDelEmpleado !== 2) ? "" : "<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
        let botonEliminar = (rolDelEmpleado !== 1) ? "" : "<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";

        $("#TablaRol").append("<tr><td>" + item.id + "</td>" +
            "<td>" + item.nombre + "</td>" +
            "<td>" + item.descripcion + "</td>" +
            "<td>" + botonEditar + "</td><td>" + botonEliminar + "</td></tr>");
    });

        $(document).ready(function() {
            $('#TablaRol').DataTable({
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
$(document).on("click", ".btn-editar", function() {
    var codigo = $(this).parents("tr").find("td")[0].innerHTML;
    $.get("ServletRol?accion=buscarRol&id=" + codigo, function(response) { 
        $("#id-codigo").val(response.id);
        $("#id-nombre").val(response.nombre);
        $("#id-descripcion").val(response.descripcion);
    });
});

$(document).on("click", ".btn-eliminar", function() {
    var codigo;
    var nombre;
    codigo = $(this).parents("tr").find("td")[0].innerHTML;
    nombre = $(this).parents("tr").find("td")[1].innerHTML;

    Swal.fire({
        title: '¿Seguro de eliminar?',
        text: '¿Desea eliminar el rol "' + nombre + '"?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            // Si se confirma la eliminación, realiza la redirección
            window.location = "http://localhost:8080/GitHub_ONG/ServletRol?accion=eliminar&id=" + codigo;
        }
    });
});

// Añadir evento al cerrar el modal para reiniciar el formulario
$('#exampleModal').on('hidden.bs.modal', function () {
    $("#FormularioRol").trigger("reset");
    $("#FormularioRol").data("bootstrapValidator").resetForm(true);
    $("#id-codigo").val("0");
});

$(document).on("click", "#btn-cerrar", function() {
    $("#FormularioRol").trigger("reset");
    $("#FormularioRol").data("bootstrapValidator").resetForm(true);
    $("#id-codigo").val("0");
});


</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#FormularioRol').bootstrapValidator({
			fields : {
				nombre: {
				    validators: {
				        notEmpty: {
				            message: 'Campo de nombre es obligatorio'
				        },
				        stringLength: {
				            max: 15,
				            message: 'El nombre del rol debe tener un máximo de 15 caracteres'
				        },
				        regexp: {
				            regexp: /^[A-Za-zÁÉÍÓÚáéíóúÑñ,.;:¡!¿?"'()]+$/,
				            message: 'Solo se aceptan letras, tildes y algunos caracteres especiales en el nombre del rol (sin espacios ni números)'
				        }
				    }
				},
				descripcion : {
					validators : {
						notEmpty : {
							message : 'Campo de descripcion es obligatorio'
						},
						stringLength: {
							max: 200,
							message: 'La descripción debe tener un máximo de 200 caracteres'
						},
						regexp : {
							regexp : /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s,.;:¡!¿?"'()]+$/,
							message : 'Solo se aceptan letras, números, tildes y espacios en la descripción'
						}
					}
				}
			}
		});
	});
</script>

</html>