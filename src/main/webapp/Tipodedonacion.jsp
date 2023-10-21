<jsp:include page="intranet.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<!-- hola papus esto es del proyecto -->
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
</style>

</head>
<body>

<div class="container">

<h1 class="mt-5 text-center" style="color: #008f39;">Tipos De Donaciones</h1>
<!-- Button trigger modal -->
<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Agregar
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Tipo De Donación</h1>
        
      </div>
      <div class="modal-body">
        <form id="frmTDonacion" method="post" action="ServletTipoDonacion?accion=grabar">
        
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
	<table id="tablaTdonacion" class="table table-striped table-bordered" style="width:100%">
		 <thead>
		   <tr>
		     <th>CÓDIGO</th>
		     <th>NOMBRE</th>
		     <th></th>
             <th></th>
		   </tr>
		 </thead>
		 <tbody>
		 	<!-- 	
		 	<c:forEach items="${requestScope.tipodonacion}" var="row">
			 <tr>
			    <td>${row.idtipo}</td>
				<td>${row.nombre}</td>
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
<c:remove var="MENSAJE" scope="session"/>
<c:remove var="MODIFICADO" scope="session"/>
<c:remove var="ERROR" scope="session"/>

<!-- JSON para mostrar la tabla creo -->
<script>
	cargarTDonacion();
	
	//crear funcion para leer JSON de TDonacion
	function cargarTDonacion(){
		$.get("ServletTipoDonacionJSON",function(response){
			console.log(response)
			let botonEditar="<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
            let botonEliminar="<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
            $.each(response, function(index,item){
            	//llenar la tabla
            	$("#tablaTdonacion").append("<tr><td>"+item.id+"</td>"+
						 "<td>"+item.nombre+"</td>"+
						 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
            });
            new DataTable('#tablaTdonacion');
		})
	}
	
	//asignamos eventos oneClick
	$(document).on("click",".btn-editar",function(){
		var cod;
		cod=$(this).parents("tr").find("td")[0].innerHTML;
		$.get("ServletFindTipoDonacionJSON?codigo="+cod,function(response){
			
			$("#id-codigo").val(response.id);
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
				    window.location="http://localhost:8080/GitHub_ONG/ServletTipoDonacion?accion=eliminar&codigo="+cod;
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
        					 regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.\,\:\;]{2,50}$/,
        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
        				 }
        			 }
        		 }
        	 }
        });   
			
    });    
</script>

</html>