<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donación Física</title>
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
		<h1 class="mt-5 text-center">Listado de Donaciones Físicas</h1>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Nuevo Donante</button>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Donaciones Físicas</h1>
      </div>
      <div class="modal-body">
        
      <form id="formDonFisi" method="post" action="ServletDonacionFisico?accion=insertar">
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">ID</label>
		    <input type="text" class="form-control" name="id" id="id-id" value="0" readonly>
		  </div>
		 <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">DNI Donante</label>
		    <input type="text" class="form-control" name="dnidonante" id="id-dnidonante" >
		  </div>
		  
		  <div class="form-group">
						<label for="exampleInputEmail2" class="form-label">Lugar de Entrega</label> 
				<select class="form-select form-control"
						aria-label="Default select example" id="id-local" name="idlocal">
					<option value="" selected hidden="disable">Seleccione
							tipo de donación</option>
				</select>
		</div>
			
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Descripcion</label>
		    <input type="text" class="form-control" name="descripcion" id="id-descripcion">
		  </div>
		<div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Estado</label>
		    <input type="text" class="form-control" name="estado" id="id-estado">
		  </div>
  
		<div class="modal-footer">
              <button type="submit" class="btn btn-primary">Grabar</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btn-cerrar" >Cerrar</button>
      	</div>

	</form>  
        
      </div>
      
    </div>
  </div>
</div>
		<%--Tabla --%>
		<div class="mt-5">
		  <table id="tablaDonFisi" class="table table-striped" style="width:100%">
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>DNI Donantes</th>
	                <th>ID Local</th>
	                <th>Descripción</th>
	                <th>Estados</th>
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
CargarLocaciones();

function CargarLocaciones(){
	$.get("ServletLocacionJSON",function(response){
		$.each(response,function(index,item){
			$("#id-local").append("<option value='"+item.id+"'>"+item.nombre+"</option>");
		})
	})	
}
function cargarLocacion(){
	$.get("ServletDonacionFisicoJSON",function(response){	
		let botonEditar="<button type='button' class='btn btn-success btn-edit' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
        let botonEliminar="<button type='button' class='btn btn-danger btn-deleted'>Eliminar</button>";
		$.each(response,function(index,item){
			//llenar tabla
			$("#tablaDonFisi").append("<tr><td>"+item.idFisico+"</td>"+
				 "<td>"+item.dniDonantes+"</td>"+"<td>"+item.idLocal+"</td>"+
				 "<td>"+item.descripcion+"</td>"+"<td>"+item.estado+"</td>"+
				 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
		})
		new DataTable('#tablaDonFisi');
	})
}

	$(document).on("click",".btn-edit",function(){
		var id;
		id=$(this).parents("tr").find("td")[0].innerHTML;
		console.log(id);
		$.get("ServletFindDonacionFisicoJSON?id="+id,function(response){
			$("#id-id").val(response.idFisico);
			$("#id-dnidonante").val(response.dniDonantes);
			$("#id-local").val(response.idLocal);
			$("#id-descripcion").val(response.descripcion);
			$("#id-estado").val(response.estado);
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
				    window.location="http://localhost:8080/GitHub_ONG/ServletDonacionFisico?accion=eliminar&dato="+id;
				  }
				})
		})
	$(document).on("click","#btn-cerrar",function(){
		$("#formDonFisi").trigger("reset");
		$("#formDonFisi").data("bootstrapValidator").resetForm(true);
	})
</script>
<script>    
    $(document).ready(function(){     
        $('#formDonFisi').bootstrapValidator({      
        	 fields:{
          		 dnidonante:{
     		 		validators:{
     		 			notEmpty:{
     		 				message:'Campo DNI es obligatorio'
     		 			}
     		 		}
     		 		}, 
        		 	id:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo DNI es obligatorio'
        		 			}
        		 		}
        		 	},
        		 	idlocal:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo Local es obligatorio'
        		 			}
        		 		}
        		 	},descripcion:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo descripcion es obligatorio'
        		 			}
        		 		}
        		 	},estado:{
        		 		validators:{
        		 			notEmpty:{
        		 				message:'Campo estado es obligatorio'
        		 			}
        		 		}
        		 	}
        	 }
        });   
			
    });    
</script>  
</html>