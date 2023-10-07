package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ong.entity.DonacionVirtual;
import ong.interfaces.DonacionVirtualDAO;
import ong.utils.MySqlConectar;

public class MySqlDonacionVIrtualDAO implements DonacionVirtualDAO{

	@Override
	public int save(DonacionVirtual bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "INSERT INTO donacion_virtual(donantes_dni,campaña_id_campaña,tipos_donacion_id_tipo\r\n"
					+ ",moneda_id_moneda,monto,cuenta_numero)VALUES(?,?,?,?,?,?);";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDniDonante());
			pstm.setInt(2, bean.getIdCampaña());
			pstm.setInt(3, bean.getTipoDonacion());
			pstm.setInt(4, bean.getIdMoneda());
			pstm.setDouble(5, bean.getMonto());
			pstm.setInt(6, bean.getNumCuenta());
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

}
