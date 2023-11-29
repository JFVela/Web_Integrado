package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Inscripcion;
import ong.entity.Voluntario;
import ong.interfaces.VoluntarioDAO;
import ong.utils.MySqlConectar;

public class MySqlVoluntarioDAO implements VoluntarioDAO {
	
	

	@Override
	public int update(Voluntario bean) {
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexion
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para actualizar
		        String sql = "UPDATE voluntario SET nombre=?, paterno=?, materno=?, dni=?, correo=?, telefono=?, especialidad=?, ciudad=?, provincia=?, distrito=? WHERE idVoluntario=?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parametros
		        ps.setString(1, bean.getNombre());
		        ps.setString(2, bean.getPaterno());
		        ps.setString(3, bean.getMaterno());
		        ps.setInt(4, bean.getDni());
		        ps.setString(5, bean.getEmail());
		        ps.setInt(6, bean.getTelefono());
		        ps.setInt(7, bean.getId_Especialidades());
		        ps.setString(8, bean.getCiudad());
		        ps.setString(9, bean.getProvincia());
		        ps.setString(10, bean.getDistrito());

		        // 5. Ejecutar ps
		        // El método executeUpdate retorna el número de filas afectadas por la operación de actualización.
		        // Si todo está bien, debería retornar 1, lo que significa que una fila se actualizó.
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
	public int deleteById(int dni) {
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement psInscripcion = null;
		    PreparedStatement psVoluntario = null;

		    try {
		        con = new MySqlConectar().getConectar();
		        // Comenzar una transacción
		        con.setAutoCommit(false);

		        // 1. Borrar de la tabla 'inscripcion'
		        String sqlInscripcion = "DELETE FROM inscripcion WHERE voluntario_dni=?";
		        psInscripcion = con.prepareStatement(sqlInscripcion);
		        psInscripcion.setInt(1, dni);
		        salida = psInscripcion.executeUpdate();

		        if (salida == 1) {
		            // Si se borró correctamente de 'inscripcion', entonces borrar de 'voluntario'
		            String sqlVoluntario = "DELETE FROM voluntario WHERE dni=?";
		            psVoluntario = con.prepareStatement(sqlVoluntario);
		            psVoluntario.setInt(1, dni);
		            salida = psVoluntario.executeUpdate();
		        } else {
		            // Si no se borró de 'inscripcion', deshacer la transacción
		            con.rollback();
		        }

		        // Confirmar la transacción
		        con.commit();
		    } catch (Exception e) {
		        e.printStackTrace();
		        try {
		            // En caso de error, deshacer la transacción
		            con.rollback();
		        } catch (SQLException e2) {
		            e2.printStackTrace();
		        }
		    } finally {
		        try {
		            if (psInscripcion != null)
		                psInscripcion.close();
		            if (psVoluntario != null)
		                psVoluntario.close();
		            if (con != null) {
		                con.setAutoCommit(true); // Restaurar el modo de autocommit
		                con.close();
		            }
		        } catch (SQLException e2) {
		            e2.printStackTrace();
		        }
		    }

		    return salida;
		}

	@Override
	public Voluntario findById(int dni) {
		 Voluntario voluntario = null;
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;

		    try {
		        // 1. Obtener Conexion
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para buscar por ID
		        String sql = "SELECT * FROM voluntario WHERE dni=?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetro
		        ps.setInt(1, dni); // ID de la fila que deseas buscar

		        // 5. Ejecutar la consulta
		        rs = ps.executeQuery();
		        
		        // 6. Procesar el resultado
		        if (rs.next()) {
		            // Crear un objeto Voluntario con los datos obtenidos de la consulta
		            voluntario = new Voluntario();
		            voluntario.setNombre(rs.getString("nombre"));
		            voluntario.setPaterno(rs.getString("paterno"));
		            voluntario.setMaterno(rs.getString("materno"));
		            voluntario.setDni(rs.getInt("dni"));
		            voluntario.setEmail(rs.getString("correo"));
		            voluntario.setTelefono(rs.getInt("telefono"));
		            voluntario.setId_Especialidades(rs.getInt("id_Especialidades"));
		            voluntario.setCiudad(rs.getString("ciudad"));
		            voluntario.setProvincia(rs.getString("provincia"));
		            voluntario.setDistrito(rs.getString("distrito"));
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

		    return voluntario;
		
	}

	@Override
	public List<Voluntario> findAll() {
		 List<Voluntario> voluntarios = new ArrayList<>();
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;

		    try {
		        // 1. Obtener Conexion
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para obtener todos los registros
		        String sql = "SELECT v.*, i.eventos_id_evento, e.nombre AS especialidad_nombre, ev.nombre AS evento_nombre " +
	                     "FROM voluntario v " +
	                     "LEFT JOIN inscripcion i ON v.dni = i.voluntario_dni " +
	                     "LEFT JOIN especialidades e ON v.id_Especialidades = e.id_Especialidades " +
	                     "LEFT JOIN eventos ev ON i.eventos_id_evento = ev.id_evento";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
	
		        // 4. Ejecutar la consulta
		        rs = ps.executeQuery();
	
		        // 5. Procesar el resultado
		        while (rs.next()) {
		            // Crear un objeto Voluntario con los datos obtenidos de la consulta
		            Voluntario voluntario = new Voluntario();
		            voluntario.setDni(rs.getInt("dni"));
		            voluntario.setNombre(rs.getString("nombre"));
		            voluntario.setPaterno(rs.getString("paterno"));
		            voluntario.setMaterno(rs.getString("materno"));
		            voluntario.setEmail(rs.getString("correo"));
		            voluntario.setTelefono(rs.getInt("telefono"));
		            voluntario.setId_Especialidades(rs.getInt("id_Especialidades"));
		            voluntario.setEspecialidadNombre(rs.getString("especialidad_nombre"));
		            voluntario.setCiudad(rs.getString("ciudad"));
		            voluntario.setProvincia(rs.getString("provincia"));
		            voluntario.setDistrito(rs.getString("distrito"));
		            voluntario.setEventos_id_evento(rs.getInt("eventos_id_evento"));
		            voluntario.setEventoNombre(rs.getString("evento_nombre")); // Nuevo campo para el nombre del evento
		
		            // Agregar el objeto Voluntario a la lista
		            voluntarios.add(voluntario);
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

		    return voluntarios;
	}

	@Override
	public Voluntario findDNI(int cod) {
		 Voluntario voluntario = null;
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;

		    try {
		        // 1. Obtener Conexion
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para obtener el DNI por código 
		        String sql = "SELECT dni FROM voluntario WHERE dni = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        ps.setInt(1, cod); // Setea el parámetro con el ID del voluntario

		        // 4. Ejecutar la consulta
		        rs = ps.executeQuery();

		        // 5. Procesar el resultado
		        if (rs.next()) {
		            // Si hay un resultado, crea un objeto Voluntario y establece el DNI
		            voluntario = new Voluntario();
		            voluntario.setDni(rs.getInt("dni"));
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

		    return voluntario;
	}

	@Override
	public Voluntario findCorreo(String email) {
		Voluntario voluntario = null;
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        // 1. Obtener Conexion
	        con = new MySqlConectar().getConectar();
	        // 2. Sentencia SQL para obtener el correo por email 
	        String sql = "SELECT correo FROM voluntario WHERE correo = ?";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);
	        ps.setString(1, email); // Setea el parámetro con el email del voluntario

	        // 4. Ejecutar la consulta
	        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        if (rs.next()) {
	            // Si hay un resultado, crea un objeto Voluntario y establece el correo
	            voluntario = new Voluntario();
	            voluntario.setEmail(rs.getString("correo"));
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

	    return voluntario;
}

	@Override
	public int save(Voluntario voluntario, Inscripcion inscripcion) {
		Connection con = null;
	    PreparedStatement psVoluntario = null;
	    PreparedStatement psInscripcion = null;
	    int salida = -1;

	    try {
	        // 1. Obtener la conexión a la base de datos
	        con = new MySqlConectar().getConectar();
	        con.setAutoCommit(false); // Deshabilitar la confirmación automática

	        // 2. Sentencia SQL para la inserción del voluntario
	        String sqlVoluntario = "INSERT INTO voluntario (dni, nombre, paterno, materno, correo, telefono, ciudad, provincia, distrito, id_Especialidades) VALUES(?,?,?,?,?,?,?,?,?,?)";
	        psVoluntario = con.prepareStatement(sqlVoluntario);
	        psVoluntario.setInt(1, voluntario.getDni());
	        psVoluntario.setString(2, voluntario.getNombre());
	        psVoluntario.setString(3, voluntario.getPaterno());
	        psVoluntario.setString(4, voluntario.getMaterno());
	        psVoluntario.setString(5, voluntario.getEmail());
	        psVoluntario.setInt(6, voluntario.getTelefono());
	        psVoluntario.setString(7, voluntario.getCiudad());
	        psVoluntario.setString(8, voluntario.getProvincia());
	        psVoluntario.setString(9, voluntario.getDistrito());
	        psVoluntario.setInt(10, voluntario.getId_Especialidades());
	        
	        // 3. Sentencia SQL para la inserción de la inscripción
	        String sqlInscripcion = "INSERT INTO inscripcion (voluntario_dni, eventos_id_evento) VALUES(?,?)";
	        psInscripcion = con.prepareStatement(sqlInscripcion);
	        psInscripcion.setInt(1, inscripcion.getVoluntario_dni());
	        psInscripcion.setInt(2, inscripcion.getEventos_id_evento());

	        // 4. Ejecutar las inserciones
	        int resultadoVoluntario = psVoluntario.executeUpdate();
	        int resultadoInscripcion = psInscripcion.executeUpdate();

	        // 5. Confirmar o deshacer la transacción según los resultados
	        if (resultadoVoluntario > 0 && resultadoInscripcion > 0) {
	            con.commit(); // Confirmar la transacción
	            salida = 1; // Indicar éxito
	        } else {
	            con.rollback(); // Deshacer la transacción
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        if (con != null) {
	            try {
	                con.rollback(); // En caso de excepción, deshacer la transacción
	            } catch (SQLException e2) {
	                e2.printStackTrace();
	            }
	        }
	    } finally {
	        try {
	            if (psVoluntario != null)
	                psVoluntario.close();
	            if (psInscripcion != null)
	                psInscripcion.close();
	            if (con != null)
	                con.close();
	        } catch (SQLException e2) {
	            e2.printStackTrace();
	        }
	    }

	    return salida;
	}

	@Override
	public int deleteByEventId(int cod) {
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para eliminar voluntarios por ID de evento
		        String sql = "DELETE v FROM voluntario v \" +\r\n"
		        		+ "                     \"INNER JOIN inscripcion i ON v.dni = i.voluntario_dni \" +\r\n"
		        		+ "                     \"WHERE i.eventos_id_evento = ?\"";
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
	public int deleteByEspecialidad(int especialidadId) {
		 int result = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        con = new MySqlConectar().getConectar();
		        // Deshabilitar el autocommit para iniciar una transacción
		        con.setAutoCommit(false);

		        // Antes de eliminar voluntarios, eliminar las inscripciones relacionadas
		        int inscripcionResult = new MySqlnscripcionDAO().deleteByEspecialidad(especialidadId);

		        if (inscripcionResult >= 0) {
		            // Si se eliminaron las inscripciones correctamente, eliminar los voluntarios
		            String sql = "DELETE FROM voluntario WHERE id_Especialidades = ?";
		            ps = con.prepareStatement(sql);
		            ps.setInt(1, especialidadId);
		            result = ps.executeUpdate();
		        } else {
		            // Si hubo problemas al eliminar inscripciones, hacer un rollback
		            con.rollback();
		        }

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

	@Override
	public Voluntario findNumero(int num) {
		Voluntario voluntario = null;
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        // 1. Obtener Conexion
	        con = new MySqlConectar().getConectar();
	        // 2. Sentencia SQL para obtener el DNI por código 
	        String sql = "SELECT telefono FROM voluntario WHERE telefono = ?";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, num); // Setea el parámetro con el ID del voluntario

	        // 4. Ejecutar la consulta
	        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        if (rs.next()) {
	            // Si hay un resultado, crea un objeto Voluntario y establece el DNI
	            voluntario = new Voluntario();
	            voluntario.setTelefono(rs.getInt("telefono"));
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

	    return voluntario;
	}
	

	
	
	

}
