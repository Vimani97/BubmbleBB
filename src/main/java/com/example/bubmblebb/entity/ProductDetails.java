package com.example.bubmblebb.entity;

import java.util.Objects;

public class ProductDetails {

    public int product_Id;
    public String product_name;
    public String product_brand;
    public String price;
    public String product_category;
    public String status;
    public String photoName;

    public String email;

    public Double loanbalance;

    public Double usedamount;
    public ProductDetails(){

        super();
    }



  //  public ProductDetails(int product_Id)//, String product_name, String product_brand, String price, String product_category, String status, String photoName, String email) {
   //     this.product_Id = product_Id;
  //      this.product_name = product_name;
  //      this.product_brand = product_brand;
  //      this.price = price;
  //      this.product_category = product_category;
  //      this.status = status;
  //      this.photoName = photoName;
  //      this.email = email;
  //  }

    public ProductDetails(String product_name, String product_brand, String price, String product_category, String status, String photoName, String email) {
        super();
        this.product_name = product_name;
        this.product_brand = product_brand;
        this.price = price;
        this.product_category = product_category;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
    }

    public int getProduct_Id() {

        return product_Id;
    }

    public void setProduct_Id(int product_Id) {

        this.product_Id = product_Id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_brand() {
        return product_brand;
    }

    public void setProduct_brand(String product_brand) {
        this.product_brand = product_brand;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getProduct_category() {
        return product_category;
    }

    public void setProduct_category(String product_category) {
        this.product_category = product_category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Double getLoanbalance() {
        return loanbalance;
    }

    public void setLoanbalance(Double loanbalance) {
        this.loanbalance = loanbalance;
    }

    public Double getUsedamount() {
        return usedamount;
    }

    public void setUsedamount(Double usedamount) {
        this.usedamount = usedamount;
    }

    @Override
    public String toString() {
        return "ProductDetails{" +
              //  "product_Id=" + product_Id +
                ", product_name='" + product_name + '\'' +
                ", product_brand='" + product_brand + '\'' +
                ", price=" + price +
                ", product_category='" + product_category + '\'' +
                ", status='" + status + '\'' +
                ", photoName='" + photoName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
