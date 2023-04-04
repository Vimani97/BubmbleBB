package com.example.bubmblebb.model;

import com.example.bubmblebb.DB.DBConnection;
import com.example.bubmblebb.entity.Brand;
import com.example.bubmblebb.entity.ProductDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
          //  String sql = "INSERT INTO brands(brandName) VALUES (?)";
         //   String sql = "INSERT INTO product_details(product_name, product_brand, price, product_category, status, photo, email) values (?,?,?,?,?,?,?)";

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

    ///function use to delete the brand from db----------------------------------------------------------------------
    public static boolean deleteBrand(String id)
    {
        try
        {

            conn = DBConnection.getConn();
            stmt = conn.createStatement();

            int convertedID = Integer.parseInt(id);

            String sql = "DELETE FROM brands  WHERE  ID='"+convertedID+"' ";

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

        return  isSuccess;
    }
    ///End of function use to delete the brand from db---------------------------------------------------------------



}
