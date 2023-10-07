package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import ong.dao.MySqlTarjetaDAO;
import ong.dao.MySqlDonacionFiscaDAO;
import ong.dao.MySqlDonacionVIrtualDAO;
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
		String tipo = request.getParameter("accion");
		if (tipo.equals("insertar")) {
			insertarDonante(request, response);
		} else if (tipo.equals("listado"))
			listarDonante(request, response);
	}

	private void listarDonante(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("donantes", new MySqlDonanteDAO().findAll());
		request.getRequestDispatcher("/TablaDonante.jsp").forward(request, response);
	}


	private void insertarDonante(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tp,dni,nom, ma, pa, ciu, direc, cel, email;
		
		tp=request.getParameter("tipodedonao");
		
		dni=request.getParameter("dni");
		nom = request.getParameter("nombre");
		ma = request.getParameter("materno");
		pa = request.getParameter("paterno");
		ciu = request.getParameter("ciudad");
		direc = request.getParameter("direccion");
		cel = request.getParameter("celular");
		email = request.getParameter("email");
		
		Donante bean = new Donante();
		bean.setDni(Integer.parseInt(dni));
		bean.setNombre(nom);
		bean.setMaterno(ma);
		bean.setPaterno(pa);
		bean.setCiudad(ciu);
		bean.setCelular(Integer.parseInt(cel));
		bean.setDireccion(direc);
		bean.setEmail(email);

		int estado = new MySqlDonanteDAO().insertar(bean);

		if (Integer.parseInt(tp) == 1) {
			String local, des;
			dni=request.getParameter("dni");
			local = request.getParameter("locacion");
			des = request.getParameter("descrip");
			
			DonacionFisica bean1 = new DonacionFisica();
			bean1.setDniDonantes(Integer.parseInt(dni));
			bean1.setIdLocal(Integer.parseInt(local));
			bean1.setDescripcion(des);

			int estado1 = new MySqlDonacionFiscaDAO().save(bean1);
		} else if(Integer.parseInt(tp) == 2) {
			String camp,tipdon,tpmon,monto,numcuen;
			dni=request.getParameter("dni");
			camp=request.getParameter("camp");
			tipdon=request.getParameter("tdon");
			tpmon=request.getParameter("tmone");
			monto=request.getParameter("monto");
			numcuen=request.getParameter("numcuen");
			
			DonacionVirtual bean2=new DonacionVirtual();
			bean2.setDniDonante(Integer.parseInt(dni));
			bean2.setIdCampaña(Integer.parseInt(camp));
			bean2.setIdMoneda(Integer.parseInt(tpmon));
			bean2.setMonto(Double.parseDouble(monto));
			bean2.setTipoDonacion(Integer.parseInt(tipdon));
			bean2.setNumCuenta(Integer.parseInt(numcuen));
			int estado2 = new MySqlDonacionVIrtualDAO().save(bean2);
			
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
		}
		//Sesion
		request.getSession().setAttribute("MENSAJE","Donacion Exitosa");
		
		//Sale el error:
		//request.getRequestDispatcher("Donacion.jsp").forward(request, response);
		
		response.sendRedirect("Donacion.jsp");
	}

}
