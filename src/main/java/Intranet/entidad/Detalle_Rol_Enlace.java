package Intranet.entidad;

public class Detalle_Rol_Enlace {
	private int IDrol;
	private String nombreRol;
	private int IDEnlace;
	private String nombreEnlace;

	public int getIDrol() {
		return IDrol;
	}

	public void setIDrol(int iDrol) {
		IDrol = iDrol;
	}

	public String getNombreRol() {
		return nombreRol;
	}

	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}

	public int getIDEnlace() {
		return IDEnlace;
	}

	public void setIDEnlace(int iDEnlace) {
		IDEnlace = iDEnlace;
	}

	public String getNombreEnlace() {
		return nombreEnlace;
	}

	public void setNombreEnlace(String nombreEnlace) {
		this.nombreEnlace = nombreEnlace;
	}

}
