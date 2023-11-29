package ong.entity;

public class Voluntario {
	
	private int dni;
	private String nombre;
	private String paterno;
	private String materno;
	private String email;
	private int telefono;
	private String provincia;
	private String ciudad;
	private String distrito;
	private Especialidad especialidad;
	public Especialidad getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(Especialidad especialidad) {
		this.especialidad = especialidad;
	}
	private int id_Especialidades;
	private String EspecialidadNombre;
	private int eventos_id_evento;
	private String eventoNombre;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPaterno() {
		return paterno;
	}
	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}
	public String getMaterno() {
		return materno;
	}
	public void setMaterno(String materno) {
		this.materno = materno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTelefono() {
		return telefono;
	}
	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	public int getDni() {
		return dni;
	}
	public void setDni(int dni) {
		this.dni = dni;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getDistrito() {
		return distrito;
	}
	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
	public int getId_Especialidades() {
		return id_Especialidades;
	}
	public void setId_Especialidades(int especialidad) {
		this.id_Especialidades= especialidad;
	}
	public int getEventos_id_evento() {
		return eventos_id_evento;
	}
	public void setEventos_id_evento(int eventos_id_evento) {
		this.eventos_id_evento = eventos_id_evento;
	}
	public String getEspecialidadNombre() {
		return EspecialidadNombre;
	}
	public void setEspecialidadNombre(String especialidadNombre) {
		EspecialidadNombre = especialidadNombre;
	}
	public String getEventoNombre() {
		return eventoNombre;
	}
	public void setEventoNombre(String eventoNombre) {
		this.eventoNombre = eventoNombre;
	}
	
	
	
}
