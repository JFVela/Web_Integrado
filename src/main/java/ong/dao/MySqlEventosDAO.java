package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Eventos;
import ong.interfaces.EventosDAO;
import ong.utils.MySqlConectar;

public class MySqlEventosDAO implements EventosDAO{

	@Override
	public int save(Eventos bean) {
		int salida = -1;
		Connection con = null;
		PreparedStatement ps = null;

			try {
			// 1. Obtener Conexion
			con = new MySqlConectar().getConectar();
			// 2. sentencia SQL
			String sql = "INSERT INTO eventos (nombre) VALUES(?)";
			// 3. Crear objeto "ps"y enviar la variable "sql"
			ps = con.prepareStatement(sql);
			// 4. parametros
			ps.setString(1, bean.getNombre());
						
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
	public int update(Eventos bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteById(int cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Eventos findById(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Eventos> findAll() {
		List<Eventos> data= new ArrayList<Eventos>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
	        // 1. Obtener Conexion
	        con = new MySqlConectar().getConectar();
	     // 2. Sentencia SQL para obtener todos los registros
	        String sql = "SELECT * FROM eventos";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);

	        // 4. Ejecutar la consulta
	        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        while (rs.next()) {
	            // Crear un objeto Voluntario con los datos obtenidos de la consulta
	            Eventos eventos = new Eventos();
	            eventos.setId_evento(rs.getInt("id_evento"));
	            eventos.setNombre(rs.getString("nombre"));
	            eventos.setUbicacion(rs.getString("ubicacion"));
	            eventos.setInicio_inscripcion(rs.getDate("inicio_inscripcion"));
	            eventos.setFinal_inscripcion(rs.getDate("final_inscripcion"));
	            eventos.setEinicio(rs.getDate("inicio"));
	            eventos.setEfinal(rs.getDate("final"));
	            eventos.setDetalle(rs.getString("detalle"));
	            eventos.setVacantes(rs.getInt("vacantes"));;
	            
	            // Agregar el objeto data a la lista
	            data.add(eventos);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (ps != null)
	                ps.close();
	            if (con != null)
	                con.close();
	        } catch (SQLException e2) {
	            e2.printStackTrace();
	        }
	    }

	    return data;
	}

}
