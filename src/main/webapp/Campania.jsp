
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Campañas</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- para mensajes de confirmacion -->
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- para eliminar -->
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
</style>

</style>

</head>
<body>

	<div class="container">

		<h1 class="mt-5 text-center">Campañas</h1>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-outline-primary"
			data-bs-toggle="modal" data-bs-target="#exampleModal">
			Agregar</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Nueva
							Campaña</h1>

					</div>
					<div class="modal-body">
						<form accept-charset="UTF-8" id="frmCampania" method="POST"
							action="ServletApiCampaña?tipo=grabar">

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">codigo</label>
								<input type="text" class="form-control" id="id-codigo"
									name="codigo" value="0" readonly>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Nombre
									de Campaña</label> <input type="text" class="form-control"
									id="id-nombre" name="nombre">
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1" class="form-label">Descripción</label>
								<textarea class="form-control" id="id-descripcion"
									name="descripcion" rows="3"></textarea>
							</div>


							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Grabar</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>

							</div>

						</form>
					</div>
				</div>
			</div>
		</div>

		<table id="tablaCampana" class="table table-striped table-bordered"
			style="width: 100%">
			<thead>
				<tr>
					<th>CÓDIGO</th>
					<th>NOMBRE</th>
					<th>DESCRIPCIÓN</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<!-- 
	    <tr>
	      <td>1</td>
		  <td>2</td>
		  <td>3</td>
	    </tr>
	     -->
			</tbody>
		</table>
	</div>



</body>


<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- Libreria Jquery de boostrap y que funcione Modal-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- libreria JS de la tabla (buscador)-->
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- Libreria para validar (boostrap validator) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- mesanje eliminar -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
			toastr.success("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MODIFICADO!=null}">
	<script>
			toastr.warning("${sessionScope.MODIFICADO}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.ERROR!=null}">
	<script>
			toastr.error("${sessionScope.ERROR}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session" />
<c:remove var="MODIFICADO" scope="session" />
<c:remove var="ERROR" scope="session" />
<script>
	cargarCampana();
    
	//crear funcion para leer JSON de TDonacion
	/*function cargarCampana(){
		$.get("ServletCampañaJSON",function(response){
			console.log(response)
			let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
            let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
            $.each(response, function(index,item){
            	//llenar la tabla
            	$("#tablaCampana").append("<tr><td>"+item.id+"</td>"+
						 "<td>"+item.nombre+"</td>"+
						 "<td>"+item.descripcion+"</td>"+
						 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
            });
            new DataTable('#tablaCampana');
		})
	}*/
	function cargarCampana(){
		$.get("ServletApiCampaña?tipo=listaCampana",function(response){	
			let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
	        let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
	        $("#tablaCampana").DataTable().destroy();
	        $.each(response,function(index,item){
				$("#tablaCampana").append("<tr><td>"+item.codigo+"</td>"+
					 "<td>"+item.nombre+"</td>"+"<td>"+item.descripcion+"</td>"+
					 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
			})
			new DataTable('#tablaCampana');
		})
	}
	//
	//asignamos eventos oneClick
	$(document).on("click",".btn-editar",function(){
		var cod;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletApiCampaña?tipo=buscar&codigo="+cod,function(response){
			
			$("#id-codigo").val(response.codigo);
			$("#id-nombre").val(response.nombre);
			$("#id-descripcion").val(response.descripcion);
			
		})
		
	})
	//
	//Asignamos eventos a cerrar para reiniciar formulario
	$(document).on("click", "#btn-cerrar", function() {
    	// Resetear formulario
    	$("#frmCampania").trigger("reset");
    	// Resetear Validación
    	$("#frmCampania").data("bootstrapValidator").resetForm(true);
    	// Restablecer el valor del campo "codigo" a 0
    	$("#id-codigo").val("0");
	})
	//
	//asignar evento click a todos los botones con nombre de clase btn-eliminar
	$(document).on("click",".btn-eliminar",function(){
			var cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			Swal.fire({
				  title: '¿Seguro de eliminar?',
				  text: "Campaña con ID: "+cod,
				  icon: 'error',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/GitHub_ONG/ServletApiCampaña?tipo=eliminar&codigo="+cod;
				  }
				})
				
		})
	
	
	
</script>

<script>    
    $(document).ready(function(){     
        $('#frmCampania').bootstrapValidator({      
        	 fields:{
        		 nombre:{
        			 validators:{
        				 notEmpty:{
        					 message: 'Campo nombre es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,45}$/,
        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
        				 }
        			 }
        		 },
        		 descripcion:{
        			 validators:{
        				 notEmpty:{
        					 message: 'Campo descripción es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.\,\:\;\""]{2,200}$/,
        					 message: 'Campo Descripcion valores errores(letras,espacios,vocales con tilde y.)'
        				 }
        			 }
        		 }
        	 }
        });   
			
    });    
</script>

</html>