/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet("/producto")
public class Producto extends HttpServlet {

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
            out.println("<title>Servlet Producto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Producto at " + request.getContextPath() + "</h1>");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void agregar(HttpServletRequest request, HttpServletResponse response) 
       throws ServletException, IOException{
        ProductoDAO prod = new ProductoDAO();
        String nombre = request.getParameter("nombre");
        System.out.println("");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String tamanio = request.getParameter("tamanio");
        String unidad  = request.getParameter("unidad");
        int stock = 2;
        String gramaje = tamanio + unidad;
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        
        prod.insertar(new domain.Producto(stock, nombre, precio, descripcion, stock, gramaje, cantidad)); 
        this.accionDefault(request, response);
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException{
        ProductoDAO prod = new ProductoDAO();
        System.out.println("ACCION DEFAULT");
        List<domain.Producto> productos = prod.listar();
        for (domain.Producto producto : productos) {
            System.out.println(producto);
        }
        HttpSession sesion = request.getSession();
        sesion.setAttribute("productos", productos);
        response.sendRedirect("productos.jsp");
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductoDAO prod = new ProductoDAO();
        domain.Producto producto = prod.encontrar(new domain.Producto(Integer.parseInt(request.getParameter("idproducto"))));
        request.setAttribute("producto", producto);
        request.getRequestDispatcher("edit/producto.jsp").forward(request, response);
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        ProductoDAO prod = new ProductoDAO();
        prod.delete(new domain.Producto(Integer.parseInt(request.getParameter("idproducto")))); 
        try {
            this.accionDefault(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
