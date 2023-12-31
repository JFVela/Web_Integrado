package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ong.entity.DonacionVirtual;
import ong.entity.Tipo_Donacion;
import ong.interfaces.DonacionVirtualDAO;
import ong.utils.MySqlConectar;

public class MySqlDonacionVirtualDAO implements DonacionVirtualDAO {

	@Override
	public int save(DonacionVirtual bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "INSERT INTO donacion_virtual(donantes_dni,campaña_id_campaña\r\n"
					+ ",moneda_id_moneda,monto,cuenta_numero)VALUES(?,?,?,?,?);";
			pstm = cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDniDonante());
			pstm.setInt(2, bean.getIdCampaña());
			pstm.setInt(3, bean.getIdMoneda());
			// Redondear el valor a dos decimales
			double montoRedondeado = Math.round(bean.getMonto() * 100.0) / 100.0;
			pstm.setDouble(4, montoRedondeado);
			pstm.setInt(5, bean.getNumCuenta());
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
	public List<DonacionVirtual> findAll() {
		List<DonacionVirtual> dato = new ArrayList<DonacionVirtual>();
		DonacionVirtual bean = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySqlConectar().getConectar();
			String sql = "select *from donacion_virtual;";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				bean = new DonacionVirtual();
				bean.setId(rs.getInt(1));
				bean.setDniDonante(rs.getInt(2));
				bean.setIdCampaña(rs.getInt(3));
				// bean.setTipoDonacion(rs.getInt(4));
				bean.setIdMoneda(rs.getInt(4));
				bean.setMonto(rs.getDouble(5));
				bean.setNumCuenta(rs.getInt(6));

				dato.add(bean);
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
		return dato;
	}

	@Override
	public double valormoneda(int idmoneda) {
		Connection cn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		double valor = 0;
		try {
			cn = new MySqlConectar().getConectar();
			String consulta = "SELECT valor FROM ong_web.moneda where id_moneda=?";
			ps = cn.prepareStatement(consulta);
			ps.setInt(1, idmoneda);
			rs = ps.executeQuery();
			if (rs.next()) {
				valor = rs.getDouble(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (cn != null)
					cn.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception ex2) {
				ex2.printStackTrace();
			}
		}
		return valor;
	}

}
