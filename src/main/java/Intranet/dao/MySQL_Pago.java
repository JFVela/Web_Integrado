package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Pago;
import Intranet.interfaces.interfazPago;
import Utils.MySQL_Conexion;

public class MySQL_Pago implements interfazPago {

	@Override
	public int save(Pago bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO pago VALUES(?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setDouble(1, bean.getSueldo());
			pstm.setString(2, bean.getDetalle());
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
	public int update(Pago bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteID(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Pago finById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Pago> findAll() {
		List<Pago> lista = new ArrayList<Pago>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT *FROM pago;";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Pago P = new Pago();
				P.setId(rs.getInt(1));
				P.setSueldo(rs.getDouble(2));
				P.setDetalle(rs.getString(3));
				lista.add(P);
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
