package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import UtilsAdmin.MySqlConexion;
import ong.entity.DonacionFisica;
import ong.interfaces.DonacionFisicoDAO;

public class MySqlDonacionFiscaDAO implements DonacionFisicoDAO {

	@Override
	public int save(DonacionFisica bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConexion().getConnection();
			String sentencia = "INSERT INTO donacion_fisica(donantes_dni,local_donacion_id_local,descripcion,"
					+ "estado) values(?,?,?,?);";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDniDonantes());
			pstm.setInt(2, bean.getIdLocal());
			pstm.setString(3, bean.getDescripcion());
			pstm.setBoolean(4,false);
			
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
