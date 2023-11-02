package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Asignar_Enlace;
import Intranet.interfaces.interfazAsignarEnlace;
import Utils.MySQL_Conexion;

public class MySQL_AsignarEnlace implements interfazAsignarEnlace {

	@Override
	public List<Asignar_Enlace> findAll() {
		List<Asignar_Enlace> lista = new ArrayList<Asignar_Enlace>();
		Asignar_Enlace asignar;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			// Obtener la conexión a la base de datos
			cn = new MySQL_Conexion().getConnection();
			// Consulta SQL para obtener los datos requeridos
			String sql = "SELECT r.id_rol, r.nombre, e.id_enlace , e.descripcion \r\n" + "FROM roles_has_enlace re\r\n"
					+ "INNER JOIN roles r ON re.roles_id_rol = r.id_rol\r\n"
					+ "INNER JOIN enlace e ON re.enlace_id_enlace = e.id_enlace";
			// Crear la declaración preparada
			pstm = cn.prepareStatement(sql);
			// Ejecutar la consulta
			rs = pstm.executeQuery();
			while (rs.next()) {
				asignar = new Asignar_Enlace();
				asignar.setRoles_id_rol(rs.getInt(1));
				asignar.setNombreRol(rs.getString(2));
				asignar.setEnlace_id_enlace(rs.getInt(3));
				asignar.setNombreEnlace(rs.getString(4));
				lista.add(asignar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Cerrar los recursos en un bloque finally
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lista;
	}
}
