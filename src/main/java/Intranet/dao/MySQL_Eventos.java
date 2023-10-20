package Intranet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Intranet.entidad.Eventos;
import Intranet.interfaces.interfazEventos;
import Utils.MySQL_Conexion;

public class MySQL_Eventos implements interfazEventos {

	@Override
	public int save(Eventos bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "INSERT INTO eventos "
					+ "(`nombre`, `ubicacion`, `inicio_inscripcion`, `final_inscripcion`, `inicio`, `final`, `detalle`, `vacantes`) "
					+ "VALUES (?,?,?,?,?,?,?,?);\r\n";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getUbicacion());
			pstm.setString(3, bean.getInicio_inscripcion());
			pstm.setString(4, bean.getFinal_inscripcion());
			pstm.setString(5, bean.getInicio());
			pstm.setString(6, bean.getFinaliza());
			pstm.setString(7, bean.getDetalle());
			pstm.setInt(8, bean.getVacantes());
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int update(Eventos bean) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "UPDATE eventos " + "SET nombre=?,ubicacion=?,inicio_inscripcion=?,"
					+ "final_inscripcion=?,inicio=?,final=?,detalle=?," + "vacantes=? WHERE (id_evento=?);\r\n";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getUbicacion());
			pstm.setString(3, bean.getInicio_inscripcion());
			pstm.setString(4, bean.getFinal_inscripcion());
			pstm.setString(5, bean.getInicio());
			pstm.setString(6, bean.getFinaliza());
			pstm.setString(7, bean.getDetalle());
			pstm.setInt(8, bean.getVacantes());
			pstm.setInt(9, bean.getId_evento());
			salida = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public int deleteById(int id_evento) {
		int salida = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "DELETE FROM eventos WHERE (id_evento = ?)";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id_evento);
			salida = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}

	@Override
	public Eventos findById(int id_evento) {
		Eventos bean = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "select *FROM eventos WHERE (id_evento = ?)";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, id_evento);
			rs = pstm.executeQuery();
			if (rs.next()) {
				bean = new Eventos();
				bean.setId_evento(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setUbicacion(rs.getString(3));
				bean.setInicio_inscripcion(rs.getString(4));
				bean.setFinal_inscripcion(rs.getString(5));
				bean.setInicio(rs.getString(6));
				bean.setFinaliza(rs.getString(7));
				bean.setDetalle(rs.getString(8));
				bean.setVacantes(rs.getInt(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	@Override
	public List<Eventos> findAll() {
		List<Eventos> lista = new ArrayList<Eventos>();
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = new MySQL_Conexion().getConnection();
			String sql = "select *FROM eventos";
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				Eventos e = new Eventos();
				e.setId_evento(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setUbicacion(rs.getString(3));
				e.setInicio_inscripcion(rs.getString(4));
				e.setFinal_inscripcion(rs.getString(5));
				e.setInicio(rs.getString(6));
				e.setFinaliza(rs.getString(7));
				e.setDetalle(rs.getString(8));
				e.setVacantes(rs.getInt(9));
				lista.add(e);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstm != null)
					pstm.close();
				if (cn != null)
					cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}
}
