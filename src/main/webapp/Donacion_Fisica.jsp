<jsp:include page="intranet.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donación Física</title>
<link rel="icon" href="assets/img/health-monitoring-svgrepo-com.svg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">
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
	.campo-desactivado {
    pointer-events: none;
    background-color: #f4f4f4;
	}

</style>
</head>
<body>
<div class="container">
		<h1 class="mt-5 p-3 text-center display-2"><strong>Listado de <span style="color: green;">Donaciones Físicas</span></strong></h1>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" 
		data-bs-target="#exampleModal">Nueva Donación</button>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" 
	aria-hidden="true" data-bs-backdrop="static"
		data-bs-keyboard="false" aria-labelledby="staticBackdropLabel">
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
						<label for="exampleInputEmail2" class="form-label">DNI Donantes</label> 
				<select class="form-select form-control" 
						aria-label="Default select example" name="dnidonante" id="id-dnidonante">
					<option value=""  readonly selected hidden="disable">Seleccione un DNI</option>
				</select>
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
		    <label for="id-descripcion" class="form-label">Descripcion</label>
		    <textarea class="form-control" placeholder="Donaré una caja llena de alimentos no perecederos, mantas y ropa abrigada para apoyar a las personas." 
		    name="descripcion" id="id-descripcion"></textarea>
		</div>

		  
		  
  		<div class="form-group">
						<label for="exampleInputEmail2" class="form-label">Estado</label> 
				<select class="form-select form-control"
						aria-label="Default select example" name="estado" id="id-estado">
					<option value="" selected hidden="disable">Seleccione el estado de la donación</option>
					<option value="false">No Entregado</option>
					<option value="true">Entregado</option>
				</select>
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
		  <table id="tablaDonFisi" class="table table-striped table-bordered" style="width:100%">
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>DNI Donantes</th>
	                <th>Sucursal</th>
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
	 		var tipoMensaje = "${sessionScope.TIPO_MENSAJE}";
			toastr[tipoMensaje]("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>


<c:remove var="MENSAJE" scope="session"/>

<script>
cargarDonacionesFisicas();
CargarLocaciones();
CargarDni();
function CargarLocaciones(){
	$.get("ServletLocacion?accion=listado",function(response){
		$.each(response,function(index,item){
			$("#id-local").append("<option value='"+item.id_local+"'>"+item.nombre+"</option>");
		})
	})	
}
function CargarDni(){
	$.get("ServletDonante?accion=listado",function(response){
		$.each(response,function(index,item){
			$("#id-dnidonante").append("<option value='"+item.dni+"'>"+item.dni+"</option>");
		})
	})	
}
function cargarDonacionesFisicas(){
	$.get("ServletDonacionFisico?accion=listado",function(response){	
		
		let botonEditar="<a class='btn-neon1 btn-edit'  data-bs-toggle='modal' data-bs-target='#exampleModal' data-operacion='actualizar' ><span id=span11></span><span id=span21></span><span id=span31></span><span id=span41></span>Editar</a>";
        let botonEliminar="<a class='btn-neon btn-deleted'><span id=span1></span> <span id=span2></span> <span id=span3></span><span id=span4></span>Eliminar</a>";
		
		$.each(response,function(index,item){
            let estadoTexto = item.estado === false ? "No entregado" : "Entregado";

			//llenar tabla
			$("#tablaDonFisi").append("<tr><td>"+item.id_fisica+"</td>"+
				 "<td>"+item.donan.dni+"</td>"+"<td>"+item.local_don.nombre+"</td>"+
				 "<td>"+item.descripcion+"</td>"+"<td>"+estadoTexto+"</td>"+
				 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
		})
		new DataTable('#tablaDonFisi');
	})
}

	$(document).on("click",".btn-edit",function(){
		$("#id-dnidonante").addClass("campo-desactivado");

		var id;
		id=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletDonacionFisico?accion=buscar&id="+id,function(response){
			$("#id-id").val(response.id_fisica);
			$("#id-dnidonante").val(response.donan.dni);
			$("#id-local").val(response.local_don.id_local);
			$("#id-descripcion").val(response.descripcion);
			$("#id-estado").val(response.estado ? "true" : "false");

		})
	})
	
	$(document).on("click", ".btn-deleted", function () {
    var id = parseInt($(this).parents("tr").find("td")[0].innerHTML);

    $.get("ServletDonacionFisico?accion=listado", function (response) {

        var item = response.find(function (element) {
            return element.id_fisica === id;
        });
        if (item.estado === false) {
        	Swal.fire({
                title: 'Seguro de Eliminar?',
                text: "Donación Física con ID: " + id,
                icon: 'error',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = "http://localhost:8080/GitHub_ONG/ServletDonacionFisico?accion=eliminar&dato=" + id;
                }
            });
        } else {
        	Swal.fire({
                title: 'No se puede eliminar',
                text: "Los aportes realizados no se pueden eliminar",
                icon: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
            })
        }
    });
});






	
	$(document).on("click","#btn-cerrar",function(){
		$("#formDonFisi").trigger("reset");
		$("#formDonFisi").data("bootstrapValidator").resetForm(true);
		$("#id-id").val("0");
		$("#id-dnidonante").removeClass("campo-desactivado");
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