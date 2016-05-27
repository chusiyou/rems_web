package com.rems.vo;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer id;
	private String subjectCode;
	private String subjectName;
	private Integer state;

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(String subjectCode, String subjectName, Integer state) {
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.state = state;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSubjectCode() {
		return this.subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return this.subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}