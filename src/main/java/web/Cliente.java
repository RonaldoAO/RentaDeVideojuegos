/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.ClienteDAO;
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
@WebServlet("/cliente")
public class Cliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
      
        if(accion!= null){
            switch (accion) {
                case "editar":
                    this.editar(request, response);
                    break;
                case "eliminar":
                    this.eliminar(request, response);
                    break;    
                default:
                    this.accionDefault(request, response);
            }
        }else{
            this.accionDefault(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
         System.out.println("ENTRO");
        switch (accion) {
            case "agregar":
                this.agregar(request, response);
                break;
            case "actualizar":
                this.actualizar(request, response);
                break;
            case "saludar":
                System.out.println("HOLA ");
                break;
            default:
                throw new AssertionError();
        }
    }
    public void agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClienteDAO clienteDAO = new ClienteDAO();
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        clienteDAO.insertar(new domain.Cliente(nombre, edad, telefono, correo));
        this.accionDefault(request, response);
    }
    public void accionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        ClienteDAO clienteDAO = new ClienteDAO();
        List<domain.Cliente> clientes = clienteDAO.listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("clientes", clientes);
        response.sendRedirect("clientes.jsp");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void eliminar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        System.out.println("ID CLIENTE: " + idCliente);
        int rows = new ClienteDAO().delete(new domain.Cliente(idCliente));
        this.accionDefault(request, response);
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        System.out.println("ID CLIENTE: " + idCliente);
        domain.Cliente cliente = new ClienteDAO().encontrar(new domain.Cliente(idCliente));
        System.out.println("QUESTION: " + cliente);
        request.setAttribute("cliente", cliente);
        String jspEditar = "edit/cliente.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        
        int rw = new ClienteDAO().update(new domain.Cliente(idCliente, nombre, edad, telefono, correo));
        
        this.accionDefault(request, response);
    }

}
