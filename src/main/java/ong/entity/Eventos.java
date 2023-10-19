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
	private String inicio_inscripcionStr;
	private String final_inscripcionStr;
	private String einicioStr;
	private String efinalStr;
	private int vacantes;
	private int inscritos;

	public String getInicio_inscripcionStr() {
		return inicio_inscripcionStr;
	}
	public void setInicio_inscripcionStr(String inicio_inscripcionStr) {
		this.inicio_inscripcionStr = inicio_inscripcionStr;
	}
	public String getFinal_inscripcionStr() {
		return final_inscripcionStr;
	}
	public void setFinal_inscripcionStr(String final_inscripcionStr) {
		this.final_inscripcionStr = final_inscripcionStr;
	}
	public String getEinicioStr() {
		return einicioStr;
	}
	public void setEinicioStr(String einicioStr) {
		this.einicioStr = einicioStr;
	}
	public String getEfinalStr() {
		return efinalStr;
	}
	public void setEfinalStr(String efinalStr) {
		this.efinalStr = efinalStr;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
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
	public int getInscritos() {
		return inscritos;
	}
	public void setInscritos(int inscritos) {
		this.inscritos = inscritos;
	}

	

}
