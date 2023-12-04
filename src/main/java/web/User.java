/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.EmpleadoDAO;
import domain.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ronaldo
 */
@WebServlet("/user")
public class User extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("register".equals(accion)) {
            this.register(request, response);
        } else if ("login".equals(accion)) {
            this.login(request, response);
        } else if ("logout".equals(accion)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", null);
            request.getRequestDispatcher("main01.jsp").forward(request, response);
        }

    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        String nombre = request.getParameter("username");
        String email = request.getParameter("email");
        String  telefono = request.getParameter("telefono");
        String password = request.getParameter("password");
        
        Empleado empleado = new Empleado(nombre, email, telefono, password);
        
            int countRows = empleadoDAO.insertar(empleado);
            if (countRows > 0) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("empleado", empleado);
                response.sendRedirect("Principal.jsp");
            } else {
                request.setAttribute("status", "failure");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        EmpleadoDAO empleadoDao = new EmpleadoDAO();
        Empleado empleado = empleadoDao.login(new Empleado(username, password));
        if (empleado != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("empleado", empleado);
            response.sendRedirect("Principal.jsp");
        } else {
            request.setAttribute("status", "failure");
            request.getRequestDispatcher("main01.jsp").forward(request, response);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
