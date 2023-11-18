package ong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ong.entity.DonacionVirtual;
import ong.entity.Tipo_Donacion;
import ong.interfaces.DonacionVirtualDAO;
import ong.utils.MySqlConectar;

public class MySqlDonacionVirtualDAO implements DonacionVirtualDAO{

	@Override
	public int save(DonacionVirtual bean) {
		int salida = 1;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = new MySqlConectar().getConectar();
			String sentencia = "INSERT INTO donacion_virtual(donantes_dni,campaña_id_campaña\r\n"
					+ ",moneda_id_moneda,monto,cuenta_numero)VALUES(?,?,?,?,?);";
			pstm=cn.prepareStatement(sentencia);
			pstm.setInt(1, bean.getDniDonante());
			pstm.setInt(2, bean.getIdCampaña());
			pstm.setInt(3, bean.getIdMoneda());
			pstm.setDouble(4, bean.getMonto());
			pstm.setInt(5, bean.getNumCuenta());
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
	public List<DonacionVirtual> findAll() {
		List<DonacionVirtual> dato=new ArrayList<DonacionVirtual>();
		DonacionVirtual bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=new MySqlConectar().getConectar();
			String sql="select *from donacion_virtual;";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				bean=new DonacionVirtual();
				bean.setId(rs.getInt(1));
				bean.setDniDonante(rs.getInt(2));
				bean.setIdCampaña(rs.getInt(3));
				bean.setTipoDonacion(rs.getInt(4));
				bean.setIdMoneda(rs.getInt(5));
				bean.setMonto(rs.getDouble(6));
				bean.setNumCuenta(rs.getInt(7));
				
				
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
