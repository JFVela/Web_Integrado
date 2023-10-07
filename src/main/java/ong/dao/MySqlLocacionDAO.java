package ong.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import ong.entity.Locacion;
import ong.interfaces.LocacionDAO;
import ong.utils.MySqlConectar;

public class MySqlLocacionDAO implements LocacionDAO{

	@Override
	public List<Locacion> findAll() {
		List<Locacion> dato=new ArrayList<Locacion>();
		Locacion bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from local_donacion;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Locacion();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDireccion(rs.getString(3));
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
