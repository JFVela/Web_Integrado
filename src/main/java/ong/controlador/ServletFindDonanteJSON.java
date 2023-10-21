package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.*;
import ong.entity.Donante;

@WebServlet("/ServletFindDonanteJSON")
public class ServletFindDonanteJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletFindDonanteJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("UTF-8");
				String dni=request.getParameter("dni");
				Donante bean=new MySqlDonanteDAO().findById(Integer.parseInt(dni));
				Gson gson=new Gson();
				String json=gson.toJson(bean);
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter pw=response.getWriter();
				pw.print(json);
	}

}
