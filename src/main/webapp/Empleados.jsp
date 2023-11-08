<jsp:include page="intranet.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Empleados</title>
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
<body>

	<div class="container">
		<h1 class="mt-5 text-center">Departamentos</h1>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#exampleModal">Nuevo Docente</button>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="modalEmpleadoLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="modalEmpleadoLabel">Formulario</h1>
					</div>
					<div class="modal-body">
						<!-- GRABAR -->

						<form id="FormularioEmpleado" method="post"
							action="ServletEmpleados?accion=grabar">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="" class="form-label">Cod</label> <input
											type="text" class="form-control" name="codigo" id="id-codigo"
											value="0" readonly>
									</div>
									<div class="form-group">
										<label for="dni" class="">DNI</label> <input type="number"
											class="form-control" name="dni" id="id-dni">
									</div>
									<div class="form-group">
										<label for="login" class="form-label">Username</label> <input
											type="text" class="form-control" name="login" id="id-login">
									</div>
									<div class="form-group">
										<label for="contraseña" class="form-label">Contraseña</label>
										<input type="password" class="form-control" name="contrasena"
											id="id-contraseña">
									</div>
									<div class="form-group">
										<label for="nombre" class="form-label">Nombre</label> <input
											type="text" class="form-control" name="nombre" id="id-nombre">
									</div>
									<div class="form-group">
										<label for="paterno" class="form-label">Apellido
											Paterno</label> <input type="text" class="form-control"
											name="paterno" id="id-paterno">
									</div>
									<div class="form-group">
										<label for="materno" class="form-label">Apellido
											Materno</label> <input type="text" class="form-control"
											name="materno" id="id-materno">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="telefono" class="form-label">Teléfono</label> <input
											type="number" class="form-control" name="telefono"
											id="id-telefono">
									</div>
									<div class="form-group">
										<label for="correo" class="form-label">Correo</label> <input
											type="email" class="form-control" name="correo"
											id="id-correo">
									</div>
									<div class="form-group">
										<label for="direccion" class="form-label">Dirección</label>
										<textarea class="form-control" name="direccion"
											id="id-direccion"></textarea>
									</div>
									<div class="form-group">
										<label for="sueldo" class="form-label">Sueldo</label> <input
											type="number" class="form-control" name="sueldo"
											id="id-sueldo">
									</div>
									<div class="form-group">
										<label for="rol" class="form-label">Rol</label> <select
											class="form-control" name="rol" id="id-rol">
											<option value="">[Seleccione un Rol]</option>
										</select>
									</div>
									<div class="form-group">
										<label for="departamento" class="form-label">Departamento</label>
										<select class="form-control" name="departamento"
											id="id-departamento">
											<option value="">[Seleccione un Departamento]</option>
										</select>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Guardar</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

		<div class="mt-3">
			<!-- CREAR TABLA -->
			<table id="TablaEmpleados" class="table table-striped"
				style="width: 100%">
				<thead>
					<tr>
						<th>COD</th>
						<th>DNI</th>
						<th>Login</th>
						<th>Nombre</th>
						<th>A.Paterno</th>
						<th>A.Materno</th>
						<th>Telf</th>
						<th>Correo</th>
						<th>Dirección</th>
						<th>Sueldo</th>
						<th>Rol</th>
						<th>Departamento</th>
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
    cargarEmpleados();
    cargarDepa();
    cargarRol();
    
    function cargarDepa(){
		$.get("ServletDepaJSON",function(response){	
			$.each(response,function(index,item){
				$("#id-departamento").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
			})
		})
	}
    
    function cargarRol(){
		$.get("ServletRolJSON",function(response){	
			$.each(response,function(index,item){
				$("#id-rol").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
			})
		})
	}
    
    function cargarEmpleados() {
        $.get("ServletEmpleadosJSON", function(response) {
            let botonEditar = "<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
            let botonEliminar = "<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
            $.each(response, function(index, item) {
                $("#TablaEmpleados").append("<tr><td>" + item.codigo + "</td>" +
                        "<td>" + item.dni + "</td>" +
                        "<td>" + item.login + "</td>" +
                    "<td>" + item.nombre + "</td><td>" + item.paterno + "</td>" +
                    "<td>" + item.materno + "</td><td>" + item.telefono + "</td>" +
                    "<td>" + item.correo + "</td><td>" + item.direccion + "</td>" +
                    "<td>" + item.sueldo + "</td><td>" + item.nombre_rol + "</td>" +
                    "<td>" + item.nombre_departamento + "</td><td>" + botonEditar + "</td><td>" + botonEliminar + "</td></tr>");
            });

            $(document).ready(function() {
                $('#TablaEmpleados').DataTable({
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
        var codigo;
        codigo = $(this).parents("tr").find("td")[0].innerHTML;
        $.get("ServletFindEmpleadosJSON?codigo=" + codigo, function(response) {
            $("#id-codigo").val(response.codigo);
            $("#id-dni").val(response.dni);
            $("#id-login").val(response.login);
            $("#id-contraseña").val("*****");
            $("#id-nombre").val(response.nombre);
            $("#id-paterno").val(response.paterno);
            $("#id-materno").val(response.materno);
            $("#id-telefono").val(response.telefono);
            $("#id-correo").val(response.correo);
            $("#id-direccion").val(response.direccion);
            $("#id-sueldo").val(response.sueldo);
            $("#id-rol").val(response.id_rol);
            $("#id-departamento").val(response.id_depa);
        });
    });
    
    $(document).on("click", ".btn-eliminar", function() {
    	var codigo;
        var dni;
        var nombre;
        codigo= $(this).parents("tr").find("td")[0].innerHTML;
        dni = $(this).parents("tr").find("td")[1].innerHTML;
        nombre = $(this).parents("tr").find("td")[3].innerHTML; // Obtener el nombre del empleado
    
        Swal.fire({
            title: '¿Seguro de eliminar?',
            text: '¿Desea eliminar al empleado "' + nombre + '", DNI: ' + dni + '"?', // Usar el nombre y el DNI en el mensaje
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location = "http://localhost:8080/GitHub_ONG/ServletEmpleados?accion=eliminar&codigo=" + codigo;
            }
        });
    });
    
    $(document).on("click", "#btn-cerrar", function() {
        $("#FormularioEmpleado").trigger("reset");
        $("#FormularioEmpleado").data("bootstrapValidator").resetForm(true);
        $("#id-codigo").val("0");
    });
</script>

<script>
    $(document).ready(function() {
        var dniExistente = false;
        var correoExistente = false;
        var loginExistente = false;
        var telefonoExistente = false;

        $("#id-dni").on("input", function() {
            var dni = $(this).val();
            if (dni.length === 8) {
                $.ajax({
                    type: "POST",
                    url: "ServletEmpleados?accion=verificarDNI", // Cambiar la URL según la estructura de tu servlet
                    data: {
                        dni: dni
                    },
                    success: function(data) {
                        if (data.status === "dni_existente") {
                            Swal.fire({
                                title: '¡Empleado ya registrado!',
                                text: 'El DNI: ' + dni + ' ya está registrado en la base de datos.',
                                imageUrl: 'assets/img/dni.gif', // Reemplazar con la URL de tu imagen
                                imageWidth: 400,
                                imageHeight: 205,
                                imageAlt: 'imgError',
                            });
                            dniExistente = true;
                            $("#id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", true);
                        } else {
                            dniExistente = false;
                            $("#id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", false);
                        }
                    },
                    error: function() {
                        console.error("Error en la solicitud AJAX");
                    }
                });
            }
        });

        $("#id-login").on("input", function() {
            var login = $(this).val();
            $.ajax({
                type: "POST",
                url: "ServletEmpleados?accion=verificarLogin", // Cambiar la URL según la estructura de tu servlet
                data: {
                    login: login
                },
                success: function(data) {
                    if (data.status === "login_existente") {
                        Swal.fire({
                            title: '¡Nombre de usuario existente!',
                            text: 'El nombre de usuario ' + login + ' ya está registrado en la base de datos.',
                            imageUrl: 'assets/img/spiderman.gif', // Reemplazar con la URL de tu imagen
                            imageWidth: 400,
                            imageHeight: 223,
                            imageAlt: 'imgError',
                        });
                        loginExistente = true;
                        $("#id-dni, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", true);
                    } else {
                        loginExistente = false;
                        $("#id-dni, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", false);
                    }
                },
                error: function() {
                    console.error("Error en la solicitud AJAX");
                }
            });
        });

        $("#id-telefono").on("input", function() {
            var telefono = $(this).val();
            if (/^\d{9}$/.test(telefono)) { // Verifica si el teléfono tiene 9 dígitos
                $.ajax({
                    type: "POST",
                    url: "ServletEmpleados?accion=verificarTelefono", // Cambiar la URL según la estructura de tu servlet
                    data: {
                        telefono: telefono
                    },
                    success: function(data) {
                        if (data.status === "telefono_existente") {
                            Swal.fire({
                                title: '¡Número de teléfono existente!',
                                text: 'El número de teléfono ' + telefono + ' ya está registrado en la base de datos.',
                                imageUrl: 'assets/img/telefono.gif', // Reemplazar con la URL de tu imagen
                                imageWidth: 400,
                                imageHeight: 400,
                                imageAlt: 'imgError',
                            });
                            telefonoExistente = true;
                            $("#id-dni, #id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", true);
                        } else {
                            telefonoExistente = false;
                            $("#id-dni, #id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-correo, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", false);
                        }
                    },
                    error: function() {
                        console.error("Error en la solicitud AJAX");
                    }
                });
            }
        });
        
        $("#id-correo").on("input", function() {
            var correo = $(this).val();
            if (isValidEmail(correo)) {
                $.ajax({
                    type: "POST",
                    url: "ServletEmpleados",
                    data: {
                        accion: "verificarCorreo",
                        correo: correo
                    },
                    success: function(data) {
                        if (data.status === "correo_existente") {
                            Swal.fire({
                                title: '¡Correo ya registrado!',
                                text: 'El correo ' + correo + ' ya está registrado en la base de datos. Por favor, utiliza otro correo.',
                                imageUrl: 'assets/img/correo.gif', // Reemplazar con la URL de tu imagen
                                imageWidth: 400,
                                imageHeight: 275,
                                imageAlt: 'imgError',                            });
                            correoExistente = true;
                            $("#id-dni, #id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", true);
                        } else {
                            correoExistente = false;
                            $("#id-dni, #id-login, #id-contraseña, #id-nombre, #id-paterno, #id-materno, #id-telefono, #id-direccion, #id-sueldo, #id-rol, #id-departamento").prop("disabled", false);
                        }
                    },
                    error: function() {
                        console.error("Error en la solicitud AJAX");
                    }
                });
            }
        });

        function isValidEmail(email) {
            return /.+@.+\..+/.test(email);
        }

    });
</script>


<script>
$(document).ready(function() {
	 $('#FormularioEmpleado').bootstrapValidator({      
    	 fields:{
            dni: {
                validators: {
                    notEmpty: {
                        message: 'El DNI es obligatorio'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'El DNI debe tener 8 dígitos'
                    },
                    greaterThan: {
                        value: 0,
                        message: 'El DNI debe ser mayor que 0'
                    }
                }
            },
            login: {
                validators: {
                    notEmpty: {
                        message: 'El Login es obligatorio'
                    },
                    stringLength: {
                        max: 10,
                        message: 'El Login no debe tener más de 10 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-zñÑáéíóúÁÉÍÓÚüÜ0-9\s]+$/,
                        message: 'El Login solo puede contener letras, números, espacios y tildes'
                    }
                }
            },
            contrasena: {
                validators: {
                    notEmpty: {
                        message: 'La Contraseña es obligatoria'
                    },
                    stringLength: {
                        min: 10,
                        message: 'La Contraseña debe tener al menos 10 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-zñÑáéíóúÁÉÍÓÚüÜ0-9\s]+$/,
                        message: 'La Contraseña solo puede contener letras, números, espacios y tildes'
                    }
                }
            },
            nombre: {
                validators: {
                    notEmpty: {
                        message: 'El Nombre es obligatorio'
                    },
                    stringLength: {
                        max: 15,
                        message: 'El Nombre no debe tener más de 15 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-zñÑáéíóúÁÉÍÓÚüÜ]+$/,
                        message: 'El Nombre solo puede contener letras y tildes'
                    }
                }
            },
            paterno: {
                validators: {
                    notEmpty: {
                        message: 'El Apellido Paterno es obligatorio'
                    },
                    stringLength: {
                        max: 15,
                        message: 'El Apellido Paterno no debe tener más de 15 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-zñÑáéíóúÁÉÍÓÚüÜ]+$/,
                        message: 'El Apellido Paterno solo puede contener letras y tildes'
                    }
                }
            },
            materno: {
                validators: {
                    notEmpty: {
                        message: 'El Apellido Materno es obligatorio'
                    },
                    stringLength: {
                        max: 15,
                        message: 'El Apellido Materno no debe tener más de 15 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-zñÑáéíóúÁÉÍÓÚüÜ]+$/,
                        message: 'El Apellido Materno solo puede contener letras y tildes'
                    }
                }
            },
            telefono: {
                validators: {
                    notEmpty: {
                        message: 'El Teléfono es obligatorio'
                    },
                    stringLength: {
                        min: 9,
                        max: 9,
                        message: 'El Teléfono debe tener 9 dígitos'
                    },
                    regexp: {
                        regexp: /^9\d{8}$/,
                        message: 'El Teléfono debe comenzar con 9 y tener 9 dígitos'
                    }
                }
            },
            correo: {
                validators: {
                    notEmpty: {
                        message: 'El Correo es obligatorio'
                    },
                    emailAddress: {
                        message: 'El Correo no es válido'
                    }
                }
            },
            direccion: {
                validators: {
                    notEmpty: {
                        message: 'La Dirección es obligatoria'
                    },
                    stringLength: {
                        max: 40,
                        message: 'La Dirección no debe tener más de 40 caracteres'
                    }
                }
            },
            sueldo: {
                validators: {
                    notEmpty: {
                        message: 'El Sueldo es obligatorio'
                    },
                    greaterThan: {
                        value: 0,
                        message: 'El Sueldo debe ser mayor que 0'
                    },
                    between: {
                        min: 1500,
                        max: 8000,
                        message: 'El Sueldo debe estar entre 1500 y 8000'
                    }
                }
            },
            rol: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione un Rol'
                    }
                }
            },
            departamento: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione un Departamento'
		 			}
 			
		 		}
		 	}
		 
	 }
});   
	
});    
</script>
</html>
