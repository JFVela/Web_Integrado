<jsp:include page="intranet.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Donantes</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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
		<h1 class="mt-5 text-center">Listado de Donantes</h1>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" 
		aria-hidden="true" data-bs-backdrop="static"
		data-bs-keyboard="false" aria-labelledby="staticBackdropLabel" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Donante</h1>
      </div>
      <div class="modal-body">
        
      <form id="formDonante" method="post" action="ServletDonante?accion=insertarModal">
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">DNI</label>
		    <input type="text" class="form-control" name="dni" id="id-dni" readonly>
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail1" class="form-label">Nombre</label>
		    <input type="text" class="form-control" name="nombre" id="id-nombre">
		  </div>
  
		  <div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Paterno</label>
		    <input type="text" class="form-control" name="paterno" id="id-paterno">
		  </div>
  
		  <div class="form-group">
		    <label for="exampleInputPassword1" class="form-label">Materno</label>
		    <input type="text" class="form-control" name="materno" id="id-materno">
		  </div>
  
	    <div class="form-group">
	    <label for="exampleInputPassword1" class="form-label">Celular</label>
	    <input type="text" class="form-control" name="celular" id="id-celular">
	  	</div>
  
    <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Correo Electrónico</label>
    <input type="text" class="form-control" name="email" id="id-email">
  </div>
  
    <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Ciudad</label>
    <input type="text" class="form-control" name="ciudad" id="id-ciudad">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Dirección</label>
    <input type="text" class="form-control" name="direccion" id="id-direccion">
  </div>
  
		<div class="modal-footer">
              <button type="submit" class="btn btn-primary">Grabar</button>
             <button type="button" class="btn btn-secondary boton-cerrar" data-bs-dismiss="modal">Cerrar</button>
      	</div>

	</form>  
        
      </div>
      
    </div>
  </div>
</div>
		<%--Tabla --%>
		<div class="mt-5">
		  <table id="tablaDonante" class="table table-striped" style="width:100%">
	        <thead>
	            <tr>
	                <th>DNI</th>
	                <th>Nombre</th>
	                <th>Paterno</th>
	                <th>Materno</th>
	                <th>Correo Electronico</th>
	                <th>Celular</th>
	                <th>Ciudad</th>
	                <th>Dirección</th>
	                <th></th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	           <%-- 
	           <c:forEach items="${requestScope.donantes}" var="row">
	            <tr>
	                <td>${row.dni}</td>
	                <td>${row.nombre}</td>
	                <td>${row.paterno}</td>
	                <td>${row.materno}</td>
	                <td>${row.email}</td>
	                <td>${row.celular}</td>
	                <td>${row.ciudad}</td>
	                <td>${row.direccion}</td>
	                <td><button type="button" class="btn btn-success btn-edit" data-bs-toggle="modal" data-bs-target="#exampleModal"  data-operacion="actualizar">Editar</button></td>
	                <td><button type="button" class="btn btn-danger btn-deleted">Eliminar</button></td>
	            </tr>
	            </c:forEach>
	            --%>
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


<!-- validar si existe el atrubuto MENSAJE -->
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
cargarDonantes();
function cargarDonantes(){
	$.get("ServletDonanteJSON",function(response){	
		let botonEditar="<button type='button' class='btn btn-success btn-edit' data-bs-toggle='modal' data-bs-target='#exampleModal'  data-operacion='actualizar'>Editar</button>";
        let botonEliminar="<button type='button' class='btn btn-danger btn-deleted'>Eliminar</button>";
		$.each(response,function(index,item){
			//llenar tabla
			$("#tablaDonante").append("<tr><td>"+item.dni+"</td>"+
				 "<td>"+item.nombre+"</td>"+"<td>"+item.paterno+"</td>"+
				 "<td>"+item.materno+"</td>"+"<td>"+item.email+"</td>"+
				 "<td>"+item.celular+"</td>"+"<td>"+item.ciudad+"</td>"+"<td>"+item.direccion+"</td>"+
				 "<td>"+botonEditar+"</td><td>"+botonEliminar+"</td></tr>");
		})
		new DataTable('#tablaDonante');
	})
}

