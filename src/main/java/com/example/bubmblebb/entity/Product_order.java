package com.example.bubmblebb.entity;

public class Product_order {

    private int id;
    private String order_id;
    private String userName;
    private String email;
    private String phone;
    private  String fulladd;

    private String productName;
    private  String brandName;
    private String price;
    private String paymentType;

    public Product_order(){
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFulladd() {
        return fulladd;
    }

    public void setFulladd(String fulladd) {
        this.fulladd = fulladd;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Product_order{" +
                "id=" + id +
                ", order_id='" + order_id + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", fulladd='" + fulladd + '\'' +
                ", productName='" + productName + '\'' +
                ", brandName='" + brandName + '\'' +
                ", price='" + price + '\'' +
                ", paymentType='" + paymentType + '\'' +
                '}';
    }
}
