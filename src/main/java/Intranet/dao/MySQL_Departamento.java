package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Departamento;
import Intranet.entidad.Pago;
import Intranet.interfaces.interfazDepartamento;
import Utils.MySQL_Conexion;

public class MySQL_Departamento implements interfazDepartamento {

	@Override
	public int save(Departamento bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO departamento VALUES(null,?,?)";
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
	public int update(Departamento bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteID(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Departamento findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Departamento> FindAll() {
		List<Departamento> lista = new ArrayList<Departamento>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT *FROM departamento;";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Departamento D = new Departamento();
				D.setId(rs.getInt(1));
				D.setNombre(rs.getNString(2));
				D.setDescripcion(rs.getString(3));
				lista.add(D);
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