$(document).on("click",".boton-cerrar",function(){

	$("#formDonante").trigger("reset");
	$("#formDonante").data("bootstrapValidator").resetForm(true);
})

	$(document).on("click",".btn-edit",function(){
		var dni;
		dni=$(this).parents("tr").find("td")[0].innerHTML;
		
		var operacion = $(this).data("operacion");		 
		$.get("ServletFindDonanteJSON?dni="+dni,function(response){
			$("#id-dni").val(response.dni);
			$("#id-nombre").val(response.nombre);
			$("#id-paterno").val(response.paterno);
			$("#id-materno").val(response.materno);
			$("#id-celular").val(response.celular);
			$("#id-email").val(response.email);
			$("#id-ciudad").val(response.ciudad);
			$("#id-direccion").val(response.direccion);
		})
		if (operacion === "actualizar") {
		        // Configurar el modal para la actualización
		        $("#exampleModal .modal-title").text("Editar Donante");
		        $("#formDonante").attr("action", "ServletDonante?accion=actualizar&dniAntiguo="+dni);
		        $("#id-dni-antiguo").val(dni);
   
		 }
	})
	$(document).on("click",".btn-deleted",function(){
		var dni;
		dni=$(this).parents("tr").find("td")[0].innerHTML;
		// Definir la función verificarDonacion fuera del controlador de clic
		function verificarDonacion(dni) {
		    $.ajax({
		        type: "POST",
		        url: "ServletVerificarDonacion",
		        data: { dni: dni },
		        success: function(response) {
		            if (response === "false") {
		                Swal.fire({
		                    title: 'Seguro de Eliminar?',
		                    text: "Donante con DNI: " + dni + " tiene donaciones asociadas.",
		                    icon: 'error',
		                    showCancelButton: true,
		                    confirmButtonColor: '#3085d6',
		                    cancelButtonColor: '#d33',
		                    confirmButtonText: 'Aceptar',
		                    cancelButtonText: 'Cancelar'
		                }).then((result) => {
		  				  if (result.isConfirmed) {
		  				    window.location="http://localhost:8080/GitHub_ONG/ServletDonante?accion=eliminar&dato=" + dni;
		  				  }
		  				})	
		            } else {
		                Swal.fire({
		                    title: 'No se puede realizar la eliminación',
		                    text: 'La donación no se puede eliminar',
		                    icon: 'warning',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: 'Aceptar'
		                });
		            }
		        },
		        error: function() {
		            Swal.fire({
		                title: 'Error de servidor',
		                text: 'No se pudo verificar la donación',
		                icon: 'error',
		                confirmButtonColor: '#3085d6',
		                confirmButtonText: 'Aceptar'
		            });
		        }
		    });
		}

		$(document).on("click", ".btn-deleted", function() {
		    var dni;
		    dni = $(this).parents("tr").find("td")[0].innerHTML;

		    // Llamar la función verificarDonacion con el valor de dni
		    verificarDonacion(dni);
		});


		})

</script>
<script>    
	    $(document).ready(function(){     
	        $('#formDonante').bootstrapValidator({      
	        	 fields:{
	        		 dni:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				}
		        			} 
	        		 },
	        		 nombre:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 paterno:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			} 
	        		 },
	        		 materno:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 celular:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},
		        		        stringLength: {
		        		            min: 9,
		        		            max: 9,
		        		            message: 'El número de celular debe tener exactamente 9 dígitos'
		        		        },
		        		        regexp: {
		        		            regexp: /^9[0-9]{8}$/, // Comienza con 9 seguido de 8 dígitos
		        		            message: 'El número de celular debe comenzar con el primer dígito "9" y contener 9 dígitos en total'
		        		        },
		        		        callback: {
		        		            message: 'El número de celular no puede ser negativo',
		        		            callback: function(value, validator, $field) {
		        		                // Convierte el valor a un número entero
		        		                var celular = parseInt(value, 10);
		        		                // Comprueba si el valor es negativo
		        		                if (celular < 0) {
		        		                    return false;
		        		                }
		        		                return true;
		        		            }
		        		        }
		        			} 
	        		 },
	        		 email:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},
		        				emailAddress: {
		        		            message: 'El campo email debe contener una dirección de correo electrónico válida'
		        		        }
		        			}
	        		 },
	        		 ciudad:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				},regexp:{
		        					regexp:/^[a-zA-Z\s\ñ\Ñ\á\é\í\ó\ú\Á\É\Í\Ó\Ú\.]{2,20}$/,
		        					 message: 'Campo nombre valores errores(letras,espacios,vocales con tilde y.)'
		        				}
		        			}
	        		 },
	        		 direccion:{
	        			 validators:{
		        				notEmpty:{
		        					message:'Este campo es obligatorio'
		        				}
		        			} 
	        		 }
	        	 }	        	 
	        });   
				
	    });
	    
	</script>
</html>