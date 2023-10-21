<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* Cambia el color de fondo de los mensajes de error a rojo */
.has-error .help-block {
	color: red;
}
</style>
</head>
<body>
	<section class="vh-100" style="background-color: #9A616D;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img src="assets/img/imagenLogin.jpg" alt="login form"
									class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">

									<form id="FormularioInicioSesion" method="post"
										action="ServletEmpleados?accion=INICIAR">

										<div class="d-flex align-items-center mb-3 pb-1">
											<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
											<span class="h1 fw-bold mb-0">Logo</span>
										</div>

										<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Iniciar
											Sesión</h5>

										<div class="form-group">
											<label for="form2Example17">Usuario</label> <input
												type="text" id="form2Example17"
												class="form-control form-control-lg" name="login" required
												data-bv-field="login" />
										</div>
										<br>
										<div class="form-group">
											<label for="form2Example27">Contraseña</label> <input
												type="password" id="form2Example27"
												class="form-control form-control-lg" name="contrasena"
												required data-bv-field="contrasena" />
										</div>
										<br>
										<div class="pt-1 mb-4">
											<button class="btn btn-dark btn-lg btn-block" type="submit">Ingresar</button>
										</div>

										<a class="small text-muted" href="#!">Olvidaste tu
											contraseña?</a>
										<p class="mb-5 pb-lg-2" style="color: #393f81;">
											No estás registrado? <a href="#!" style="color: #393f81;">Regístrate
												aquí</a>
										</p>
										<a href="#!" class="small text-muted">Terms of use.</a> <a
											href="#!" class="small text-muted">Privacy policy</a>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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

	<script>
		$(document).ready(function() {
			$('#FormularioInicioSesion').bootstrapValidator({
				feedbackIcons : {
					valid : 'fa fa-check',
					invalid : 'fa fa-times',
					validating : 'fa fa-refresh'
				},
				fields : {
					login : {
						validators : {
							notEmpty : {
								message : 'El usuario es obligatorio'
							},
							stringLength : {
								min : 1,
								max : 10,
								message : 'No más de 10 caracteres'
							},
							regexp : {
								regexp : /^[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ]+$/,
								message : 'No se aceptan espacios'
							}
						}
					},
					contrasena : {
						validators : {
							notEmpty : {
								message : 'La contraseña es obligatoria'
							},
							stringLength : {
								min : 10,
								message : 'Complete la contraseña'
							},
							regexp : {
								regexp : /^[A-Za-z0-9ñÑáéíóúÁÉÍÓÚ\s]+$/,
								message : 'Solo se aceptan números y letras'
							}
						}
					}
				}
			}).on('success.form.bv', function(e) {
				// Prevent the form from submitting
				e.preventDefault();
			});
		});
	</script>
</body>
</html>
