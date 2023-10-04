package ong.entity;

public class Eventos {
	
	private int id_evento;
	private String nombre;
	private String ubicacion;
	private java.sql.Date inicio_inscripcion;
	private java.sql.Date final_inscripcion;
	private java.sql.Date einicio;
	private java.sql.Date efinal;
	private String detalle;
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	private int vacantes;
	public int getId_evento() {
		return id_evento;
	}
	public void setId_evento(int id_evento) {
		this.id_evento = id_evento;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	public java.sql.Date getInicio_inscripcion() {
		return inicio_inscripcion;
	}
	public void setInicio_inscripcion(java.sql.Date inicio_inscripcion) {
		this.inicio_inscripcion = inicio_inscripcion;
	}
	public java.sql.Date getFinal_inscripcion() {
		return final_inscripcion;
	}
	public void setFinal_inscripcion(java.sql.Date final_inscripcion) {
		this.final_inscripcion = final_inscripcion;
	}
	public java.sql.Date getEinicio() {
		return einicio;
	}
	public void setEinicio(java.sql.Date einicio) {
		this.einicio = einicio;
	}
	public java.sql.Date getEfinal() {
		return efinal;
	}
	public void setEfinal(java.sql.Date efinal) {
		this.efinal = efinal;
	}
	public int getVacantes() {
		return vacantes;
	}
	public void setVacantes(int vacantes) {
		this.vacantes = vacantes;
	}
	

}
