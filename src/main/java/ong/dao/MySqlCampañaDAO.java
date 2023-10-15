package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Campaña;
import ong.interfaces.CampañaDAO;
import ong.utils.MySqlConectar;

public class MySqlCampañaDAO implements CampañaDAO{

	@Override
	public List<Campaña> findAll() {
		List<Campaña> dato=new ArrayList<Campaña>();
		Campaña bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from campaña;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Campaña();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
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
	public int save(Campaña bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "insert into campaña values(?,?,?)";
			
			pstm = cn.prepareStatement(sql);
			
			pstm.setInt(1, bean.getId());
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getDescripcion());
			
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
	public int update(Campaña bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "update campaña set nombre=?,descripcion=? where id_campaña=?";
			
			pstm=cn.prepareStatement(sql);
			
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDescripcion());
			pstm.setInt(3, bean.getId());
			
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
			String sql="delete from campaña where id_campaña=?";
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
	public Campaña findById(int id) {
		Campaña bean = null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn=new MySqlConectar().getConectar();
			
			String sql="select *from campaña where id_campaña=?";
			
			pstm=cn.prepareStatement(sql);
			
			pstm.setInt(1,id);
			
			rs=pstm.executeQuery();
			
			if(rs.next()){
				bean = new Campaña();
				
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
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
