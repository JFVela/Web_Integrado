package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ong.entity.DonacionFisica;
import ong.entity.Locacion;
import ong.interfaces.DonacionFisicoDAO;
import ong.utils.MySqlConectar;

public class MySqlDonacionFiscaDAO implements DonacionFisicoDAO {

	@Override
	public int save(DonacionFisica bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
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

	@Override
	public List<DonacionFisica> findAll() {
		List<DonacionFisica> dato=new ArrayList<DonacionFisica>();
		DonacionFisica bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from ong_web.donacion_fisica;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new DonacionFisica();
				bean.setIdFisico(rs.getInt(1));
				bean.setDniDonantes(rs.getInt(2));
				bean.setIdLocal(rs.getInt(3));
				bean.setDescripcion(rs.getString(4));
				bean.setEstado(rs.getBoolean(5));
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
	public DonacionFisica findById(int id) {
		DonacionFisica bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="SELECT * FROM ong_web.donacion_fisica where id_fisica=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql); 
			//4. parámetros
			pstm.setInt(1,id);
			//5. ejecutar pstm
			rs=pstm.executeQuery();
			//6. bucle
			if(rs.next()){
				//7. crear objeto de la clase Docente
				bean=new DonacionFisica();
				bean.setIdFisico(rs.getInt(1));
				bean.setDniDonantes(rs.getInt(2));
				bean.setIdLocal(rs.getInt(3));
				bean.setDescripcion(rs.getString(4));
				bean.setEstado(rs.getBoolean(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
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
	public int update(DonacionFisica bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="update donacion_fisica set local_donacion_id_local=?,descripcion=?,estado=? where id_fisica=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setInt(1, bean.getIdLocal());
			pstm.setString(2,bean.getDescripcion());
			pstm.setBoolean(3, bean.isEstado());
			pstm.setInt(4, bean.getIdFisico());
			salida=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
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
	public int deleteById(int cod) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="delete from donacion_fisica where id_fisica=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setInt(1,cod);
			salida=pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

}
