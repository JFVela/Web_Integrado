package Intranet.entidad;

public class Enlace {
	private int id_enlace;
	private String descripcion;
	private String ruta;
	private String rol_selecionado;

	public int getId_enlace() {
		return id_enlace;
	}

	public String getRol_selecionado() {
		return rol_selecionado;
	}

	public void setRol_selecionado(String rol_selecionado) {
		this.rol_selecionado = rol_selecionado;
	}

	public void setId_enlace(int id_enlace) {
		this.id_enlace = id_enlace;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

}
