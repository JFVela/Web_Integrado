<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ONG</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css" rel="stylesheet">
<style >
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
<body>
	<!-- contenido -->
	<div class="container">
  <h1 class="mt-5 text-center">Listado de Monedas</h1>
  
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" 
	data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">MONEDAS</h1>
      </div>
      <div class="modal-body">
        
      <form id="formMoneda" method="post" action="ServletDocente?accion=grabar">
	      	
	      	<div class="form-group">
			    <label for="exampleInputEmail1" class="form-label">Código</label>
			    <input type="text" class="form-control" name="codigo" id="id-codigo" value="0" readonly>
			  </div>
      
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre</label>
		    <input type="text" class="form-control" name="nombre" id="id-nombre">
		  </div>
  
		  <div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Valor</label>
		    <input type="text" class="form-control" name="valor" id="id-valor">
		  </div>
  
  		<div class="modal-footer">
             <button type="submit" class="btn btn-primary">Grabar</button>
             <button type="button" class="btn btn-secondary btn-cerrar" data-bs-dismiss="modal" id="btn-cerrar">Cerrar</button>
      	</div>

	</form>  
        
      </div>
      
    </div>
  </div>
</div>
  
  <div class="mt-3">
  <table id="TableMoneda" class="table table-striped" style="width:100%">
        <thead>
            <tr>
                <th>Id Moneda</th>
                <th>Nombre</th>
                <th>Valor</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>
  </div>
  
</div>
	<!-- fin contenido -->
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

<!-- funciones Script -->
<script>
	//invocamos funcion
	cargarMoneda();
	
	//Crear funcion para leer JSON Moneda
	function cargarMoneda(){
			$.get("ServletMonedaJSON",function(response){	
				console.log(response)
				let botonEditar= "<button type='button' class='btn btn-success btn-editar' data-bs-toggle='modal' data-bs-target='#exampleModal'>Editar</button>";
	            let botonEliminar= "<button type='button' class='btn btn-danger btn-eliminar'>Eliminar</button>";
				
				$.each(response,function(index,item){
					//llenar tabla
					$("#TableMoneda").append("<tr><td>"+item.id+"</td>"+
							"<td>"+item.nombre+"</td>"+"<td>"+item.valor+"</td>"+
							"<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
					
					
				});
				new DataTable('#TableMoneda');
			})
		};
		//asignar evento click a todos los botones con nombre de clase btn-editar
		$(document).on("click",".btn-editar",function(){
			var cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			$.get("ServletFindMonedaJSON?codigo="+cod, function(response){
				//console.log(response);
				//mostrar valores en las cajas
				$("#id-codigo").val(response.id);
				$("#id-nombre").val(response.nombre);
				$("#id-valor").val(response.valor);
			})
			
		});
		//reiniciar formulario con el boton cerrar
		$(document).on("click","#btn-cerrar",function(){
			//resetear formulario
			$("#formMoneda").trigger("reset");
			//resetar validación
			$("#formMoneda").data("bootstrapValidator").resetForm(true);
			//
			$("#id-codigo").val("0");
		})
			
</script>
</html>