/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paypoint;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
import javax.swing.JOptionPane;


/**
 *
 * @author Windows 10
 */
public class Transaksi {
    Connection conn = null;
    PreparedStatement stmt = null;
    Statement st = null;
    ResultSet rs = null;
    public Transaksi(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/pbo_inven","root","");
            st = conn.createStatement();
            JOptionPane.showMessageDialog(null, "Berhasil Koneksi");
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, "Gagal Terhubung Ke Koneksi, karena "+ex);
        }
        
    }
    public void storeTransaksi(ResultSet resultSet){
        
    }
    
    
    
    
    
}
