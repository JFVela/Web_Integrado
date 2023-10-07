package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import UtilsAdmin.MySqlConexion;
import ong.entity.Locacion;
import ong.entity.Moneda;
import ong.interfaces.MonedaDAO;

public class MySqlMonedaDAO implements MonedaDAO {

	@Override
	public List<Moneda> findAll() {
		List<Moneda> dato=new ArrayList<Moneda>();
		Moneda bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConexion().getConnection();
			String sql="select *from moneda;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Moneda();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				dato.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dato;
		
	}

}
