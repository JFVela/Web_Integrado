package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Departamento;
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
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO roles VALUES(null,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDescripcion());
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					pstm.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Roles bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteID(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Roles finById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Roles> findAll() {
		List<Roles> lista = new ArrayList<Roles>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT *FROM roles;";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Roles R = new Roles();
				R.setId(rs.getInt(1));
				R.setNombre(rs.getNString(2));
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
					pstm.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

}
