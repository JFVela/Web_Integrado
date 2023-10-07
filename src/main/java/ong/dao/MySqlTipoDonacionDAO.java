package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import UtilsAdmin.MySqlConexion;
import ong.entity.Locacion;
import ong.entity.Tipo_Donacion;
import ong.interfaces.Tipo_donacionDAO;
import ong.utils.MySqlConectar;

public class MySqlTipoDonacionDAO implements Tipo_donacionDAO {

	@Override
	public List<Tipo_Donacion> findAll() {
		List<Tipo_Donacion> dato=new ArrayList<Tipo_Donacion>();
		Tipo_Donacion bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from tipos_donacion;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Tipo_Donacion();
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
