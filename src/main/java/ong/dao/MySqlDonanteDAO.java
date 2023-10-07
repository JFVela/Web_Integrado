package ong.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import UtilsAdmin.MySqlConexion;
import ong.entity.Donante;
import ong.interfaces.*;

public class MySqlDonanteDAO implements DonanteDAO {

	public int insertar(Donante bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConexion().getConnection();
			String sentencia = "INSERT INTO donantes (dni,nombre, paterno, materno, celular, email, ciudad, direccion) VALUES (?,?, ?, ?, ?, ?, ?, ?)";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDni());
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getPaterno());
			pstm.setString(4, bean.getMaterno());
			pstm.setInt(5, bean.getCelular());
			pstm.setString(6, bean.getEmail());
			pstm.setString(7, bean.getCiudad());
			pstm.setString(8, bean.getDireccion());
			salida = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return salida;
	}

	

	@Override
	public List<Donante> findAll() {
		List<Donante> lista = new ArrayList<Donante>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con=new MySqlConexion().getConnection();
			String sql = "SELECT *FROM donantes";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Donante D=new Donante();
				D.setId(rs.getInt(1));
				D.setNombre(rs.getString(2));
				D.setPaterno(rs.getString(3));
				D.setMaterno(rs.getString(4));
				D.setCelular(rs.getInt(5));
				D.setEmail(rs.getString(6));
				D.setCiudad(rs.getString(7));
				D.setDireccion(rs.getString(8));
				lista.add(D);				
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
		return lista;
	}

}
