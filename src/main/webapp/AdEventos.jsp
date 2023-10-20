<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN | Eventos</title>
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
<link rel="stylesheet" href="assets/css/table.css">

<style>
@import
	url("https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,800,800italic,Inter")
	;

body {
	height: 95vh;
	align-items: center;
	background: linear-gradient(to bottom, #d4d4d4bd, #dedada5e, #ffffff, #ffffff);
	font-family: 'Inter';
	cursor: url(assets/img/arrow.png) 6 0, auto !important;
}

td {
	font-size: 14px
}

th {
	font-size: 18px
}

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
</style>

</head>
<body>

	<div class="container">
		<h1 class="mt-5 text-center">Eventos</h1>
		<hr class="my-4 pb-2">
		<!-- Button trigger modal -->
		<button type="button" class="c__cta btn btn-rounded"
			data-bs-toggle="modal" data-bs-target="#exampleModal">Nuevo
			Evento</button>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title form-head text-bold fs-4">Tabla de
							Eventos</h5>
					</div>

					<div class="modal-body">

						<form id="contact-form" method="post"
							action="ServletEventos?accion=guardar"
							onsubmit="return validarFechas();">
							<div class="form-group"">
								<label for="dni" class="label-form font-weight-bold">ID</label>
								<input type="text" value="0" name="id"
									class="form-control dni-label" id="id" readonly>
							</div>
							<div class="form-group">
								<label for="nombre" class="label-form text-secondary">Nombre
									del Evento</label> <input type="text" class="form-control name-label"
									name="nombreEspecialidad" id="nombreEspecialidad" required>
							</div>
							<div class="form-group">
								<label for="ubicacion" class="label-form text-secondary">Ubicación</label>
								<input type="text" class="form-control name-label"
									name="ubicacion" id="ubicacion" required>
							</div>
							<div class="form-group">
								<label for="inicioInscripcion" class="label-form text-secondary">Inicio
									de Inscripción</label> <input type="date"
									class="form-control name-label" name="inicioInscripcion"
									id="inicioInscripcion" required>
							</div>
							<div class="form-group">
								<label for="finalInscripcion" class="label-form text-secondary">Final
									de Inscripción</label> <input type="date"
									class="form-control name-label" name="finalInscripcion"
									id="finalInscripcion" required>
							</div>
							<div class="form-group">
								<label for="inicioEvento" class="label-form text-secondary">Inicio
									de Evento</label> <input type="date" class="form-control name-label"
									name="inicioEvento" id="inicioEvento" required>
							</div>
							<div class="form-group">
								<label for="finalEvento" class="label-form text-secondary">Final
									de Evento</label> <input type="date" class="form-control name-label"
									name="finalEvento" id="finalEvento" required>
							</div>
							<div class="form-group">
								<label for="detalleEvento" class="label-form text-secondary">Detalle
									de Evento</label> <input type="text" class="form-control name-label"
									name="detalleEvento" id="detalleEvento" required>
							</div>
							<div class="form-group">
								<label for="vacantes" class="label-form text-secondary">Vacantes</label>
								<input type="text" class="form-control name-label"
									name="vacantes" id="vacantes" required data-bv-callback="true"
									data-bv-callback-message="Campo vacantes debe estar entre 1 y 500"
									data-bv-callback-callback="validarVacantes">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn  btn-rounded-ed">Grabar</button>
								<button type="button" class="btn  btn-cerrar"
									data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="mt-3">
			<table id="TableEventos" class="table table-striped"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Ubicación</th>
						<th>Inicio Inscripción</th>
						<th>Fin Inscripción</th>
						<th>Inicio Evento</th>
						<th>Fin Evento</th>
						<th>Detalle</th>
						<th>Vacantes</th>
						<th>Inscritos</th>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session" />

<script>
	// Función para validar las fechas
	function validarFechas() {
    // Obtén los valores de las fechas desde los campos
    var inicioInscripcion = new Date(document.getElementById('inicioInscripcion').value);
    var finalInscripcion = new Date(document.getElementById('finalInscripcion').value);
    var inicioEvento = new Date(document.getElementById('inicioEvento').value);
    var finalEvento = new Date(document.getElementById('finalEvento').value);

    // Realiza la validación
    if (finalInscripcion < inicioInscripcion) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'La fecha de "Final de Inscripción" no puede ser menor que la fecha de "Inicio de Inscripción"',
        });
        return false;
    }
    if (finalEvento < inicioEvento) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'La fecha de "Final del Evento" no puede ser menor que la fecha de "Inicio del Evento"',
        });
        return false;
    }

    // Si las fechas son válidas, puedes enviar el formulario 
    return true;
}


		//invocar funciones de carga
		cargarEventos()
		
	
		//crear función para leer JSON de docentes
		function cargarEventos(){
			$.get("ServletEventosJSON",function(response){	
				let botonEditar="<button type='button' class='c__cta btn btn-rounded-ed btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
                let botonEliminar="<button type='button' class='c__cta font-weight-bold btn btn-rounded-el btn-eliminar'>Eliminar</button>";
				$.each(response,function(index,item){
					//llenar tabla
					$("#TableEventos").append("<tr><td>"+item.id_evento+"</td>"+
						 "<td>"+item.nombre+"</td>"+"<td>"+item.ubicacion+"</td>"+
						 "<td>"+item.inicio_inscripcion+"</td>"+"<td>"+item.final_inscripcion+"</td>"+
						 "<td>"+item.einicio+"</td>"+"<td>"+item.efinal+"</td>"+
						 "<td>"+item.detalle+"</td>"+"<td>"+item.vacantes+"</td>"+
						 "<td>"+item.inscritos+"</td>"+
						 "<td>"+botonEditar+"</td>"+"<td>"+botonEliminar+"</td></tr>");
				})
				$(document).ready(function() {
				    $('#TableEventos').DataTable({
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
			})
		}
		
		
		//asignar evento click a todos los botones con nombre de clase btn-eliminar
		$(document).on("click",".btn-eliminar",function(){
			var id;
			var nombre;
			var inscritos;
			id=$(this).parents("tr").find("td")[0].innerHTML;
			nom=$(this).parents("tr").find("td")[1].innerHTML;
			inscritos=$(this).parents("tr").find("td")[9].innerHTML;
			Swal.fire({
				  title: '¿Seguro de eliminar?',
				  text: "El evento '" + nom +  "' tiene "+inscritos+" voluntario(s) inscrito(s). Al eliminar el "+nom+" se eliminaran todos los voluntarios inscritos.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/GitHub_ONG/ServletEventos?accion=eliminar&id="+id;
				  }
				})			
		})
		//asignar evento click a todos los botones con nombre de clase btn-editar
		$(document).on("click",".btn-editar",function(){
			var id;
			id=$(this).parents("tr").find("td")[0].innerHTML;

			$.get("ServletFindEventosJSON?id="+id, function(response){
				console.log(response);
				//mostrar valores en las cajas
				  var inicioInscripcionDate = new Date(response.inicio_inscripcionStr);
				    var finalInscripcionDate = new Date(response.final_inscripcionStr);
				    var einicioDate = new Date(response.einicioStr);
				    var efinalDate = new Date(response.efinalStr);

				    // Verificar si las fechas son válidas
				    if (!isNaN(inicioInscripcionDate) && !isNaN(finalInscripcionDate) &&
				        !isNaN(einicioDate) && !isNaN(efinalDate)) {
				        // Asignar fechas a los campos de tipo date
				        $("#inicioInscripcion").val(inicioInscripcionDate.toISOString().slice(0, 10));
				        $("#finalInscripcion").val(finalInscripcionDate.toISOString().slice(0, 10));
				        $("#inicioEvento").val(einicioDate.toISOString().slice(0, 10));
				        $("#finalEvento").val(efinalDate.toISOString().slice(0, 10));
				    } else {
				        // Si alguna fecha no es válida, muestra un mensaje de error o manejo adecuado
				        console.error("Error al convertir fechas.");
				    }

				    // Asignar los demás campos
				    $("#id").val(response.id_evento);
				    $("#nombreEspecialidad").val(response.nombre);
				    $("#ubicacion").val(response.ubicacion);
				    $("#detalleEvento").val(response.detalle);
				    $("#vacantes").val(response.vacantes);
			})
		})
		//asignar evento click al botón con ID "btn-cerrar"
		$(document).on("click","#btn-cerrar",function(){
			//resetear formulario
			$("#contact-form").trigger("reset");
			//resetar validación
			$("#contact-form").data("bootstrapValidator").resetForm(true);
			//
		})
	</script>

<script>    
    $(document).ready(function(){     
        $('#contact-form').bootstrapValidator({      
        	 fields:{
        		 	nombreEspecialidad:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo nombre es obligatorio'
        		 			},
        		 			regexp:{
        		 				regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.\0-9]{2,20}$/,
        		 				message:'Campo nombre valores errores(Letras,espacio, vocales con tilde y .)'
        		 			}
        		 		}
        		 	},
        		 	ubicacion: {
                        validators: {
                            notEmpty: {
                                message: 'Campo ubicación es obligatorio'
                            }
                        }
                    },
                    inicioInscripcion: {
                        validators: {
                            notEmpty: {
                                message: 'Campo inicio de inscripción es obligatorio'
                            }
                        }
                    },
                    finalInscripcion: {
                        validators: {
                            notEmpty: {
                                message: 'Campo final de inscripción es obligatorio'
                            }
                        }
                    },
                    inicioEvento: {
                        validators: {
                            notEmpty: {
                                message: 'Campo inicio de evento es obligatorio'
                            }
                        }
                    },
                    finalEvento: {
                        validators: {
                            notEmpty: {
                                message: 'Campo final de evento es obligatorio'
                            }
                        }
                    },
                    detalleEvento: {
                        validators: {
                            notEmpty: {
                                message: 'Campo detalle de evento es obligatorio'
                            }
                        }
                    },
                    vacantes: {
                        validators: {
                            notEmpty: {
                                message: 'Campo vacantes es obligatorio'
                            },
                            integer: {
                                message: 'Campo vacantes debe contener solo números'
                            },
                            callback: {
                                message: 'El campo vacantes debe estar entre 1 y 500',
                                callback: function(value, validator, $field) {
                                    var vacantes = parseInt(value, 10);
                                    if (isNaN(vacantes) || vacantes < 1 || vacantes > 500) {
                                        return false;
                                    }
                                    return true;
                                
                            }
                        }
                    }
        		 		}
        		 	
        	 }
        });   
			
    });    
    
    function validarVacantes(value, validator, $field) {
        var vacantes = parseInt(value, 10);

        if (isNaN(vacantes) || vacantes < 1 || vacantes > 500) {
            return false;
        }

        return true;
    }
</script>

</html>