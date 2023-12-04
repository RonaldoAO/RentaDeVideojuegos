/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import domain.Producto;
import domain.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Ronaldo
 */
public class VentaDAO {
    private static final String SQL_SELECT = "SELECT * FROM venta";
    private static final String SQL_INSERT = "INSERT INTO venta(date, cambio, total, pago)"
            + " VALUES(?, ?, ?, ?)";
    private static final String SQL_FIND = "SELECT * FROM venta WHERE  date = ?";
    public List<Venta> listar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Venta venta;
        List<Venta> ventas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idventa = rs.getInt("idventa");
                String fecha = rs.getString("date");
                double cambio = rs.getDouble("cambio");
                double total = rs.getDouble("total");
                double pago = rs.getDouble("pago");
                        
                venta = new Venta(idventa, fecha, total, cambio, pago); 
                ventas.add(venta);
                //System.out.println(producto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return ventas;
    }
    
    public Venta buscar(String fecha){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Venta venta = new Venta(fecha);
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_FIND);
            stmt.setString(1, fecha);
            

            rs = stmt.executeQuery();
            if(rs.next()){
                venta.setIdVenta(rs.getInt("idventa"));
                venta.setCambio(rs.getDouble("cambio"));
                venta.setTotal(rs.getDouble("total"));
                venta.setPago(rs.getDouble("pago"));
            }else{
                return null;
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return venta;
    }
    
    public int insertar(Venta venta) {
        Connection conn = null;
        PreparedStatement stmt = null;
        LocalDateTime now  = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, now.format(formatter) );
            stmt.setDouble(2, venta.getCambio());
            stmt.setDouble(3, venta.getTotal());
            stmt.setDouble(4, venta.getPago());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
}
