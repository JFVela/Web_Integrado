<jsp:include page="intranet.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donantes</title>
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
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
<link rel="stylesheet" href="assets/css/EstiloBotones.css">
<style>
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
		<h1 class="mt-5 p-3 display-2 text-center">
			<strong>Listado de <span style="color: green;">Donantes</span></strong>
		</h1>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false"
			aria-labelledby="staticBackdropLabel">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Donante</h1>
					</div>
					<div class="modal-body ">

						<form id="formDonante" method="post"
							action="ServletDonante?accion=insertarModal">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">DNI</label> <input
									type="text" class="form-control" name="dni" id="id-dni"
									readonly>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Nombre</label>
								<input type="text" class="form-control" name="nombre"
									id="id-nombre">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Paterno</label>
								<input type="text" class="form-control" name="paterno"
									id="id-paterno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Materno</label>
								<input type="text" class="form-control" name="materno"
									id="id-materno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Celular</label>
								<input type="text" class="form-control" name="celular"
									id="id-celular">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Correo
									Electrónico</label> <input type="text" class="form-control"
									name="email" id="id-email">
							</div>
							<div class="form-group">
								<label for="departamento" class="label-form text-secondary">Departamento</label>
								<select name="departamento"
									class="form-control departamento-label" id="id-departamento"
									required>
									<option value=" ">[Seleccione un Departamento]</option>
								</select>
							</div>
							<div class="form-group">
								<label for="provincia" class="label-form text-secondary">Provincia</label>
								<select name="provincia" class="form-control provincia-label"
									id="id-provincia" required>
									<option value=" ">[Seleccione una provincia]</option>
								</select>
							</div>
							<div class="form-group">
								<label for="distrito" class="label-form text-secondary">Distrito</label>
								<select name="distrito" class="form-control distrito-label"
									id="id-distrito" required>
									<option value=" ">[Seleccione un distrito]</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label">Dirección</label>
								<input type="text" class="form-control" name="direccion"
									id="id-direccion">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Grabar</button>
								<button type="button" class="btn btn-secondary boton-cerrar"
									data-bs-dismiss="modal">Cerrar</button>
							</div>

						</form>

					</div>

				</div>
			</div>
		</div>
		<%--Tabla --%>
		<div class="mt-5">
			<table id="tablaDonante" class="table table-striped table-bordered"
				style="width: 100%">
				<thead>
					<tr>
						<th>DNI</th>
						<th>Nombre</th>
						<th>Paterno</th>
						<th>Materno</th>
						<th>Correo Electronico</th>
						<th>Celular</th>
						<th>Distrito</th>
						<th>Dirección</th>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>
<!-- libreria JS de la tabla -->
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>


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


