package com.example.bubmblebb.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection conn;
    public  static Connection getConn(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bumblebee_db","root","Ashika@12345");
        } catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }

}
