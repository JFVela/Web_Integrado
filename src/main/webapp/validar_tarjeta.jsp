<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
   // Obtener los datos enviados desde el formulario
   int numeroCuenta = Integer.parseInt(request.getParameter("numeroCuenta"));
   int cvc = Integer.parseInt(request.getParameter("cvc"));
   int mes = Integer.parseInt(request.getParameter("mes"));
   int ano = Integer.parseInt(request.getParameter("ano"));
   double montoDonacion = Double.parseDouble(request.getParameter("montoDonacion"));

   // Verificar si el monto de donación está dentro del rango válido
   if (montoDonacion >= 10.0 && montoDonacion <= 100.0) {
       // El monto de donación está dentro del rango válido
       // Simular una conexión a la base de datos (en la práctica, debe ser segura)
       String dbUrl = "jdbc:mysql://localhost:3306/ong_web";
       String dbUser = "root";
       String dbPass = "";

       Connection conn = null;
       PreparedStatement stmt = null;

       try {
           Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

           // Consulta SQL para buscar una tarjeta que coincida con los datos ingresados
           String sql = "SELECT saldo_actual FROM cuenta WHERE numero = ? AND cvc = ? AND mes = ? AND año = ?";
           stmt = conn.prepareStatement(sql);
           stmt.setInt(1, numeroCuenta);
           stmt.setInt(2, cvc);
           stmt.setInt(3, mes);
           stmt.setInt(4, ano);

           ResultSet rs = stmt.executeQuery();

           if (rs.next()) {
               // Tarjeta válida
               double saldoActual = rs.getDouble("saldo_actual");
               if (montoDonacion <= saldoActual) {
                   // El monto de donación es válido y no excede el saldo
                   // Realiza la donación aquí y actualiza el saldo en la base de datos

                   // Calcula el nuevo saldo
                   double nuevoSaldo = saldoActual - montoDonacion;

                   // Actualiza el saldo en la base de datos
                   String actualizarSaldoSql = "UPDATE cuenta SET saldo_actual = ? WHERE numero = ?";
                   PreparedStatement actualizarSaldoStmt = conn.prepareStatement(actualizarSaldoSql);
                   actualizarSaldoStmt.setDouble(1, nuevoSaldo);
                   actualizarSaldoStmt.setInt(2, numeroCuenta);
                   actualizarSaldoStmt.executeUpdate();

                   // Mostrar un mensaje de confirmación
                   out.println("Donación exitosa. Nuevo saldo: " + nuevoSaldo);
               } else {
                   // El monto de donación excede el saldo actual
                   out.println("El monto de donación excede el saldo actual.");
               }
           } else {
               // Tarjeta inválida
               out.println("Tarjeta inválida. Verifica los datos.");
           }
       } catch (Exception e) {
           e.printStackTrace();
           out.println("Error en la validación.");
       } finally {
           try {
               if (stmt != null) stmt.close();
               if (conn != null) conn.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
   } else {
       // El monto de donación no está dentro del rango válido
       out.println("El monto de donación debe estar entre $10 y $100.");
   }
%>
