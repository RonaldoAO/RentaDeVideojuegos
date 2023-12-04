/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.VentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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
@WebServlet("/renta")
public class Renta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Venta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Venta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.accionDefault(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.print("Parametros: ");
        
        Enumeration<String> param = request.getParameterNames();
        while(param.hasMoreElements()){
            String encabezado = param.nextElement();
            String con = request.getParameter(encabezado);
            System.out.println(encabezado + ": " + con);
        }
        
        //Almacenar y redireccionar
        System.out.println("HOLA PUTO");
        String nombre = request.getParameter("exampleFormControlSelect1");
        float tiempo = Float.parseFloat(request.getParameter("exampleInputPassword1"));
        //Calcular en minutos y sacar venta
        System.out.println("Tiempo: " + tiempo);
        System.out.println("DATOS: " + nombre );
        
        VentaDAO venta = new VentaDAO();
        //venta.insertar(new domain.Venta(nombre, calculoDePrecio(tiempo))); 
        response.sendRedirect("test.jsp");
    }

    public int calculoDePrecio(float segundos){
        if(segundos<60){
            return 0;
        }else{
            float tiempo = 60/segundos;//En minutos
            float tiempoporhora = 60/tiempo;
            int x = (int) (tiempoporhora * 25); 
            return x;
        }
        
        
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VentaDAO venta = new VentaDAO();
        List<domain.Venta> ventas = venta.listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("ventas", ventas);
        response.sendRedirect("ventas.jsp");
    }

}