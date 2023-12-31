package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Locacion;
import ong.entity.Moneda;
import ong.interfaces.MonedaDAO;
import ong.utils.MySqlConectar;

public class MySqlMonedaDAO implements MonedaDAO {

	@Override
	public List<Moneda> findAll() {
		List<Moneda> dato=new ArrayList<Moneda>();
		Moneda bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from moneda;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new Moneda();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setValor(rs.getDouble(3));
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
	public Moneda findById(int id) {
		Moneda bean = null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		
		try {
			cn = new MySqlConectar().getConectar();
			String sql="SELECT * FROM moneda WHERE id_moneda=?";
			
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1,id);
			rs=pstm.executeQuery();
			
			if(rs.next()){
				bean = new Moneda();
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setValor(rs.getDouble(3));
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

	@Override
	public int save(Moneda bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "INSERT INTO moneda values(?,?,?)";
			
			pstm = cn.prepareStatement(sql);
			
			pstm.setInt(1, bean.getId());
			pstm.setString(2, bean.getNombre());
			pstm.setDouble(3, bean.getValor());
			
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
	public int update(Moneda bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			
			cn = new MySqlConectar().getConectar();
			
			String sql = "update moneda set nombre=?,valor=? where id_moneda=?";
			
			pstm=cn.prepareStatement(sql);
			
			pstm.setString(1, bean.getNombre());
			pstm.setDouble(2, bean.getValor());
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
		// TODO Auto-generated method stub
		return 0;
	}

}
