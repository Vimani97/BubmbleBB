package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImlp implements UserDAO{

    private Connection conn;

    public UserDAOImlp(Connection conn){
        super();
        this.conn = conn;
    }


    public boolean userRegister(User us) {
        boolean f = false;

        try{
            String sql = "insert into user(name,email,nic,dob,phone,password)values (?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getNic());
            ps.setString(4, us.getDob());
            ps.setString(5, us.getPhone());
            ps.setString(6, us.getPassword());

            int i =ps.executeUpdate();
            if (i==1){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public  User login(String email, String password) {
        User us = null;

       try{
           String sql= "select * from user where email=? and password=?";
           PreparedStatement ps = conn.prepareStatement(sql);

           ps.setString(1, email);
           ps.setString(2, password);

           ResultSet rs = ps.executeQuery();
           while (rs.next())
           {
               us=new User();
               us.setId(rs.getInt(1));
               us.setName(rs.getString(2));
               us.setEmail(rs.getString(3));
               us.setNic(rs.getString(4));
               us.setDob(rs.getString(5));
               us.setPhone(rs.getString(6));
               us.setPassword(rs.getString(7));

               us.setAddress(rs.getString(8));
               us.setCity(rs.getString(9));
               us.setState(rs.getString(10));
               us.setZip(rs.getString(11));
               us.setLoanbalance(rs.getInt(12));
               us.setUsedamount(rs.getInt(13));



           }
       }catch (Exception e){
           e.printStackTrace();
       }
            return us;
    }

    @Override
    public boolean checkPassword(int id,String ps) {
       boolean f = false;
       try{
            String sql = "select * from user where id=? and password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1,id);
            pst.setString(2, ps);

            ResultSet rs = pst.executeQuery();
            while (rs.next())
            {
                f = true;
            }

       }catch (Exception e){
           e.printStackTrace();
       }

        return f;
    }

    @Override
    public boolean updateProfile(User us) {
        boolean f = false;

        try{
            String sql = "update user set name=?,email=?,nic=?,dob=?,phone=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getNic());
            ps.setString(4, us.getDob());
            ps.setString(5, us.getPhone());
            ps.setInt(6, us.getId());

            int i =ps.executeUpdate();
            if (i==1){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean checkUser(String em) {

        boolean f = true;
        try{

            String sql = "select * from user where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, em);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                f=false;
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
