/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pelanggan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
/**
 *
 * @author DELL
 */
public class koneksi {
    private Connection koneksi;
    public Connection conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Koneksi Berhasil");
        }
        catch (ClassNotFoundException ex) {
            System.out.println("Koneksi Gagal" + ex);
        }
        String url = "jdbc:mysql://localhost:8111/db_toko";
        try {
            koneksi = DriverManager.getConnection(url, "root", "");
            System.out.println("Koneksi Database Berhasil");
        }
        catch (SQLException ex) {
            System.out.println("Koneksi Database Gagal" + ex);
        }
        return koneksi;
    }
}
