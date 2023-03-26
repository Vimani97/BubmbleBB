package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.Product_order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Product_OrderDAOImpl implements Product_Order_DAO{

   private Connection conn;

   public Product_OrderDAOImpl(Connection conn){
       super();
       this.conn = conn;
   }

   /* @Override
    public int getOrderNo() {
       int i = 1;
       try{
            String sql = "select * from product_order";
            PreparedStatement ps = conn.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while (rs.next())
           {
                i++;
           }

       }catch (Exception e){
           e.printStackTrace();
       }
        return i;
    }*/

    @Override
    public boolean saveOrder(List<Product_order> plist) {

       boolean f = false;
       try{
            String sql = "insert into product_order(order_id,user_name,email,address,phone,product_name,product_brand,price,payment) values(?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (Product_order p:plist)
            {
                ps.setString(1, p.getOrder_id());
                ps.setString(2, p.getUserName());
                ps.setString(3, p.getEmail());
                ps.setString(4, p.getFulladd());
                ps.setString(5, p.getPhone());
                ps.setString(6, p.getProductName());
                ps.setString(7, p.getBrandName());
                ps.setString(8, p.getPrice());
                ps.setString(9, p.getPaymentType());
                ps.addBatch();

            }
                int[] count= ps.executeBatch();
                conn.commit();
                f=true;
                conn.setAutoCommit(true);

       }catch(Exception e){
           e.printStackTrace();
       }


       return f;
    }

    @Override
    public List<Product_order> getProduct(String email) {

        List<Product_order> list = new ArrayList<Product_order>();
        Product_order o = null;
       try{
           String sql = "select * from product_order where email=?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, email);
           ResultSet rs = ps.executeQuery();
           while (rs.next())
           {
                o = new Product_order();
                o.setId(rs.getInt(1));
                o.setOrder_id(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFulladd(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setProductName(rs.getString(7));
                o.setBrandName(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
           }

       }catch (Exception e){
           e.printStackTrace();
       }

        return list;
    }

    @Override
    public List<Product_order> getAllOrder() {
        List<Product_order> list = new ArrayList<Product_order>();
        Product_order o = null;
        try{
            String sql = "select * from product_order";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                o = new Product_order();
                o.setId(rs.getInt(1));
                o.setOrder_id(rs.getString(2));
                o.setUserName(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFulladd(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setProductName(rs.getString(7));
                o.setBrandName(rs.getString(8));
                o.setPrice(rs.getString(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }
}