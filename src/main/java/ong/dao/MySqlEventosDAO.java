package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		    // 1. Obtener Conexión
		    con = new MySqlConectar().getConectar();
		    // 2. Sentencia SQL
		    String sql = "INSERT INTO eventos (nombre, ubicacion, inicio_inscripcion, final_inscripcion, inicio, finalE, detalle, vacantes) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		    // 3. Crear objeto "ps" y enviar la variable "sql"
		    ps = con.prepareStatement(sql);
		    // 4. Parámetros
		    ps.setString(1, bean.getNombre());
		    ps.setString(2, bean.getUbicacion());
		    ps.setDate(3, new java.sql.Date(bean.getInicio_inscripcion().getTime())); // Asegúrate de que bean.getInicioInscripcion() sea de tipo Date.
		    ps.setDate(4, new java.sql.Date(bean.getFinal_inscripcion().getTime())); // Asegúrate de que bean.getFinalInscripcion() sea de tipo Date.
		    ps.setDate(5, new java.sql.Date(bean.getEinicio().getTime())); // Asegúrate de que bean.getInicio() sea de tipo Date.
		    ps.setDate(6, new java.sql.Date(bean.getEfinal().getTime())); // Asegúrate de que bean.getFinal() sea de tipo Date.
		    ps.setString(7, bean.getDetalle());
		    ps.setInt(8, bean.getVacantes());

		    // 5. Ejecutar ps
		    // Si la sentencia INSERT se ejecuta correctamente, el método executeUpdate retorna 1.
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
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para actualizar
		        String sql = "UPDATE eventos SET nombre = ?, ubicacion = ?, inicio_inscripcion = ?, final_inscripcion = ?, inicio = ?, finalE = ?, detalle = ?, vacantes = ? WHERE id_evento = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetros
		        ps.setString(1, bean.getNombre());
		        ps.setString(2, bean.getUbicacion());
		        ps.setDate(3, new java.sql.Date(bean.getInicio_inscripcion().getTime()));
		        ps.setDate(4, new java.sql.Date(bean.getFinal_inscripcion().getTime()));
		        ps.setDate(5, new java.sql.Date(bean.getEinicio().getTime()));
		        ps.setDate(6, new java.sql.Date(bean.getEfinal().getTime()));
		        ps.setString(7, bean.getDetalle());
		        ps.setInt(8, bean.getVacantes());
		        ps.setInt(9, bean.getId_evento()); // Asegúrate de que este método coincida con el nombre de la columna de identificación en tu base de datos.

		        // 5. Ejecutar ps
		        // Si la sentencia UPDATE se ejecuta correctamente, el método executeUpdate retorna 1.
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
	public int deleteById(int cod) {
		int salida = -1;
	    Connection con = null;
	    PreparedStatement ps = null;

	    try {
	        // 1. Obtener Conexión
	        con = new MySqlConectar().getConectar();
	        // 2. Sentencia SQL para eliminar
	        String sql = "DELETE FROM eventos WHERE id_evento = ?";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);
	        // 4. Parámetros
	        ps.setInt(1, cod);

	        // 5. Ejecutar ps
	        // Si la sentencia DELETE se ejecuta correctamente, el método executeUpdate retorna 1.
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
	public Eventos findById(int cod) {
		 Eventos evento = null;
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para buscar por ID
		        String sql = "SELECT * FROM eventos WHERE id_evento = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetros
		        ps.setInt(1, cod);

		        // 5. Ejecutar consulta
		        rs = ps.executeQuery();

		        if (rs.next()) {
		            evento = new Eventos();
		            // Configura los atributos del objeto Eventos desde la consulta
		          
		            // Formatear las fechas al formato yyyy-MM-dd
		            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            String inicioInscripcion = dateFormat.format(rs.getDate("inicio_inscripcion"));
		            String finalInscripcion = dateFormat.format(rs.getDate("final_inscripcion"));
		            String einicio = dateFormat.format(rs.getDate("inicio"));
		            String efinal = dateFormat.format(rs.getDate("finalE"));

		            evento.setInicio_inscripcionStr(inicioInscripcion);
		            evento.setFinal_inscripcionStr(finalInscripcion);
		            evento.setEinicioStr(einicio);
		            evento.setEfinalStr(efinal);     
		            evento.setId_evento(rs.getInt("id_evento"));
		            evento.setNombre(rs.getString("nombre"));
		            evento.setUbicacion(rs.getString("ubicacion"));
		            evento.setDetalle(rs.getString("detalle"));
		            evento.setVacantes(rs.getInt("vacantes"));
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

		    return evento;
	}

	@Override
	public List<Eventos> findAll() {
		List<Eventos> data= new ArrayList<Eventos>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			  // 1. Obtener la conexión
	        con = new MySqlConectar().getConectar();
	        // 2. Sentencia SQL para obtener todos los registros de eventos y contar inscripciones
	        String sql = "SELECT eventos.id_evento, eventos.nombre, eventos.ubicacion, eventos.inicio_inscripcion, eventos.final_inscripcion, eventos.inicio, eventos.finalE, eventos.detalle, eventos.vacantes, COUNT(inscripcion.id_inscripcion) AS inscritos " +
	                     "FROM eventos " +
	                     "LEFT JOIN inscripcion ON eventos.id_evento = inscripcion.eventos_id_evento " +
	                     "GROUP BY eventos.id_evento, eventos.nombre, eventos.ubicacion, eventos.inicio_inscripcion, eventos.final_inscripcion, eventos.inicio, eventos.finalE, eventos.detalle, eventos.vacantes";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);

	        // 4. Ejecutar la consulta
	        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        while (rs.next()) {
	            Eventos evento = new Eventos();
	            evento.setId_evento(rs.getInt("id_evento"));
	            evento.setNombre(rs.getString("nombre"));
	            evento.setUbicacion(rs.getString("ubicacion"));
	            evento.setInicio_inscripcion(rs.getDate("inicio_inscripcion"));
	            evento.setFinal_inscripcion(rs.getDate("final_inscripcion"));
	            evento.setEinicio(rs.getDate("inicio"));
	            evento.setEfinal(rs.getDate("finalE"));
	            evento.setDetalle(rs.getString("detalle"));
	            evento.setVacantes(rs.getInt("vacantes"));
	            evento.setInscritos(rs.getInt("inscritos"));

	            data.add(evento);
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
