package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Especialidad;
import ong.interfaces.EspecialidadesDAO;
import ong.utils.MySqlConectar;

public class MySqlEspecialidadesDAO implements EspecialidadesDAO{

	@Override
	public int save(Especialidad bean) {
		int salida = -1;
		Connection con = null;
		PreparedStatement ps = null;

		try {
		    // 1. Obtener Conexión
		    con = new MySqlConectar().getConectar();
		    // 2. Sentencia SQL
		    String sql = "INSERT INTO especialidades (id_Especialidades, nombre) VALUES(?,?)";
		    // 3. Crear objeto "ps" y enviar la variable "sql"
		    ps = con.prepareStatement(sql);
		    // 4. Parámetros
		    ps.setInt(1, bean.getId_Especialidades());
		    ps.setString(2, bean.getNombre()); // Reemplaza nombreEspecialidad con el nombre de la especialidad que deseas insertar.
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
	public int update(Especialidad bean) {
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para actualizar
		        String sql = "UPDATE especialidades SET nombre = ? WHERE id_Especialidades = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetros
		        ps.setString(1, bean.getNombre()); // Reemplaza getNombre() con el nuevo nombre de la especialidad.
		        ps.setInt(2, bean.getId_Especialidades()); // Agrega el id como segundo parámetro

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
	public int deleteById(int id) {
		 int salida = -1;
		    Connection con = null;
		    PreparedStatement ps = null;

		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para eliminar por ID
		        String sql = "DELETE FROM especialidades WHERE id_Especialidades = ?";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
		        // 4. Parámetro
		        ps.setInt(1, id); // ID de la especialidad que deseas eliminar

		        // 5. Ejecutar ps
		        // El método executeUpdate retorna el número de filas afectadas por la operación de eliminación.
		        // Si todo está bien, debería retornar 1, lo que significa que una fila se eliminó.
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
	public Especialidad findById(int cod) {
			   Especialidad especialidad = null;
			    Connection con = null;
			    PreparedStatement ps = null;
			    ResultSet rs = null;
	
			    try {
			        // 1. Obtener Conexión
			        con = new MySqlConectar().getConectar();
			        // 2. Sentencia SQL para obtener una especialidad por su ID
			        String sql = "SELECT * FROM especialidades WHERE id_Especialidades = ?";
			        // 3. Crear objeto "ps" y enviar la variable "sql"
			        ps = con.prepareStatement(sql);
			        // 4. Parámetro
			        ps.setInt(1, cod); // ID de la especialidad que deseas recuperar
	
			        // 5. Ejecutar consulta
			        rs = ps.executeQuery();
	
			        // 6. Procesar el resultado
			        if (rs.next()) {
			            especialidad = new Especialidad();
			            especialidad.setId_Especialidades(rs.getInt("idEspecialidades"));
			            especialidad.setNombre(rs.getString("nombre"));
			            // Continúa asignando otros atributos de la especialidad si los hay
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

		    return especialidad;
	}

	@Override
	public List<Especialidad> findAll() {		
			List<Especialidad> data = new ArrayList<Especialidad>();
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;
	
		    try {
		        // 1. Obtener Conexión
		        con = new MySqlConectar().getConectar();
		        // 2. Sentencia SQL para obtener todos los registros
		        String sql = "SELECT e.id_Especialidades, e.nombre, COUNT(v.dni) AS inscritos " +
		                     "FROM especialidades e " +
		                     "LEFT JOIN voluntario v ON e.id_Especialidades = v.id_Especialidades " +
		                     "GROUP BY e.id_Especialidades, e.nombre";
		        // 3. Crear objeto "ps" y enviar la variable "sql"
		        ps = con.prepareStatement(sql);
	
		        // 4. Ejecutar la consulta
		        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        while (rs.next()) {
	            // Crear un objeto Especialidad con los datos obtenidos de la consulta
	            Especialidad especialidad = new Especialidad();
	            especialidad.setId_Especialidades(rs.getInt("id_Especialidades"));
	            especialidad.setNombre(rs.getString("nombre"));
	            especialidad.setInscritos(rs.getInt("inscritos"));

	            // Agregar el objeto especialidad a la lista
	            data.add(especialidad);
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

	@Override
	public int deleteWithVolunteers(int id) {
		 int result = -1;
		    Connection con = null;

		    try {
		        con = new MySqlConectar().getConectar();
		        // Deshabilitar el autocommit para iniciar una transacción
		        con.setAutoCommit(false);

		        // Eliminar voluntarios de la especialidad
		        int volunteerResult = new MySqlVoluntarioDAO().deleteByEspecialidad(id);

		        if (volunteerResult >= 0) {
		            // Si se eliminaron los voluntarios correctamente, eliminar la especialidad
		            result = deleteById(id);
		        } else {
		            // Si hubo problemas al eliminar los voluntarios, hacer un rollback
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
