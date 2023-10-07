package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ong.entity.Tarjeta;
import ong.interfaces.verificarTarjeta;
import ong.utils.MySqlConectar;

public class MySqlTarjetaDAO implements verificarTarjeta{

	@Override
	public boolean verificacionTarjeta(Tarjeta bean) {
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "SELECT*FROM cuenta WHERE numero=? AND cvc=? AND mes=? AND año=?";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getNumCuenta());
			pstm.setInt(2, bean.getCvc());
			pstm.setInt(3, bean.getMes());
			pstm.setInt(4, bean.getAño());
			rs = pstm.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
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

	}

	@Override
	public int ActualizarSaldo(Tarjeta bean) {
		int salida=-1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "UPDATE cuenta SET saldo_actual = saldo_actual - ? "
								+ "WHERE numero = ? AND cvc = ? AND mes = ? AND año = ? "
								+ "AND saldo_actual >= ?;";
			pstm=cn.prepareStatement(sentencia);
			pstm.setDouble(1, bean.getSaldo());
			pstm.setInt(2, bean.getNumCuenta());
			pstm.setInt(3, bean.getCvc());
			pstm.setInt(4, bean.getMes());
			pstm.setInt(5, bean.getAño());
			pstm.setDouble(6, bean.getSaldo());
			salida=pstm.executeUpdate();
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
	public double saldoTarjeta(Tarjeta bean) {
		double saldoActual=-1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "SELECT saldo_actual FROM cuenta WHERE numero = ? AND cvc = ? AND mes = ? AND año = ?";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getNumCuenta());
			pstm.setInt(2, bean.getCvc());
			pstm.setInt(3, bean.getMes());
			pstm.setInt(4, bean.getAño());
			rs = pstm.executeQuery();
			if (rs.next()) {
	            saldoActual = rs.getDouble("saldo_actual");
	        }
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
		return saldoActual;
	}

}
