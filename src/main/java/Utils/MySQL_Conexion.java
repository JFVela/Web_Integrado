package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQL_Conexion {
	public static Connection getConnection() {
		Connection cn = null;
		try {
			String url, user, pass;
			// driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/ong_web?serverTimezone=UTC";
			user = "root";
			pass = "";
			cn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
}
