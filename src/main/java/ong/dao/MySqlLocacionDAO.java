package ong.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import ong.entity.Donante;
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

	@Override
	public int insertar(Locacion bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "INSERT INTO local_donacion(nombre,direccion) values(?,?);";
			pstm=cn.prepareStatement(sentencia);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getDireccion());
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
	public Locacion findById(int id) {
		Locacion bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="select *from local_donacion where id_local=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql); 
			//4. parámetros
			pstm.setInt(1,id);
			//5. ejecutar pstm
			rs=pstm.executeQuery();
			//6. bucle
			if(rs.next()){
				//7. crear objeto de la clase Docente
				bean=new Locacion();
				//8 setear atributos del objeto "d" con los valores de la fila actual "rs"
				bean.setId(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDireccion(rs.getString(3));
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
	public int update(Locacion bean) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="update local_donacion set nombre=?,direccion=? where id_local=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setString(1,bean.getNombre());
			pstm.setString(2,bean.getDireccion());
			pstm.setInt(3,bean.getId());
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
			String sql="delete from local_donacion where id_local=?";
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
