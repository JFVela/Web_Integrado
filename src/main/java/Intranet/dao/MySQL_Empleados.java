package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import Intranet.entidad.Empleados;
import Intranet.entidad.Enlace;
import Intranet.interfaces.interfazEmpleados;
import Utils.MySQL_Conexion;
import ong.utils.MySqlConectar;

public class MySQL_Empleados implements interfazEmpleados {

	@Override
	public int save(Empleados empleado) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO empleados(dni, login, contraseña, nombre, paterno, materno, telefono, correo, direccion, sueldo, id_rol, id_depa, salt) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			pstm.setInt(11, empleado.getRolNumber());
			pstm.setInt(12, empleado.getDepaNumber());
			pstm.setBytes(13, empleado.getSalt()); // Insertar el valor de salt como un arreglo de bytes

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
			String sql = "UPDATE empleados SET dni=?, login=?, contraseña=?, nombre=?, paterno=?, materno=?, telefono=?, correo=?, direccion=?, sueldo=?, id_rol=?, id_depa=?, salt=? WHERE codigo=?";
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
			pstm.setInt(11, empleado.getRolNumber());
			pstm.setInt(12, empleado.getDepaNumber());
			pstm.setBytes(13, empleado.getSalt()); // Insertar el valor de salt como un arreglo de bytes
			pstm.setInt(14, empleado.getCodigo());

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
				empleado.setRolNumber(rs.getInt("id_rol"));
				empleado.setDepaNumber(rs.getInt("id_depa"));
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
				empleado.setRolNumber(rs.getInt("id_rol")); // Asignar el ID del rol
				empleado.setDepaNumber(rs.getInt("id_depa")); // Asignar el ID del departamento
				empleado.setOngNumber(rs.getInt("idONG"));
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

	@Override
	public List<Enlace> traerEnlaceDelUsuario(int codRol) {
		List<Enlace> lista = new ArrayList<Enlace>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT e.id_enlace, e.descripcion, e.ruta\r\n" + "FROM enlace e\r\n"
					+ "JOIN roles_has_enlace re ON e.id_enlace = re.enlace_id_enlace\r\n" + "WHERE re.roles_id_rol = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, codRol);
			rs = pstm.executeQuery();

			while (rs.next()) {
				Enlace bean = new Enlace();
				bean.setId_enlace(rs.getInt(1));
				bean.setDescripcion(rs.getString(2));
				bean.setRuta(rs.getString(3));
				lista.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	@Override
	public Empleados iniciarSesion(String login) {
		Empleados empleado = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new MySQL_Conexion().getConnection();
			String sql = "SELECT e.codigo, e.login, e.nombre, e.id_rol, e.contraseña, e.salt, r.nombre as nombre_rol "
					+ "FROM empleados e " + "INNER JOIN roles r ON e.id_rol = r.id_rol " + "WHERE e.login = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empleado = new Empleados();
				empleado.setCodigo(rs.getInt("codigo"));
				empleado.setLogin(rs.getString("login"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setRolNumber(rs.getInt("id_rol"));
				empleado.setNombre_rol(rs.getString("nombre_rol")); 
				empleado.setContraseña(rs.getString("contraseña"));
				byte[] salt = rs.getBytes("salt");
				empleado.setSalt(salt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empleado;
	}

	@Override
	public Empleados findDNI(int dni) {
		Empleados empre = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new MySqlConectar().getConectar();
			String sql = "Select dni from empleados where dni=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dni);
			rs = ps.executeQuery();
			if (rs.next()) {
				empre = new Empleados();
				empre.setDni(rs.getInt("dni"));
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

		return empre;
	}

	@Override
	public Empleados findLogin(String login) {
		Empleados empre = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new MySqlConectar().getConectar();
			String sql = "SELECT login FROM empleados WHERE login=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, login);
			rs = ps.executeQuery();
			if (rs.next()) {
				empre = new Empleados();
				empre.setLogin(rs.getString("login"));
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
		return empre;
	}

	@Override
	public Empleados findTelefono(int telefono) {
		Empleados empre = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new MySqlConectar().getConectar();
			String sql = "SELECT telefono FROM empleados WHERE telefono=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, telefono);
			rs = ps.executeQuery();
			if (rs.next()) {
				empre = new Empleados();
				empre.setTelefono(rs.getInt("telefono"));
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
		return empre;
	}

	@Override
	public Empleados findCorreo(String correo) {
		Empleados empre = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = new MySqlConectar().getConectar();
			String sql = "SELECT correo FROM empleados WHERE correo=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, correo);
			rs = ps.executeQuery();
			if (rs.next()) {
				empre = new Empleados();
				empre.setCorreo(rs.getString("correo"));
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
		return empre;
	}

}
