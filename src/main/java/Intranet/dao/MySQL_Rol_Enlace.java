package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Intranet.entidad.Detalle_Rol_Enlace;
import Intranet.entidad.Rol_Enlace;
import Intranet.interfaces.interfazRol_Enlace;
import ong.utils.MySqlConectar;

public class MySQL_Rol_Enlace implements interfazRol_Enlace {

	@Override
	public List<Rol_Enlace> findAll() {
		List<Rol_Enlace> lista = new ArrayList<Rol_Enlace>();
		Rol_Enlace asignar;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "SELECT r.id_rol, r.nombre, e.id_enlace , e.descripcion \r\n" + "FROM roles_has_enlace re\r\n"
					+ "INNER JOIN roles r ON re.roles_id_rol = r.id_rol\r\n"
					+ "INNER JOIN enlace e ON re.enlace_id_enlace = e.id_enlace";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				asignar = new Rol_Enlace();
				asignar.setID_rol(rs.getInt(1));
				asignar.setNombre_Rol(rs.getString(2));
				asignar.setID_Enlace(rs.getInt(3));
				asignar.setNombre_Enlace(rs.getString(4));
				lista.add(asignar);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

	@Override
	public int saveRol_Enlace(Rol_Enlace bean, List<Detalle_Rol_Enlace> lista) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstmListar = null;

		try {
			cn = new MySqlConectar().getConectar();
			cn.setAutoCommit(false);
			String sql = "insert into roles_has_enlace (IDrol, IDEnlace) values (?, ?)";

			// Preparar la sentencia fuera del bucle
			pstmListar = cn.prepareStatement(sql);

			for (Detalle_Rol_Enlace det : lista) {
				pstmListar.setInt(1, det.getIDrol());
				pstmListar.setInt(2, det.getIDEnlace());
				salida += pstmListar.executeUpdate();
			}

			cn.commit();
		} catch (Exception e) {
			salida = -1;
			try {
				if (cn != null) {
					cn.rollback();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				// Cerrar recursos
				if (pstmListar != null) {
					pstmListar.close();
				}
				if (cn != null) {
					cn.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

}
