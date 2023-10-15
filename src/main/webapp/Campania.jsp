<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">

<title>Campañas</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<style>
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

<h1 class="mt-5 text-center">Campañas</h1>

<!-- Button trigger modal -->
<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Agregar
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Nueva Campaña</h1>
        
      </div>
      <div class="modal-body">
        <form id="frmCampania" method="POST" action="ServletCampania">
        
        <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">codigo</label>
		    <input type="text" class="form-control" name="codigo">
		  </div>
        
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre de Campaña</label>
		    <input type="text" class="form-control" name="nombre">
		  </div>
		  
		  <div class="form-group">
		  <label for="exampleFormControlTextarea1" class="form-label">Descripción</label>
		  <textarea class="form-control" id="descripcion" name="descripcion" rows="3"></textarea>
		  </div>
		  
		  
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
	        <button type="submit" class="btn btn-primary">Grabar</button>
	      </div>
		  
		</form>
      </div>
    </div>
  </div>
</div>

<table id="tablaCampana" class="table table-striped" style="width:100%">
  <thead>
    <tr>
      <th>CÓDIGO</th>
      <th>NOMBRE</th>
      <th>DESCRIPCIÓN</th>
    </tr>
  </thead>
  <tbody>
	    <tr>
	      <td>1</td>
		  <td>2</td>
		  <td>3</td>
	    </tr>
  </tbody>
</table>
</div>




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

<!-- Validar si existe el atributo MENSAJE -->
<c:if test="${requestScope.MENSAJE!=null}">
<script>
		toastr.success("${requestScope.MENSAJE}", toastr.options = {
				"timeOut": "2000",
				"positionClass " : " toast-top-right ",
			});

</script>
</c:if>

<script>
    $(document).ready(function() {
        $('#tablaCampana').DataTable();
    });
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
        					 regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,50}$/,
        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
        				 }
        			 }
        		 },
        		 descripcion:{
        			 validators:{
        				 notEmpty:{
        					 message: 'Campo descripción es obligatorio'
        				 }
        			 }
        		 }
        	 }
        });   
			
    });    
</script>


</body>
</html>