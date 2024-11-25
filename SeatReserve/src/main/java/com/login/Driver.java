package com.login;

public class Driver {
    private int did;
    private String dname;
    private String phone;
    private String demail;
    private String nic;
    private String dusername;
    private String dpassword; // Consider how and where you use this

    public Driver(int did, String dname, String phone, String demail, String nic, String dusername, String dpassword) {
        this.did = did;
        this.dname = dname;
        this.phone = phone;
        this.demail = demail;
        this.nic = nic;
        this.dusername = dusername;
        this.dpassword = dpassword; // Store only if necessary
    }

    public int getDid() {
        return did;
    }

    public String getDname() {
        return dname;
    }

    public String getPhone() {
        return phone;
    }

    public String getDemail() {
        return demail;
    }

    public String getNic() {
        return nic;
    }

    public String getDusername() {
        return dusername;
    }

    // Remove the password getter if not needed
     public String getDpassword() {
        return dpassword;
     }

    @Override
    public String toString() {
        return "Driver{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", phone='" + phone + '\'' +
                ", demail='" + demail + '\'' +
                ", nic='" + nic + '\'' +
                ", dusername='" + dusername + '\'' +
                '}';
    }
}
