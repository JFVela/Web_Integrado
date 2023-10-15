<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Locacion</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">
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
		<h1 class="mt-5 text-center">Listado de Locaciones</h1>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Nuevo Donante</button>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Locaciones</h1>
      </div>
      <div class="modal-body">
        
      <form id="formLocacion" method="post" action="ServletLocacion?accion=insertar">
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">ID</label>
		    <input type="text" class="form-control" name="id" id="id-id" value="0" readonly>
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre</label>
		    <input type="text" class="form-control" name="nombre" id="id-nombre">
		  </div>
		<div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Dirección</label>
		    <input type="text" class="form-control" name="direccion" id="id-direccion">
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
		<%--Tabla --%>
		<div class="mt-5">
		  <table id="tablaLocacion" class="table table-striped" style="width:100%">
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>Nombre</th>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<!-- libreria JS de la tabla -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
			toastr.success("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	
	</script>
</c:if>
<c:remove var="MENSAJE" scope="session"/>
<script>
cargarLocacion();
function cargarLocacion(){
	$.get("ServletLocacionJSON",function(response){	
		let botonEditar="<button type='button' class='btn btn-success btn-edit' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
        let botonEliminar="<button type='button' class='btn btn-danger btn-deleted'>Eliminar</button>";
		$.each(response,function(index,item){
			//llenar tabla
			$("#tablaLocacion").append("<tr><td>"+item.id+"</td>"+
				 "<td>"+item.nombre+"</td>"+"<td>"+item.direccion+"</td>"+
				 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
		})
		new DataTable('#tablaLocacion');
	})
}

	$(document).on("click",".btn-edit",function(){
		var id;
		id=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletFindLocacionJSON?id="+id,function(response){
			$("#id-id").val(response.id);
			$("#id-nombre").val(response.nombre);
			$("#id-direccion").val(response.direccion);
		})
	})
	$(document).on("click",".btn-deleted",function(){
		var id;
		id=$(this).parents("tr").find("td")[0].innerHTML;
			Swal.fire({
				  title: 'Seguro de Eliminar?',
				  text: "Locacion con ID: "+id,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/GitHub_ONG/ServletLocacion?accion=eliminar&dato="+id;
				  }
				})
		})
	$(document).on("click","#btn-cerrar",function(){
		$("#formLocacion").trigger("reset");
		$("#formLocacion").data("bootstrapValidator").resetForm(true);
	})
</script>
<script>    
    $(document).ready(function(){     
        $('#formLocacion').bootstrapValidator({      
        	 fields:{
        		 id:{
     		 		validators:{
     		 			notEmpty:{
     		 				message:'Campo DNI es obligatorio'
     		 			}
     		 		}
     		 		}, 
     		 		nombre:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo DNI es obligatorio'
        		 			}
        		 		}
        		 	},
        		 	direccion:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo DNI es obligatorio'
        		 			}
        		 		}
        		 	}
        	 }
        });   
			
    });    
</script>  
</html>