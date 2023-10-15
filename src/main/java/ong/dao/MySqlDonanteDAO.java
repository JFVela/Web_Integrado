package ong.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import ong.entity.Donante;
import ong.interfaces.*;
import ong.utils.MySqlConectar;

public class MySqlDonanteDAO implements DonanteDAO {

	public int insertar(Donante bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "INSERT INTO donantes (dni,nombre, paterno, materno, celular, email, ciudad, direccion) VALUES (?,?, ?, ?, ?, ?, ?, ?)";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDni());
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getPaterno());
			pstm.setString(4, bean.getMaterno());
			pstm.setInt(5, bean.getCelular());
			pstm.setString(6, bean.getEmail());
			pstm.setString(7, bean.getCiudad());
			pstm.setString(8, bean.getDireccion());
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
	public List<Donante> findAll() {
		List<Donante> lista = new ArrayList<Donante>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con=new MySqlConectar().getConectar();
			String sql = "SELECT *FROM donantes";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Donante D=new Donante();
				D.setDni(rs.getInt(1));;
				D.setNombre(rs.getString(2));
				D.setPaterno(rs.getString(3));
				D.setMaterno(rs.getString(4));
				D.setCelular(rs.getInt(5));
				D.setEmail(rs.getString(6));
				D.setCiudad(rs.getString(7));
				D.setDireccion(rs.getString(8));
				lista.add(D);				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}



	@Override
	public Donante findById(int dni) {
		Donante bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="SELECT * FROM ong_web.donantes where dni=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql); 
			//4. parámetros
			pstm.setInt(1,dni);
			//5. ejecutar pstm
			rs=pstm.executeQuery();
			//6. bucle
			if(rs.next()){
				//7. crear objeto de la clase Docente
				bean=new Donante();
				//8 setear atributos del objeto "d" con los valores de la fila actual "rs"
				bean.setDni(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setPaterno(rs.getString(3));
				bean.setMaterno(rs.getString(4));
				bean.setCelular(rs.getInt(5));
				bean.setEmail(rs.getString(6));
				bean.setCiudad(rs.getString(7));
				bean.setDireccion(rs.getString(8));
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
	public int update(Donante bean,int dniActual) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="update ong_web.donantes set dni=?,nombre=?,paterno=?,materno=?,celular=?,email=?,ciudad=?,direccion=? where dni=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setInt(1, bean.getDni());
			pstm.setString(2,bean.getNombre());
			pstm.setString(3,bean.getPaterno());
			pstm.setString(4,bean.getMaterno());
			pstm.setInt(5,bean.getCelular());
			pstm.setString(6,bean.getEmail());
			pstm.setString(7,bean.getCiudad());
			pstm.setString(8,bean.getDireccion());
			pstm.setInt(9, dniActual);
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
	public int deleteById(int dni) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null;
		try {
			//1.Obtener conexión 
			cn=new MySqlConectar().getConectar();
			//2. sentencia SQL
			String sql="delete from ong_web.donantes where dni=?";
			//3. crear objeto "pstm" y enviar la variable "sql"
			pstm=cn.prepareStatement(sql);
			//4. parámetros
			pstm.setInt(1,dni);
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
