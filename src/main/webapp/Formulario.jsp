<!DOCTYPE html>
<html>
<head>
<title>Formulario de Validaci�n de Tarjeta</title>
</head>
<body>
	<h1>Validaci�n de Tarjeta de Cr�dito</h1>
	<form action="validar_tarjeta.jsp" method="post">
		<label for="numeroCuenta">N�mero de Cuenta:</label> <input type="text"
			id="numeroCuenta" name="numeroCuenta" required><br> <label
			for="cvc">CVC:</label> <input type="text" id="cvc" name="cvc"
			required><br> <label for="mes">Mes de
			Expiraci�n:</label> <input type="text" id="mes" name="mes" required><br>

		<label for="ano">A�o de Expiraci�n:</label> <input type="text"
			id="ano" name="ano" required><br> <input type="submit"
			value="Validar Tarjeta"> <label for="montoDonacion">Monto
			de Donaci�n:</label> <input type="text" id="montoDonacion"
			name="montoDonacion" required><br> <input type="submit"
			value="Validar Tarjeta y Donar">
	</form>
</body>
</html>
