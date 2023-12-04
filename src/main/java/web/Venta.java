/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import datos.ProductoDAO;
import datos.VentaDAO;
import domain.tableprods;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet("/venta")
public class Venta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        System.out.println("ENTRO");
        if (accion != null) {
            switch (accion) {
                case "eliminar":
                    System.out.println("Hola");
                    this.eliminarDeTabla(request, response);
                    break;
                case "generarVenta":
                    this.generarVenta(request, response);
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
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
        System.out.println("HOLA");
        String accion = request.getParameter("accion");
        System.out.println("ENTRO");
        switch (accion) {
            case "agregarATabla":
                this.agregarATabla(request, response);
                break;
            case "agregar":
                System.out.println("Hola mundo");
                this.agregar(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    public int calculoDePrecio(float segundos) {
        if (segundos < 60) {
            return 0;
        } else {
            float tiempo = 60 / segundos;//En minutos
            float tiempoporhora = 60 / tiempo;
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

    private void agregarATabla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("exampleFormControlSelect1");
        int cantidad = Integer.parseInt(request.getParameter("edad"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession sesion = request.getSession();
        //Total
        double x = (double) sesion.getAttribute("total");
        sesion.setAttribute("total", x + precio);
        
        
        System.out.println(nombre + " " + cantidad + " " + id);
        List<tableprods> tb = (sesion.getAttribute("registros") != null) ? (List<tableprods>) sesion.getAttribute("registros") : new ArrayList<>();
        tableprods row = new tableprods(id, nombre, cantidad, precio);
        tb.add(row);
        sesion.setAttribute("registros", tb);

        request.getRequestDispatcher("venta.jsp").forward(request, response);

    }

    private void eliminarDeTabla(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession sesion = request.getSession();
        List<tableprods> tb = (List<tableprods>) sesion.getAttribute("registros");
        int id = Integer.parseInt(request.getParameter("idproducto"));
        double precio = 0;
        for (int i = 0; i < tb.size(); i++) {
            if(tb.get(i).getIdProducto() == id){
                 precio = tb.get(i).getPrecio();
                tb.remove(i);
                
            }
            
        }
        sesion.setAttribute("total", (double)sesion.getAttribute("total") - precio);
        sesion.setAttribute("registros", tb);
        response.sendRedirect("venta.jsp");
    }

    private void generarVenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("total", 0.0);
        sesion.setAttribute("registros", null);
        response.sendRedirect("venta.jsp");
    }

    private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        double total = Double.parseDouble(request.getParameter("total"));
        double cambio = Double.parseDouble(request.getParameter("cambio"));
        double pago = Double.parseDouble(request.getParameter("efectivo"));
        VentaDAO ventaDao = new VentaDAO();
        ProductoDAO prodcutoDao = new ProductoDAO();
        HttpSession sesion = request.getSession();
        
        //Reducir a la tabla producto
        List<tableprods> tb = (List<tableprods>) sesion.getAttribute("registros");
        List<domain.Producto> pd  =  (List<domain.Producto>)sesion.getAttribute("productos");
        for (tableprods object : tb) {
            for (domain.Producto producto : pd) {
                if(producto.getIdProducto() == object.getIdProducto()){
                    producto.setCantidad(producto.getCantidad() - object.getCantidad());
                    System.out.println(producto);
                    prodcutoDao.update(producto);
                }
            }
        }
        
        
        
        ventaDao.insertar(new domain.Venta(total, cambio, pago));
        this.accionDefault(request, response);
    }

}
