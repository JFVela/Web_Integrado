<jsp:include page="intranet.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN | Voluntarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/table.css">
<style >
@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,800,800italic,Inter");

body {

  height:95vh;
  align-items: center;
   background: linear-gradient(to bottom, #d4d4d4bd,#dedada5e, #ffffff, #ffffff);
  font-family: 'Inter';
     	cursor: url(assets/img/arrow.png) 6 0, auto !important;
}

</style>

</head>
<body>
<div class="container">
  <h1 class="mt-5 text-center">Voluntarios</h1>
    <hr class="my-4 pb-2">
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
     <div class="modal-header">
                <h5 class="modal-title form-head text-bold fs-4">Actualizar voluntario</h5>
                
            </div>
            <div class="modal-body">
                
                <form id="contact-form" method="post" action="ServletVoluntario?accion=guardar">
                   <div class="form-group">
                        <label for="dni" class="label-form text-secondary">DNI</label>
                        <input type="text" name="dni" class="form-control dni-label" id="dni" required>
                        
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="label-form text-secondary">Nombre</label>
                        <input type="text" class="form-control name-label" name="nombre" id="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="label-form text-secondary">Apellido Paterno</label>
                        <input type="text" name="paterno" class="form-control paterno-label" id="paterno" required>
                    </div>
                    <div class="form-group">
                        <label for="email" class="label-form text-secondary">E-mail</label>
                        <input type="email" name="email" class="form-control email-label" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono" class="label-form text-secondary">Télefono</label>
                        <input type="text" name="telefono" class="form-control telefono-label" id="telefono" required>
                    </div>
                    <div class="form-group">
						<label for="eventos" class="form-label text-secondary">Eventos</label>
						<select class="form-select"  name="evento" id="id-evento" >
							<option value=" ">[Seleccione evento]</option>
						</select>
					</div>	
                    <div class="form-group">
                        <label for="especialidad" class="label-form text-secondary">Especialidad</label>
                        <select class="form-select" name="especialidad"  id="id-especialidad">
                        	<option value=" ">[Seleccione tipo de voluntariado]</option>
                        </select>	
                    </div>
                   <div class="form-group">
					    <label for="ciudad" class="label-form text-secondary">Ciudad</label>
					    <select name="ciudad" class="form-control ciudad-label" id="ciudad" required>
					      	<option value=" ">[Seleccione una ciudad]</option>
					    </select>
					    
					</div>
					<div class="form-group">
					    <label for="provincia" class="label-form text-secondary">Provincia</label>
					    <select name="provincia" class="form-control provincia-label" id="provincia" required>
							<option value=" ">[Seleccione una provincia]</option>
					    </select>
					</div>
					<div class="form-group">
					    <label for="distrito" class="label-form text-secondary">Distrito</label>
					    <select name="distrito" class="form-control distrito-label" id="distrito" required>
                        	<option value=" ">[Seleccione un distrito]</option>
					    </select>
					</div>
                   
                   <div class="modal-footer">
			             <button type="submit" class="btn btn-primary">Grabar</button>
			             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>
      				</div>
                </form>
            </div>
    </div>
  </div>
</div>
  <div class="mt-3">
  <table id="TableVoluntario" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>DNI</th>
                <th>Nombres</th>
                <th>Correo</th>
                <th>Telefono</th>
                <th>Ciudad</th>
                <th>Provincia</th>
				<th>Distrito</th>
				<th>Especialidad</th>
				<th>Evento</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
          <!-- 
        	<c:forEach items="${requestScope.docentes}" var="row">
	            <tr>
	                <td>${row.codigo}</td>
	                <td>${row.nombre}</td>
	                <td>${row.paterno}</td>
	                <td>${row.materno}</td>
	                <td>${row.sexo}</td>
	                <td>${row.hijos}</td>
	                <td>${row.sueldo}</td>
	                <td><button type="button" class="btn btn-success btn-editar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button></td>
	                <td><button type="button" class="btn btn-danger btn-eliminar">Eliminar</button></td>
	            </tr>
            </c:forEach>
             -->
        </tbody>
    </table>
  </div>
  
</div>


</body>

<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- libreria JS de bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- libreria JS de la tabla -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- libreria para validar (bootstrap validator) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>


<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
			toastr.error("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session"/>

	<script>
	
		
		//invocar funciones de carga
		cargarVoluntarios()
		
	
		//crear función para leer JSON de docentes
		function cargarVoluntarios(){
			$.get("ServletVoluntarioJSON",function(response){	
                let botonEliminar="<button type='button' class='btn btn-rounded-el btn-eliminar'>Eliminar</button>";
				$.each(response,function(index,item){
					//llenar tabla
					$("#TableVoluntario").append("<tr><td>"+item.dni+"</td>"+
						 "<td>"+item.nombre+" "+item.paterno+"</td>"+
						 "<td>"+item.email+"</td>"+"<td>"+item.telefono+"</td>"+
						 "<td>"+item.ciudad+"</td>"+"<td>"+item.provincia+"</td>"+
						 "<td>"+item.distrito+"</td>"+"<td>"+item.EspecialidadNombre+"</td>"+
						 "<td>"+item.eventoNombre+"</td>"+"<td>"+botonEliminar+"</td></tr>");
				})
				$(document).ready(function() {
				    $('#TableVoluntario').DataTable({
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
			var dni;
			var nom;
			dni=$(this).parents("tr").find("td")[0].innerHTML;
			nom=$(this).parents("tr").find("td")[1].innerHTML;
			Swal.fire({
				  title: '¿Seguro de eliminar?',
				  text: "Voluntario " + nom +  " con DNI: "+dni,
				  showCancelButton: true,
				  confirmButtonColor: '#351ED9',
				  cancelButtonColor: '#DC4544',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/GitHub_ONG/ServletVoluntario?accion=eliminar&dni="+dni;
				  }
				})			
		})
		
		//asignar evento click al botón con ID "btn-cerrar"
		$(document).on("click","#btn-cerrar",function(){
			//resetear formulario
			$("#contact-form").trigger("reset");
			//resetar validación
			$("#contact-form").data("bootstrapValidator").resetForm(true);
			//
			$("#dni").val("0");
		})
		
		
		
	</script>

</html>