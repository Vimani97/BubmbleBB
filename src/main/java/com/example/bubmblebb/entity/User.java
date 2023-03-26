package com.example.bubmblebb.entity;

public class User {

    private int id;
    private String name;
    private String email;
    private String nic;
    private String dob;
    private String phone;
    private String password;
    private String address;
    private String city;
    private String state;
    private String zip;
    private  int loanbalance;
    private int usedamount;


    public User(){
        super();
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public int getLoanbalance() {
        return loanbalance;
    }

    public void setLoanbalance(int loanbalance) {
        this.loanbalance = loanbalance;
    }

    public int getUsedamount() {
        return usedamount;
    }

    public void setUsedamount(int usedamount) {
        this.usedamount = usedamount;
    }


    @Override
    public String toString() {
        return "User{" +
              //  "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", nic='" + nic + '\'' +
                ", dob='" + dob + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", zip='" + zip + '\'' +
                ", loanbalance=" + loanbalance +
                ", usedamount=" + usedamount +
                '}';
    }
}
