<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ONG</title>
</head>
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
<!--iconos-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
</style>
<body>
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-dark text-white">
						<h3 class="text-center">Buscar Cuenta</h3>
					</div>
					<div class="card-body d-flex justify-content-center">
						<form class="row g-3" id="form_usuarioAgente" action="#"
							method="POST">
							<div class="col-auto">
								<label>Nro de cuenta:</label> <input type="number"
									class="form-control" required="" id="id-cuenta"
									name="cuenta" placeholder="Nro de cuenta">
							</div>
							<div class="col-auto" style="margin-top: 3em;">
								<button class="btn btn-primary" type="submit">Buscar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div id="datos_resultados"></div>
				<div class="card ">
					<div class="card-header bg-dark text-white text-center">
						Detalles de Usuario</div>
					<div class="card-body">
						<div class="table-responsive">
							<div id="AgenteUsers_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_length" id="AgenteUsers_length">
											<label>Show <select name="AgenteUsers_length"
												aria-controls="AgenteUsers"
												class="custom-select custom-select-sm form-control form-control-sm"><option
														value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option></select> entries
											</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table id="tblCuenta"
											class="table table-condensed table-hover dataTable no-footer"
											style="font-size: 11px; min-height: 12rem" role="grid">
											<thead class="bg-dark text-white">
												<tr role="row">
													<th class="sorting sorting_asc" tabindex="0"
														aria-controls="AgenteUsers" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Opciones: activate to sort column descending"
														style="width: 299.304px;">Opciones</th>
													<th class="sorting" tabindex="0"
														aria-controls="AgenteUsers" rowspan="1" colspan="1"
														aria-label="Usuario: activate to sort column ascending"
														style="width: 268.518px;">Nombres Completos</th>
													<th class="sorting" tabindex="0"
														aria-controls="AgenteUsers" rowspan="1" colspan="1"
														aria-label="Moneda: activate to sort column ascending"
														style="width: 279.703px;">Saldo Actual</th>
													
												</tr>
											</thead>
											<tbody id="tablaCuerpoCuenta">
												<tr class="odd">
													<td valign="top" colspan="4" class="dataTables_empty">No
														data available in table</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	
	
	<!-- Funciones Script -->
	<script>
		
	$(document).ready(function(){     
	    $('#form_usuarioAgente').submit(function(event) {
	        event.preventDefault(); // Evitar la recarga de la página
	        var numeroCuenta = $('#id-cuenta').val(); // Obtener el número de cuenta
	        
	        // Realizar la solicitud al servidor con el número de cuenta
	        $.get("ServletBuscarCuenta", { numeroCuenta: numeroCuenta }, function(response) {
	            if("error" in response){
	            	toastr.error("Cuenta ingresada es incorrecta");
	            	$("#id-cuenta").val("");
	            }else{
	        	
	        	// Limpiar la tabla antes de agregar los nuevos datos
	            $("#tablaCuerpoCuenta").empty();
	            
	            // Mostrar los datos obtenidos del servidor en la tabla
	            // Asumiendo que response es un objeto JSON con la información de la cuenta
	            $("#tablaCuerpoCuenta").append("<tr>" +
		            "<td>" +
		                "<div class='btn-group'>" +
		                    "<button type='button' class='btn btn-secondary dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false'><i class='bi bi-gear-fill'></i></button>" +
		                    "<ul class='dropdown-menu'>" +
		                        "<li><a class='dropdown-item' href='#'>Recargar Saldo</a></li>" +
		                        "<li><a class='dropdown-item' href='#'>Otra Opción</a></li>" +
		                        "<li><hr class='dropdown-divider'></li>" +
		                        "<li><a class='dropdown-item' href='#'>Algo más</a></li>" +
		                    "</ul>" +
		                "</div>" +
		            "</td>" +
		            "<td>" + response.dueno + "</td>" +
		            "<td>" + response.saldo + "</td>" +
		            "</tr>");
	            
	            new DataTable('#tblCuenta');
	            }
	        });
	    });
		//
	});
	</script>
</html>