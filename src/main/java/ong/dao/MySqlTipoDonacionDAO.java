package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public int save(Tipo_Donacion bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "insert into tipos_donacion values(?,?)";
			
			pstm = cn.prepareStatement(sql);
			
			pstm.setInt(1, bean.getId());
			pstm.setString(2, bean.getNombre());
			
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstm!=null) {
					pstm.close();
				}
				if(cn!=null) {
					cn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Tipo_Donacion bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "update tipos_donacion set nombre=? where id_tipo=?";
			
			pstm=cn.prepareStatement(sql);
			
			pstm.setString(1, bean.getNombre());
			pstm.setInt(2, bean.getId());
			
			salida = pstm.executeUpdate();
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
				
			} catch (Exception e2) {
				
				e2.printStackTrace();
			}
		}
		
		
		
		return salida;
	}

	@Override
	public int deleteById(int id) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		
		try {
			
			cn = new MySqlConectar().getConectar();
			String sql="delete from tipos_donacion where id_tipo=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1,id);
			salida=pstm.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return salida;
	}

	@Override
	public Tipo_Donacion findById(int id) {
		Tipo_Donacion bean = null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn=new MySqlConectar().getConectar();
			
			String sql="select *from tipos_donacion where id_tipo=?";
			
			pstm=cn.prepareStatement(sql);
			
			pstm.setInt(1,id);
			
			rs=pstm.executeQuery();
			
			if(rs.next()){
				bean = new Tipo_Donacion();
				
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean;
	}
	
}
