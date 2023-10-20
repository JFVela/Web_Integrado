<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.navbar-toggler {
  background-color: #007bff;
  border-color: rgba(255, 0, 0, 0.85);
}
a{
	font-weight:bold!important;
	margin-right: 50px;
}
</style>
</head>
<body>



<nav class="navbar navbar-expand-lg bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    	data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <h3 class="text-white">SERPRODAT</h3>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 30px;">
        <c:forEach items="${sessionScope.listaEnlaces}" var="row">
	        <li class="nav-item">
	          <a class="nav-link text-white" href="${row.ruta}">${row.descripcion}</a>
	        </li>
        </c:forEach>
        
      </ul>
      <div class="flex" style="width:200px!important;padding-top: 10px;font-weight:bold ">
      	<p class="text-white">Usuario: ${sessionScope.datosUsuario}</p>
      </div>
      
      <form class="d-flex" method="post" action="ServletUsuario?tipo=CERRAR">
        <button class="btn btn-outline-danger" type="submit">Cerrar Sesión</button>
      </form>
    </div>
  </div>
</nav>




	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

