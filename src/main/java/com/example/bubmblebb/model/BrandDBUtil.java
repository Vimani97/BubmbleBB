package com.example.bubmblebb.model;

import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.Brand;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BrandDBUtil {

    private static boolean isSuccess = false;
    private static Connection conn = null;
    private  static Statement stmt = null;
    private static ResultSet rs= null;


    //Function use to get All brand details---------------------------------------------------------------------------------
    public static List<Brand> getBrandList()
    {
        ArrayList<Brand> brands = new ArrayList<>();

        try
        {
            conn = DBConnection.getConn();
            stmt = conn.createStatement();

            String sql = "select * from brands";
            rs = stmt.executeQuery(sql);

            while (rs.next())
            {

                int id = rs.getInt(1);
                String name = rs.getString(2);

                Brand brand = new Brand(id,name);

                brands.add(brand);

            }

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }

        return  brands;

    }
    //End oif function use to get brand details-------------------------------------------------------------------------

    ///Function use to insert-------------------------------------------------------------------------------------------
    public static boolean insertBrand(String brandName)
    {

        try
        {

            conn = DBConnection.getConn();
            stmt = conn.createStatement();

            String sql = "INSERT INTO brands VALUES (0,'"+brandName+"')";

            int rs = stmt.executeUpdate(sql);

            if(rs>0)
            {
                isSuccess = true;
            }
            else
            {
                isSuccess = false;
            }

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }


        return isSuccess;
    }
    ///End of Function use to insert------------------------------------------------------------------------------------




}
