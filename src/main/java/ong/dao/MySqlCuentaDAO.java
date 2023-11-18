package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Cuenta;
import ong.interfaces.CuentaDAO;
import ong.utils.MySqlConectar;

public class MySqlCuentaDAO implements CuentaDAO {

	@Override
	public List<Cuenta> findAll() {
		List<Cuenta> dato = new ArrayList<Cuenta>();
		Cuenta bean = null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			
			cn = new MySqlConectar().getConectar();
			String sql="select *from cuenta;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean = new Cuenta();
				bean.setNumero(rs.getInt(1));
				bean.setDueno(rs.getString(2));
				bean.setCvc(rs.getInt(3));
				bean.setMes(rs.getInt(4));
				bean.setAnio(rs.getInt(5));
				bean.setSaldo(rs.getDouble(6));
				dato.add(bean);
			}
			
		} catch (Exception e) {
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
