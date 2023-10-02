<!DOCTYPE html>
<html>
<head>
<title>Formulario de Validación de Tarjeta</title>
</head>
<body>
	<h1>Validación de Tarjeta de Crédito</h1>
	<form action="validar_tarjeta.jsp" method="post">
		<label for="numeroCuenta">Número de Cuenta:</label> <input type="text"
			id="numeroCuenta" name="numeroCuenta" required><br> <label
			for="cvc">CVC:</label> <input type="text" id="cvc" name="cvc"
			required><br> <label for="mes">Mes de
			Expiración:</label> <input type="text" id="mes" name="mes" required><br>

		<label for="ano">Año de Expiración:</label> <input type="text"
			id="ano" name="ano" required><br> <input type="submit"
			value="Validar Tarjeta"> <label for="montoDonacion">Monto
			de Donación:</label> <input type="text" id="montoDonacion"
			name="montoDonacion" required><br> <input type="submit"
			value="Validar Tarjeta y Donar">
	</form>
</body>
</html>