<c:remove var="MENSAJE" scope="session" />
<script>
cargarDonantes();
function cargarDonantes(){
	$.get("ServletDonante?accion=listado",function(response){
		let botonEditar="<a class='btn-neon1 btn-edit'  data-bs-toggle='modal' data-bs-target='#exampleModal' data-operacion='actualizar' ><span id=span11></span><span id=span21></span><span id=span31></span><span id=span41></span>Editar</a>";
        let botonEliminar="<a class='btn-neon btn-deleted'><span id=span1></span> <span id=span2></span> <span id=span3></span><span id=span4></span>Eliminar</a>";
		$.each(response,function(index,item){
			//llenar tabla
			$("#tablaDonante").append("<tr><td>"+item.dni+"</td>"+
				 "<td>"+item.nombre+"</td>"+"<td>"+item.paterno+"</td>"+
				 "<td>"+item.materno+"</td>"+"<td>"+item.email+"</td>"+
				 "<td>"+item.celular+"</td>"+"<td>"+item.distrito+"</td>"+"<td>"+item.direccion+"</td>"+
				 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
		})
		new DataTable('#tablaDonante');
	})
}

$(document).on("click",".boton-cerrar",function(){

	$("#formDonante").trigger("reset");
	$("#formDonante").data("bootstrapValidator").resetForm(true);
})
$(document).on("click", ".btn-edit", function () {
    var dni;
    dni = $(this).parents("tr").find("td")[0].innerHTML;

    var operacion = $(this).data("operacion");

    // Realiza una solicitud AJAX para cargar el archivo JSON
    $.get("assets/map.pe.json", function (data) {
        $.get("ServletDonante?accion=buscar&id=" + dni, function (response) {
            $("#id-dni").val(response.dni);
            $("#id-nombre").val(response.nombre);
            $("#id-paterno").val(response.paterno);
            $("#id-materno").val(response.materno);
            $("#id-celular").val(response.celular);
            $("#id-email").val(response.email);
            $("#id-direccion").val(response.direccion);

            // Buscar la provincia y la ciudad del distrito
            var selectedCiudad;
            var selectedProvincia;

            for (var ciudad in data) {
                for (var provincia in data[ciudad]) {
                    for (var distrito in data[ciudad][provincia]) {
                        if (data[ciudad][provincia][distrito] === response.distrito) {
                            selectedCiudad = ciudad;
                            selectedProvincia = provincia;
                            break;
                        }
                    }
                }
            }

            // Actualiza los campos de ciudad y provincia en el formulario
            $("#id-departamento").val(selectedCiudad);

            // Limpia el combo de provincia
            $("#id-provincia").empty();

            // Agrega las provincias correspondientes a la ciudad seleccionada
            if (data[selectedCiudad]) {
                var provinces = data[selectedCiudad];
                for (var province in provinces) {
                    $("#id-provincia").append($('<option>', {
                        value: province,
                        text: province
                    }));
                }
            }

            // Selecciona la provincia
            $("#id-provincia").val(selectedProvincia);

            // Limpia el combo de distrito
            $("#id-distrito").empty();

            // Actualiza el combo de distrito basado en la provincia seleccionada
            if (data[selectedCiudad] && data[selectedCiudad][selectedProvincia]) {
                var districts = data[selectedCiudad][selectedProvincia];
                for (var district in districts) {
                    $("#id-distrito").append($('<option>', {
                        value: district,
                        text: district
                    }));
                }
            }

            // Selecciona el distrito
            $("#id-distrito").val(response.distrito);
        })

        if (operacion === "actualizar") {
            // Configurar el modal para la actualización
            $("#exampleModal .modal-title").text("Editar Donante");
            $("#formDonante").attr("action", "ServletDonante?accion=actualizar");
            $("#id-dni-antiguo").val(dni);
        }
    });
});




	$(document).on("click",".btn-deleted",function(){
		var dni;
		dni=$(this).parents("tr").find("td")[0].innerHTML;
		// Definir la función verificarDonacion fuera del controlador de clic
		function verificarDonacion(dni) {
		    $.ajax({
		        type: "POST",
		        url: "ServletVerificarDonacion",
		        data: { dni: dni },
		        success: function(response) {
		            if (response === "false") {
		                Swal.fire({
		                    title: 'Seguro de Eliminar?',
		                    text: "Donante con DNI: " + dni + " no tiene donaciones asociadas.",
		                    icon: 'error',
		                    showCancelButton: true,
		                    confirmButtonColor: '#3085d6',
		                    cancelButtonColor: '#d33',
		                    confirmButtonText: 'Aceptar',
		                    cancelButtonText: 'Cancelar'
		                }).then((result) => {
		  				  if (result.isConfirmed) {
		  				    window.location="http://localhost:8080/GitHub_ONG/ServletDonante?accion=eliminar&dato=" + dni;
		  				  }
		  				})	
		            } else {
		                Swal.fire({
		                    title: 'No se puede realizar la eliminación',
		                    text: 'La donación no se puede eliminar',
		                    icon: 'warning',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: 'Aceptar'
		                });
		            }
		        },
		        error: function() {
		            Swal.fire({
		                title: 'Error de servidor',
		                text: 'No se pudo verificar la donación',
		                icon: 'error',
		                confirmButtonColor: '#3085d6',
		                confirmButtonText: 'Aceptar'
		            });
		        }
		    });
		}

		$(document).on("click", ".btn-deleted", function() {
		    var dni;
		    dni = $(this).parents("tr").find("td")[0].innerHTML;

		    // Llamar la función verificarDonacion con el valor de dni
		    verificarDonacion(dni);
		});


		})

</script>
<script>    
	    $(document).ready(function(){     
	        $('#formDonante').bootstrapValidator({      
	        	 fields:{
	        		 dni:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				}
		        			} 
	        		 },
	        		 nombre:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 paterno:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			} 
	        		 },
	        		 materno:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 celular:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
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
	        		 email:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},
		        				emailAddress: {
		        		            message: 'El campo email debe contener una dirección de correo electrónico válida'
		        		        }
		        			}
	        		 },departamento:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 provincia:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 distrito:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 direccion:{
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
		//Script para cargar dinamicamente los select de Ciudad, Distrito y Provincia.
		const ciudadSelect = document.getElementById('id-departamento');
		const provinciaSelect = document.getElementById('id-provincia');
		const distritoSelect = document.getElementById('id-distrito');

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
	</script>
</html>