package com.portal.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // ✅ Correct connection URL for MySQL 8+
    private static final String URL =
        "jdbc:mysql://localhost:3306/studentdb?useSSL=false&allowPublicKeyRetrieval=true&requireSSL=false&defaultAuthenticationPlugin=caching_sha2_password&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {
        Connection con = null;
        try {
            // ✅ MySQL 8+ driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Database Connected Successfully!");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ Failed to connect to the Database!");
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) {
        Connection testCon = getConnection();
        if (testCon != null) {
            System.out.println("🎯 Connection Test Successful!");
        } else {
            System.out.println("⚠️ Connection Test Failed!");
        }
    }
}
