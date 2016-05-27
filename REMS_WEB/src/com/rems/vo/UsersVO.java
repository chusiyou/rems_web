package com.rems.vo;
// default package



/**
 * UsersVO entity. @author MyEclipse Persistence Tools
 */

public class UsersVO  implements java.io.Serializable {


    // Fields    

     private Integer userid;
     private Integer gh;
     private String pass;
     private String wt;
     private String da;
     private String type;
     private String yx;


    // Constructors

    /** default constructor */
    public UsersVO() {
    }

    
    /** full constructor */
    public UsersVO(Integer gh, String pass, String wt, String da, String type, String yx) {
        this.gh = gh;
        this.pass = pass;
        this.wt = wt;
        this.da = da;
        this.type = type;
        this.yx = yx;
    }

   
    // Property accessors

    public Integer getUserid() {
        return this.userid;
    }
    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGh() {
        return this.gh;
    }
    
    public void setGh(Integer gh) {
        this.gh = gh;
    }

    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getWt() {
        return this.wt;
    }
    
    public void setWt(String wt) {
        this.wt = wt;
    }

    public String getDa() {
        return this.da;
    }
    
    public void setDa(String da) {
        this.da = da;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public String getYx() {
        return this.yx;
    }
    
    public void setYx(String yx) {
        this.yx = yx;
    }
   








}