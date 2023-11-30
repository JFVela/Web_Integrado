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

	@Override
	public int deleteByEventId(int cod) {
		  int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para eliminar inscripciones por ID de evento
		        String sql = "DELETE FROM inscripcion WHERE eventos_id_evento = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetros
		        ps.setInt(1, cod);

		        // 5. Ejecutar ps
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
	public int deleteByEspecialidad(int especialidadID) {
		 int result = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        con = new MySqlConectar().getConectar();
		        // Deshabilitar el autocommit para iniciar una transacción
		        con.setAutoCommit(false);

		        // Eliminar las inscripciones relacionadas con la especialidad
		        String sql = "DELETE FROM inscripcion WHERE voluntario_dni IN (SELECT dni FROM voluntario WHERE id_Especialidades = ?)";
		        ps = con.prepareStatement(sql);
		        ps.setInt(1, especialidadID);
		        result = ps.executeUpdate();

		        // Confirmar la transacción
		        con.commit();
		    } catch (Exception e) {
		        e.printStackTrace();
		        try {
		            if (con != null) {
		                // Si hay una excepción, hacer un rollback
		                con.rollback();
		            }
		        } catch (SQLException e2) {
		            e2.printStackTrace();
		        }
		    } finally {
		        try {
		            if (ps != null)
		                ps.close();
		            if (con != null) {
		                // Restablecer el autocommit
		                con.setAutoCommit(true);
		                con.close();
		            }
		        } catch (SQLException e2) {
		            e2.printStackTrace();
		        }
		    }

		    return result;
	}
	
}
