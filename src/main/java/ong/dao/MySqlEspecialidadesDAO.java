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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Especialidad bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteById(int cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Especialidad findById(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Especialidad> findAll() {		
		List<Especialidad> data= new ArrayList<Especialidad>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
	        // 1. Obtener Conexion
	        con = new MySqlConectar().getConectar();
	     // 2. Sentencia SQL para obtener todos los registros
	        String sql = "SELECT * FROM especialidades";
	        // 3. Crear objeto "ps" y enviar la variable "sql"
	        ps = con.prepareStatement(sql);

	        // 4. Ejecutar la consulta
	        rs = ps.executeQuery();

	        // 5. Procesar el resultado
	        while (rs.next()) {
	            // Crear un objeto Voluntario con los datos obtenidos de la consulta
	            Especialidad especialidad = new Especialidad();
	            especialidad.setIdEspecialidades(rs.getInt("idEspecialidades"));
	            especialidad.setNombre(rs.getString("nombre"));
	           
	            // Agregar el objeto data a la lista
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

}
