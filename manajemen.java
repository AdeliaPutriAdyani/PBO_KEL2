package manajemen;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.DriverManager;
import java.sql.SQLException;

public class manajemen {
    String jdbcDriver = "com.mysql.jdbc.Driver";
    String dbUrl = "jdbc:mysql://localhost/pbo_inven";
    String user = "root";
    String password = "";

    Connection con;
    Statement st;
    ResultSet rs;
    PreparedStatement ps;
    
    boolean respons;
    
    public manajemen (){
        try {
            Class.forName(jdbcDriver);
            System.out.println("driver load.");
        } catch (ClassNotFoundException ex) {
            System.out.println("driver tidak ditemukan");
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            con = DriverManager.getConnection(dbUrl, user, password);
            System.out.println("berhasil terkoneksi dengan mysql");
        } catch (SQLException ex) {
            System.out.println("gagal terkoneksi periksa config mysql");
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean insertManajemen(String KODE_BARANG, String NAMA_BARANG, String HARGA_BARANG, String STOK_BARANG) {
        String query = "insert into manajemen (KODE_BARANG, NAMA_BARANG, HARGA_BARANG, STOK_BARANG) values (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, KODE_BARANG);            
            ps.setString(2, NAMA_BARANG);
            ps.setString(3, HARGA_BARANG);
            ps.setString(4, STOK_BARANG);
            ps.executeUpdate();
            respons = true;
            System.out.println("sukses insert.");
        } catch (SQLException ex) {
            respons = false;
            System.out.println("gagal insert.");
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return respons; 
    }
    
    public ResultSet getAllManajemen() {
        String query = "select * from manajemen";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public boolean updateManajemen(String KODE_BARANG, String NAMA_BARANG, String HARGA_BARANG, String STOK_BARANG) {
        String query = "update manajemen set NAMA_BARANG = ?, HARGA_BARANG = ?, STOK_BARANG = ? where KODE_BARANG = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, NAMA_BARANG);            
            ps.setString(2, HARGA_BARANG);
            ps.setString(3, STOK_BARANG);
            ps.setString(4, KODE_BARANG);
            ps.executeUpdate();
            respons = true;
            System.out.println("sukses update.");
        } catch (SQLException ex) {
            respons = false;
            System.out.println("gagal update.");
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return respons; 
    }
    
    public void deleteManajemen(String KODE_BARANG) {
        String query = "delete from manajemen where KODE_BARANG = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, KODE_BARANG);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(manajemen.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
