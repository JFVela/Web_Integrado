package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Voluntario;
import ong.interfaces.VoluntarioDAO;
import ong.utils.MySqlConectar;

public class MySqlVoluntarioDAO implements VoluntarioDAO {
	
	

	@Override
	public int save(Voluntario bean) {
		int salida = -1;
		Connection con = null;
		PreparedStatement ps = null;

			try {
			// 1. Obtener Conexion
			con = new MySqlConectar().getConectar();
			// 2. sentencia SQL
			String sql = "INSERT INTO voluntario (dni, nombre, paterno, materno, correo, telefono, ciudad, provincia, distrito, Especialidades_idEspecialidades) VALUES(?,?,?,?,?,?,?,?,?,?)";
			// 3. Crear objeto "ps"y enviar la variable "sql"
			ps = con.prepareStatement(sql);
			// 4. parametros
			ps.setInt(1, bean.getDni());
			ps.setString(2, bean.getNombre());
			ps.setString(3, bean.getPaterno());
			ps.setString(4, bean.getMaterno());
			ps.setString(5, bean.getEmail());
			ps.setInt(6, bean.getTelefono());
			ps.setString(7, bean.getCiudad());
			ps.setString(8, bean.getProvincia());
			ps.setString(9, bean.getDistrito());
			ps.setInt(10, bean.getEspecialidad());
			
			
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
		        ps.setInt(7, bean.getEspecialidad());
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
		            voluntario.setEspecialidad(rs.getInt("Especialidades_idEspecialidades"));
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
	                     "LEFT JOIN especialidades e ON v.Especialidades_idEspecialidades = e.idEspecialidades " +
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
		            voluntario.setEspecialidad(rs.getInt("Especialidades_idEspecialidades"));
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
		        // 2. Sentencia SQL para obtener el DNI por código (supongo que "cod" es el ID del voluntario)
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

	
	
	

}
