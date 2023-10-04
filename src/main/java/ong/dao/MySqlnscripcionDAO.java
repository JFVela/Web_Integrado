package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import ong.entity.Inscripcion;
import ong.interfaces.InscripcionDAO;
import ong.utils.MySqlConectar;

public class MySqlnscripcionDAO implements InscripcionDAO{

	@Override
	public int save(Inscripcion bean) {
		int salida = -1;
		Connection con = null;
		PreparedStatement ps = null;

			try {
			// 1. Obtener Conexion
			con = new MySqlConectar().getConectar();
			// 2. sentencia SQL
			String sql = "INSERT INTO inscripcion (voluntario_dni, eventos_id_evento) VALUES(?,?)";
			// 3. Crear objeto "ps"y enviar la variable "sql"
			ps = con.prepareStatement(sql);
			// 4. parametros
			ps.setInt(1, bean.getVoluntario_dni());
			ps.setInt(2, bean.getEventos_id_evento());
						
			// 5. Ejecutar ps
			// si la sentencia INSERT se ejecuta correctamente el metodo executeupdate
			// retorna 1
			salida = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}

		return salida;
	}

	@Override
	public int update(Inscripcion bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteById(int cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Inscripcion findById(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Inscripcion> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
