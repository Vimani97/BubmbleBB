package com.example.bubmblebb.DAO;

import com.example.bubmblebb.entity.ProductDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductsDAO{

    private Connection conn;

    public ProductDAOImpl(Connection conn){
        super();
        this.conn = conn;
    }
    @Override
    public boolean addProducts(ProductDetails p) {
        boolean f = false;
        try{
            String sql = "INSERT INTO product_details(product_name, product_brand, price, product_category, status, photo, email) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_brand());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getProduct_category());
            ps.setString(5, p.getStatus());
            ps.setString(6, p.getPhotoName());
            ps.setString(7, p.getEmail());

            int i = ps.executeUpdate();

            if(i==1){
                f = true;
            }


        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<ProductDetails> getAllProducts() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try{

            String sql="SELECT * FROM product_details";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
                    while (rs.next()){
                        p= new ProductDetails();
                        p.setProduct_Id(rs.getInt(1));
                        p.setProduct_name(rs.getString(2));
                        p.setProduct_brand(rs.getString(3));
                        p.setPrice(rs.getString(4));
                        p.setProduct_category(rs.getString(5));
                        p.setStatus(rs.getString(6));
                        p.setPhotoName(rs.getString(7));
                        p.setEmail(rs.getString(8));
                        list.add(p);

                    }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ProductDetails getProductById(int product_Id) {
        ProductDetails p = null;
        try{
            String sql = "SELECT * FROM product_details WHERE product_Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, product_Id);

            ResultSet rs = ps.executeQuery();


            while (rs.next())
            {
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  p;
    }

    @Override
    public boolean updateEditProduct(ProductDetails p) {
        boolean f = false;

        try {
            String sql = "UPDATE product_details SET product_name=?, product_brand=?, price=?, status=? where product_Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_name());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getStatus());
            ps.setInt(5, p.getProduct_Id());

             int i = ps.executeUpdate();
             if(i==1)
             {
                 f = true;
             }

        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean deleteProducts(int product_Id) {
        boolean f = false;
        try {
            String sql = "delete from product_details where product_Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1, product_Id);
           int i = ps.executeUpdate();
           if(i==1){
               f=true;
           }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<ProductDetails> getNewProduct() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where product_category=? AND status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i<4){
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
                i++;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getRecentProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i<4){
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
                i++;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getOldProducts() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where product_category=? AND status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();

            int i = 1;
            while (rs.next() && i < 4) {
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public List<ProductDetails> getAllRecentProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs = ps.executeQuery();


            while (rs.next()){
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getAllNewProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where product_category=? AND status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();


            while (rs.next()){
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getAllOldProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "SELECT * FROM product_details where product_category=? AND status=? order by product_Id DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();


            while (rs.next()) {
                p = new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<ProductDetails> getProductByOld(String email, String cate) {
        {
            List<ProductDetails> list = new ArrayList<ProductDetails>();
            ProductDetails p = null;

            try{
                    String sql = "SELECT * FROM product_details  WHERE product_category=? and email=?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, cate);
                    ps.setString(2, email);

                    ResultSet rs = ps.executeQuery();
                    while (rs.next())
                    {
                        p=new ProductDetails();
                        p.setProduct_Id(rs.getInt(1));
                        p.setProduct_name(rs.getString(2));
                        p.setProduct_brand(rs.getString(3));
                        p.setPrice(rs.getString(4));
                        p.setProduct_category(rs.getString(5));
                        p.setStatus(rs.getString(6));
                        p.setPhotoName(rs.getString(7));
                        p.setEmail(rs.getString(8));
                        list.add(p);
                    }
            }catch (Exception e){
                e.printStackTrace();
        }

            return list;
        }
    }

    @Override
    public boolean oldProductDelete(String email, String cat, int id) {

        boolean f = false;
        try {
            String sql = "DELETE FROM product_details  WHERE product_category=? and email=? and product_Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cat);
            ps.setString(2, email);
            ps.setInt(3, id);

            int i = ps.executeUpdate();
            if(i==1){
                f=true;
            }


        } catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<ProductDetails> getProductBySearch(String search) {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try{
            String sql = "SELECT * FROM product_details  WHERE product_name like ? or product_category like? or product_brand like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+search+"%");
            ps.setString(2, "%"+search+"%");
            ps.setString(3, "%"+search+"%");
            ps.setString(4, "Active");

            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                p=new ProductDetails();
                p.setProduct_Id(rs.getInt(1));
                p.setProduct_name(rs.getString(2));
                p.setProduct_brand(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProduct_category(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
                list.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }
}
