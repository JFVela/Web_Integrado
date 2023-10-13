package Intranet.entidad;

import java.util.Date;

public class Eventos {
	private int id_evento;
	private String nombre;
	private String ubicacion;
	private String inicio_inscripcion;
	private String final_inscripcion;
	private String inicio;
	private String finaliza;
	private String detalle;
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

	public String getInicio_inscripcion() {
		return inicio_inscripcion;
	}

	public void setInicio_inscripcion(String inicio_inscripcion) {
		this.inicio_inscripcion = inicio_inscripcion;
	}

	public String getFinal_inscripcion() {
		return final_inscripcion;
	}

	public void setFinal_inscripcion(String final_inscripcion) {
		this.final_inscripcion = final_inscripcion;
	}

	public String getInicio() {
		return inicio;
	}

	public void setInicio(String inicio) {
		this.inicio = inicio;
	}

	public String getFinaliza() {
		return finaliza;
	}

	public void setFinaliza(String finaliza) {
		this.finaliza = finaliza;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public int getVacantes() {
		return vacantes;
	}

	public void setVacantes(int vacantes) {
		this.vacantes = vacantes;
	}

}
