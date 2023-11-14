package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import ong.dao.MySqlTarjetaDAO;
import ong.dao.MySqlDonacionFiscaDAO;
import ong.dao.MySqlDonacionVirtualDAO;
import ong.dao.MySqlDonanteDAO;
import ong.entity.DonacionFisica;
import ong.entity.DonacionVirtual;
import ong.entity.Donante;
import ong.entity.Tarjeta;

@WebServlet("/ServletDonante")
public class ServletDonante extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletDonante() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		
		if (tipo.equals("insertarfi")) {
			insertarDonante(request, response);
		}else if(tipo.equals("insertarvir")){
			insertarDonantevir(request, response);
		}else if (tipo.equals("listado")) {
			listarDonante(request, response);
		} else if(tipo.equals("insertarModal")) {
			insertarDonanteMo(request, response);
		}else if(tipo.equals("actualizar")) {
			actualizar(request, response);
		}else if(tipo.equals("eliminar")) {
			eliminar(request,response);
		}
	}

	

	private void insertarDonantevir(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		boolean respuesta=verficarSaldo(request,response);
		
		if(respuesta) {
			String email,camp,tipdon,tpmon,monto,numcuen;
			int estado=0,estado2=0;
			
			HttpSession session = request.getSession(false);

			//recuperamos el correo ingresado
			String correo = (String) session.getAttribute("codigo");
			int dniObtenido=new MySqlDonanteDAO().obtenerDNI(correo);

			email = request.getParameter("email");
			camp=request.getParameter("camp");
			tipdon=request.getParameter("tdon");
			tpmon=request.getParameter("tmone");
			monto=request.getParameter("monto");
			numcuen=request.getParameter("numcuen");
					
			DonacionVirtual bean2=new DonacionVirtual();
			bean2.setDniDonante(dniObtenido);
			bean2.setIdCampaña(Integer.parseInt(camp));
			bean2.setIdMoneda(Integer.parseInt(tpmon));
			bean2.setMonto(Double.parseDouble(monto));
			bean2.setTipoDonacion(Integer.parseInt(tipdon));
			bean2.setNumCuenta(Integer.parseInt(numcuen));
			
			boolean veri= new MySqlDonanteDAO().verificarDNI(dniObtenido);
			if(veri) {
				 estado2 = new MySqlDonacionVirtualDAO().save(bean2);
			}/*else {
				 estado = new MySqlDonanteDAO().insertar(bean);
				 estado2 = new MySqlDonacionVirtualDAO().save(bean2);
			}*/
			
			//Actualiza la tarjeta
			Tarjeta bean3=new Tarjeta();
			if(Integer.parseInt(tpmon)==2) {
				bean3.setSaldo(Double.parseDouble(monto)*3.81);
			}else {
				bean3.setSaldo(Double.parseDouble(monto));
			}
			bean3.setCvc(Integer.parseInt(request.getParameter("cvv")));
			bean3.setNumCuenta(Integer.parseInt(request.getParameter("numcuen")));
			bean3.setMes(Integer.parseInt(request.getParameter("expirationMonth")));
			bean3.setAño(Integer.parseInt(request.getParameter("expirationYear")));
			
			int estado3=new MySqlTarjetaDAO().ActualizarSaldo(bean3);
			if(estado2==1 || (estado==1 && estado2==1)) {
				request.getSession().setAttribute("MENSAJE","Exitosa");
			}else{
				request.getSession().setAttribute("MENSAJE","Fallida");
			}	
			response.sendRedirect("Donacion.jsp");
		}
	}


	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dato=request.getParameter("dato");
		String tipoMensaje;
		//invocar al método deleteById y enviar la variable "cod"
		int id=new MySqlDonacionFiscaDAO().obtenerid(Integer.parseInt(dato));
		int estado1=new MySqlDonacionFiscaDAO().deleteById(id);
		int estado=new MySqlDonanteDAO().deleteById(Integer.parseInt(dato));
		
		//validar estado
		if(estado==1) {
			 tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Donante Eliminado");
		}else {
			 tipoMensaje="error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "No se puedo eliminar");
		}
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("Donantes.jsp");}
	

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni,nom,tipoMensaje, ma, pa, dis, direc, cel, email;
		
		String dniAntiguo = request.getParameter("dniAntiguo");
		dni=request.getParameter("dni");
		nom = request.getParameter("nombre");
		ma = request.getParameter("materno");
		pa = request.getParameter("paterno");
		dis = request.getParameter("distrito");
		direc = request.getParameter("direccion");
		cel = request.getParameter("celular");
		email = request.getParameter("email");
		Donante bean = new Donante();
		bean.setDni(Integer.parseInt(dni));
		bean.setNombre(nom);
		bean.setMaterno(ma);
		bean.setPaterno(pa);
		bean.setDistrito(dis);
		bean.setCelular(Integer.parseInt(cel));
		bean.setDireccion(direc);
		bean.setEmail(email);
		int estado = new MySqlDonanteDAO().update(bean,Integer.parseInt(dniAntiguo));		
		if(estado==1) {
			tipoMensaje="warning";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Donante Actualizado");

		}else {
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Error al editar");
		}
	
		response.sendRedirect("Donantes.jsp");
	}

	private void insertarDonanteMo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni,nom, ma, pa, dis, direc, cel, email,tipoMensaje;
		
		dni=request.getParameter("dni");
		nom = request.getParameter("nombre");
		ma = request.getParameter("materno");
		pa = request.getParameter("paterno");
		dis = request.getParameter("distrito");
		direc = request.getParameter("direccion");
		cel = request.getParameter("celular");
		email = request.getParameter("email");
		Donante bean = new Donante();
		bean.setDni(Integer.parseInt(dni));
		bean.setNombre(nom);
		bean.setMaterno(ma);
		bean.setPaterno(pa);
		bean.setDistrito(dis);
		bean.setCelular(Integer.parseInt(cel));
		bean.setDireccion(direc);
		bean.setEmail(email);
		
			int estado = new MySqlDonanteDAO().insertar(bean);		
			if(estado==1) {
				request.getSession().setAttribute("MENSAJE","donante");

			}else {
				request.getSession().setAttribute("MENSAJE","error");
			}
		
			response.sendRedirect("Donacion.jsp");
	}

	private void listarDonante(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("donantes", new MySqlDonanteDAO().findAll());
		request.getRequestDispatcher("/Donantes.jsp").forward(request, response);
	}


	private void insertarDonante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email,local, des;
		int estado=0,estado1=0;
		HttpSession session = request.getSession(false);

		//recuperamos el correo ingresado
		String correo = (String) session.getAttribute("codigo");
		
		local = request.getParameter("locacion");
		des = request.getParameter("descrip");
		int dniObtenido=new MySqlDonanteDAO().obtenerDNI(correo);
		
		DonacionFisica bean1 = new DonacionFisica();
		bean1.setDniDonantes(dniObtenido);
		bean1.setIdLocal(Integer.parseInt(local));
		bean1.setDescripcion(des);
		bean1.setEstado(false);
		
		boolean veri= new MySqlDonanteDAO().verificarDNI(dniObtenido);
		if(veri==true) {
			 estado1 = new MySqlDonacionFiscaDAO().save(bean1);
		}/*else {
			 estado = new MySqlDonanteDAO().insertar(bean);
			 estado1 = new MySqlDonacionFiscaDAO().save(bean1);
		}*/
			if(estado1==1 || (estado==1 && estado1==1)) {
				request.getSession().setAttribute("MENSAJE","Donacion Exitosa");
			}else {
				request.getSession().setAttribute("MENSAJE","Fallida");
			}	
		response.sendRedirect("Donacion.jsp");
	}
	private boolean verficarSaldo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String saldo=request.getParameter("monto");
		int tipomon=Integer.parseInt(request.getParameter("tmone"));
		int numeroTarjeta = Integer.parseInt(request.getParameter("numcuen"));
		int mes = Integer.parseInt(request.getParameter("expirationMonth"));
		int ano = Integer.parseInt(request.getParameter("expirationYear"));
		int cvc = Integer.parseInt(request.getParameter("cvv"));
		Tarjeta tarjeta = new Tarjeta();
		tarjeta.setNumCuenta(numeroTarjeta);
		tarjeta.setMes(mes);
		tarjeta.setAño(ano);
		tarjeta.setCvc(cvc);
		
	      double saldoActual = new MySqlTarjetaDAO().saldoTarjeta(tarjeta);
	      if(tipomon==1) {
	    		if (saldoActual < Double.parseDouble(saldo)) {
	    			return false;
		    	   }else {
		    		   return true;
		    	   }
	      }else if(tipomon==2){
	    			if (saldoActual < Double.parseDouble(saldo)*3.81) {
		    	        return false;
		    	    }else {
		    	    	return true;
		    	    }
	      }
		return false;
	     
	}
}
