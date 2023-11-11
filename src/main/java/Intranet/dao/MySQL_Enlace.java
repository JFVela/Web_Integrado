package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Enlace;
import Intranet.interfaces.interfazEnlace;
import Utils.MySQL_Conexion;

public class MySQL_Enlace implements interfazEnlace {

	@Override
	public List<Enlace> findAll(String rol_selecionado) {
		List<Enlace> lista = new ArrayList<Enlace>();
		Enlace enlace;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "SELECT * FROM enlace " + "WHERE id_enlace NOT IN (" + "  SELECT enlace_id_enlace "
					+ "  FROM roles_has_enlace " + "  WHERE roles_id_rol = ?" + ")";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, rol_selecionado);
			rs = pstm.executeQuery();
			while (rs.next()) {
				enlace = new Enlace();
				enlace.setId_enlace(rs.getInt(1));
				enlace.setDescripcion(rs.getNString(2));
				enlace.setRuta(rs.getNString(3));
				lista.add(enlace);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

}
