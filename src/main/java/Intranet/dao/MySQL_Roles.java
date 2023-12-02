package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Roles;
import Intranet.interfaces.interfazRoles;
import Utils.MySQL_Conexion;

public class MySQL_Roles implements interfazRoles {

	@Override
	public int save(Roles bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			// Obtener la conexión a la base de datos
			cn = new MySQL_Conexion().getConnection();
			// Definir la consulta SQL para insertar un nuevo rol
			String sql = "INSERT INTO roles (nombre, descripcion) VALUES (?, ?)";
			pstm = cn.prepareStatement(sql);
			// Establecer los valores de los parámetros
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDescripcion());
			// Ejecutar la consulta y obtener el número de filas afectadas
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Cerrar recursos en el bloque finally para asegurar que se cierren siempre
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Roles bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			// Definir la consulta SQL para actualizar un rol
			String sql = "UPDATE roles SET nombre = ?, descripcion = ? WHERE id_rol = ?";
			pstm = cn.prepareStatement(sql);
			// Establecer los valores de los parámetros
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDescripcion());
			pstm.setInt(3, bean.getId());
			// Ejecutar la consulta y obtener el número de filas afectadas
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int deleteID(int id) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			// Definir la consulta SQL para eliminar un rol por su ID
			String sql = "DELETE FROM roles WHERE id_rol = ?";
			pstm = cn.prepareStatement(sql);
			// Establecer el valor del parámetro
			pstm.setInt(1, id);
			// Ejecutar la consulta y obtener el número de filas afectadas
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public Roles finById(int id) {
		Roles bean = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			// Definir la consulta SQL para obtener un rol por su ID
			String sql = "SELECT * FROM roles WHERE id_rol = ?";
			pstm = cn.prepareStatement(sql);
			// Establecer el valor del parámetro
			pstm.setInt(1, id);
			// Ejecutar la consulta y obtener el conjunto de resultados
			rs = pstm.executeQuery();
			// Procesar los resultados
			if (rs.next()) {
				bean = new Roles();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// Cerrar recursos en el bloque finally para asegurar que se cierren siempre
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<Roles> findAll() {
		List<Roles> lista = new ArrayList<Roles>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			// Definir la consulta SQL para obtener todos los roles
			String sql = "SELECT * FROM roles;";
			pstm = cn.prepareStatement(sql);
			// Ejecutar la consulta y obtener el conjunto de resultados
			rs = pstm.executeQuery();
			// Procesar los resultados y agregarlos a la lista
			while (rs.next()) {
				Roles R = new Roles();
				R.setId(rs.getInt(1));
				R.setNombre(rs.getString(2));
				R.setDescripcion(rs.getString(3));
				lista.add(R);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}
}
