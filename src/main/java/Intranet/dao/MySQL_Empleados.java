package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Intranet.entidad.Empleados;
import Intranet.interfaces.interfazEmpleados;
import Utils.MySQL_Conexion;

public class MySQL_Empleados implements interfazEmpleados {

	@Override
	public int save(Empleados empleado) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO empleados(dni, login, contraseña, nombre, paterno, materno, telefono, correo, direccion, sueldo, id_rol, id_depa) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, empleado.getDni());
			pstm.setString(2, empleado.getLogin());
			pstm.setString(3, empleado.getContraseña());
			pstm.setString(4, empleado.getNombre());
			pstm.setString(5, empleado.getPaterno());
			pstm.setString(6, empleado.getMaterno());
			pstm.setInt(7, empleado.getTelefono());
			pstm.setString(8, empleado.getCorreo());
			pstm.setString(9, empleado.getDireccion());
			pstm.setDouble(10, empleado.getSueldo());
			pstm.setInt(11, empleado.getId_rol());
			pstm.setInt(12, empleado.getId_depa());

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
	public int update(Empleados empleado) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "UPDATE empleados SET dni=?, login=?, contraseña=?, nombre=?, paterno=?, materno=?, telefono=?, correo=?, direccion=?, sueldo=?, id_rol=?, id_depa=? WHERE codigo=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, empleado.getDni());
			pstm.setString(2, empleado.getLogin());
			pstm.setString(3, empleado.getContraseña());
			pstm.setString(4, empleado.getNombre());
			pstm.setString(5, empleado.getPaterno());
			pstm.setString(6, empleado.getMaterno());
			pstm.setInt(7, empleado.getTelefono());
			pstm.setString(8, empleado.getCorreo());
			pstm.setString(9, empleado.getDireccion());
			pstm.setDouble(10, empleado.getSueldo());
			pstm.setInt(11, empleado.getId_rol());
			pstm.setInt(12, empleado.getId_depa());
			pstm.setInt(13, empleado.getCodigo());

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
	public int deleteCod(int codigo) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "DELETE FROM empleados WHERE codigo = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, codigo);
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
	public Empleados findByCod(int codigo) {
		Empleados empleado = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT * FROM empleados WHERE codigo = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, codigo);
			rs = pstm.executeQuery();
			if (rs.next()) {
				empleado = new Empleados();
				empleado.setDni(rs.getInt("dni"));
				empleado.setCodigo(rs.getInt("codigo"));
				empleado.setLogin(rs.getString("login"));
				empleado.setContraseña(rs.getString("contraseña"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setPaterno(rs.getString("paterno"));
				empleado.setMaterno(rs.getString("materno"));
				empleado.setTelefono(rs.getInt("telefono"));
				empleado.setCorreo(rs.getString("correo"));
				empleado.setDireccion(rs.getString("direccion"));
				empleado.setSueldo(rs.getDouble("sueldo"));
				empleado.setId_rol(rs.getInt("id_rol"));
				empleado.setId_depa(rs.getInt("id_depa"));
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
		return empleado;
	}

	@Override
	public List<Empleados> findAll() {
		List<Empleados> lista = new ArrayList<Empleados>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT e.codigo,e.dni, e.login, e.contraseña, e.nombre, e.paterno, e.materno, e.telefono, e.correo, e.direccion, e.sueldo,e.id_rol,e.id_depa,e.idONG, r.nombre AS nombre_rol, d.nombre AS nombre_departamento \r\n"
					+ "FROM empleados e \r\n" + "INNER JOIN roles r ON e.id_rol = r.id_rol \r\n"
					+ "INNER JOIN departamento d ON e.id_depa = d.id_depa";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Empleados empleado = new Empleados();
				empleado.setCodigo(rs.getInt("codigo"));
				empleado.setDni(rs.getInt("dni"));
				empleado.setLogin(rs.getString("login"));
				empleado.setContraseña(rs.getString("contraseña"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setPaterno(rs.getString("paterno"));
				empleado.setMaterno(rs.getString("materno"));
				empleado.setTelefono(rs.getInt("telefono"));
				empleado.setCorreo(rs.getString("correo"));
				empleado.setDireccion(rs.getString("direccion"));
				empleado.setSueldo(rs.getDouble("sueldo"));
				empleado.setId_rol(rs.getInt("id_rol")); // Asignar el ID del rol
				empleado.setId_depa(rs.getInt("id_depa")); // Asignar el ID del departamento
				empleado.setIdONG(rs.getInt("idONG"));
				empleado.setNombre_rol(rs.getString("nombre_rol")); // Nombre del rol
				empleado.setNombre_departamento(rs.getString("nombre_departamento")); // Nombre del departamento
				// lugar de ID
				lista.add(empleado);
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
