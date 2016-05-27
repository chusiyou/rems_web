package com.rems.vo;
// default package

import java.util.Date;


/**
 * DoctorVO entity. @author MyEclipse Persistence Tools
 */

public class DoctorVO  implements java.io.Serializable {


    // Fields    

     private Integer userid;
     private String username;
     private String num;
     private String addr;
     private String col;
     private String sex;
     private String mail;
     private String mz;
     private String cel;
     private Date birth;
     private Date rynf;
     private String pro;
     private String marry;
     private String bzzt;
     private Integer age;
     
     public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}

	private String sysname;
     private String syspass;
     private String userimage;


    // Constructors

    public String getSysname() {
		return sysname;
	}


	public void setSysname(String sysname) {
		this.sysname = sysname;
	}


	public String getSyspass() {
		return syspass;
	}


	public void setSyspass(String syspass) {
		this.syspass = syspass;
	}


	public String getUserimage() {
		return userimage;
	}


	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}


	/** default constructor */
    public DoctorVO() {
    }

    
    /** full constructor */
    public DoctorVO(String username, String num, String addr, String col, String sex, String mail, String mz, String cel, Date birth, Date rynf, String pro, String marry, String bzzt) {
        this.username = username;
        this.num = num;
        this.addr = addr;
        this.col = col;
        this.sex = sex;
        this.mail = mail;
        this.mz = mz;
        this.cel = cel;
        this.birth = birth;
        this.rynf = rynf;
        this.pro = pro;
        this.marry = marry;
        this.bzzt = bzzt;
    }

   
    // Property accessors

    public Integer getUserid() {
        return this.userid;
    }
    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getNum() {
        return this.num;
    }
    
    public void setNum(String num) {
        this.num = num;
    }

    public String getAddr() {
        return this.addr;
    }
    
    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getCol() {
        return this.col;
    }
    
    public void setCol(String col) {
        this.col = col;
    }

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMail() {
        return this.mail;
    }
    
    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMz() {
        return this.mz;
    }
    
    public void setMz(String mz) {
        this.mz = mz;
    }

    public String getCel() {
        return this.cel;
    }
    
    public void setCel(String cel) {
        this.cel = cel;
    }

    public Date getBirth() {
        return this.birth;
    }
    
    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Date getRynf() {
        return this.rynf;
    }
    
    public void setRynf(Date rynf) {
        this.rynf = rynf;
    }

    public String getPro() {
        return this.pro;
    }
    
    public void setPro(String pro) {
        this.pro = pro;
    }

    public String getMarry() {
        return this.marry;
    }
    
    public void setMarry(String marry) {
        this.marry = marry;
    }

    public String getBzzt() {
        return this.bzzt;
    }
    
    public void setBzzt(String bzzt) {
        this.bzzt = bzzt;
    }
   








}