<jsp:include page="intranet.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>TIPOS</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<!-- para eliminar -->
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">

<style>

body{
	font-family:verdana;
	font-size:12px;
}
.modal-header{
		color:#fff;
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

.bg-fondo{
	background-color: #990000;
}
</style>

</head>
<body>

<div class="container">


<div class="row mb-2">
			<div class="col-md-12 mt-5">
				<div class="card">
					<div class="card-header bg-fondo text-white">
						<h1 class="text-center">Donantes virtuales</h1>
					</div>
				</div>
			</div>
		</div>
<!-- Button trigger modal -->
<!--  <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Agregar
</button>-->
<div class="row">
<div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Monto Recaudado (DOLARES)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="total-dolares">
                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                Monto Recaudado (Euros)</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="total-euros">
                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Tipo De Donación</h1>
        
      </div>
      <div class="modal-body">
        <form id="frmTDonacion" method="post" action="ServletTDonacion?accion=grabar">
        
        <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Código</label>
		    <input type="text" class="form-control" name="codigo" id="id-codigo" value="0" readonly>
		  </div>
        
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre de Donación</label>
		    <input type="text" class="form-control" name="nombre" id="id-nombre">
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
	<table id="tblDonantesVirtuales" class="table table-striped table-bordered" style="width:100%">
		 <thead class="table-dark">
		   <tr>
		     <th>ID</th>
		     <th>DNI</th>
		     <th>Nombre Campaña</th>
             <th>Moneda</th>
             <th>Monto</th>
             <th>Dueño Tarjeta</th>
		   </tr>
		 </thead>
		 <tbody class="table-warning">
		 </tbody>
	</table>
	</div>
</div>






</body>

<!-- libreria principal de JQUERY -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- Libreria Jquery de boostrap y que funcione Modal-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- libreria JS de la tabla (buscador)-->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- Libreria para validar (boostrap validator) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.0/js/bootstrapValidator.js"></script>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- mesanje eliminar -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

<!-- validar si existe el atrubuto MENSAJE -->
<c:if test="${sessionScope.MENSAJE!=null}">
	<script>
			toastr.success("${sessionScope.MENSAJE}", toastr.options = {
					"timeOut": "2000",
					"positionClass " : " toast-top-right ",
				});
	</script>
</c:if>
<!-- eliminar atributo de tipo sesión MENSAJE -->
<c:remove var="MENSAJE" scope="session"/>

<!-- JSON para mostrar la tabla creo -->
<script>
	cargarDonantesVirtuales();
	
	//crear funcion para leer JSON de TDonacion
	/*function cargarDonantesVirtuales(){
		$.get("ServletDonacionVirtualJSON",function(response){
			console.log(response)
			//let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
            //let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
            $.each(response, function(index,item){
            	//llenar la tabla
            	$("#tblDonantesVirtuales").append("<tr><td>"+item.id+"</td>"+
						 "<td>"+item.dniDonante+"</td>"+"<td>"+item.idCampaña+"</td>"+
						 "<td>"+item.idMoneda+"</td>"+
						 "<td>"+item.monto+"</td>"+"<td>"+item.numCuenta+"</td>"+
						 "</td></tr>");
            });
            new DataTable('#tblDonantesVirtuales');
		})
	}*/
	function cargarDonantesVirtuales(){
		let totalDolares = 0;
	    let totalEuros = 0;
	    
		$.get("ServletApiDonacionVirtual?tipo=listaDonantesVirtuales",function(response){	
			//let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'><i class='bi bi-pencil'></i></button>";
	        //let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'><i class='bi bi-trash'></i></button>";
	        
	        $('#tblDonantesVirtuales tbody').empty();
	        $.each(response,function(index,item){
				$("#tblDonantesVirtuales").append("<tr><td>"+item.codigo+"</td>"+
						 "<td>"+item.donantesdni+"</td>"+"<td>"+item.campaña.nombre+"</td>"+
						 "<td>"+item.moneda.nombre+"</td>"+
						 "<td>"+item.monto+"</td>"+"<td>"+item.cuenta.dueño+"</td>"+
						 "</td></tr>");
				// Acumular el valor de monto según la moneda
	            if (item.moneda.nombre.toLowerCase() === 'dolar') {
	                totalDolares += parseFloat(item.monto);
	            } else if (item.moneda.nombre.toLowerCase() === 'euros') {
	                totalEuros += parseFloat(item.monto);
	            }
			});
	     // Imprimir los totales en consola
	        $('#total-dolares').text('$/'+totalDolares.toFixed(2));
        $('#total-euros').text('€/'+totalEuros.toFixed(2));
			new DataTable('#tblDonantesVirtuales');
			
		});
	}
	//sumar

	//fin sumar
	
	//asignamos eventos oneClick
	$(document).on("click",".btn-editar",function(){
		var cod;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletFindTDonacionJSON?codigo="+cod,function(response){
			
			$("#id-codigo").val(response.idtipo);
			$("#id-nombre").val(response.nombre);
			
		})
		
	})
	//Asignamos eventos a cerrar para reiniciar formulario
	$(document).on("click", "#btn-cerrar", function() {
    // Resetear formulario
    $("#frmTDonacion").trigger("reset");
    // Resetear Validación
    $("#frmTDonacion").data("bootstrapValidator").resetForm(true);
    // Restablecer el valor del campo "codigo" a 0
    $("#id-codigo").val("0");
})
	
	//asignar evento click a todos los botones con nombre de clase btn-eliminar
	$(document).on("click",".btn-eliminar",function(){
			var cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			Swal.fire({
				  title: '¿Seguro de eliminar?',
				  text: "Donacion con ID: "+cod,
				  icon: 'error',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Aceptar',
				  cancelButtonText: 'Cancelar'
				}).then((result) => {
				  if (result.isConfirmed) {
				    window.location="http://localhost:8080/zurita/ServletTDonacion?accion=eliminar&codigo="+cod;
				  }
				})
				
		})


</script>



<script>    
    $(document).ready(function(){     
        $('#frmTDonacion').bootstrapValidator({      
        	 fields:{
        		 codigo:{
        			 validators:{
        				 notEmpty:{
        					 message: 'Campo codigo es obligatorio'
        				 }
        			 }
        		 },
        		 nombre:{
        			 validators:{
        				 notEmpty:{
        					 message: 'Campo nombre es obligatorio'
        				 },
        				 regexp:{
        					 regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,50}$/,
        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
        				 }
        			 }
        		 }
        	 }
        });   
			
    });    
</script>

</html>