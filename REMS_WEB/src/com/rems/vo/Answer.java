package com.rems.vo;

import java.util.Date;

/**
 * Answer entity. @author MyEclipse Persistence Tools
 */

public class Answer implements java.io.Serializable {

	// Fields

	private Integer id;
	private String answer;
	private Integer doctorId;
	private Integer state;
	private Date createTime;

	// Constructors

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/** default constructor */
	public Answer() {
	}

	/** full constructor */
	public Answer(String answer, Integer doctorId, Integer state) {
		this.answer = answer;
		this.doctorId = doctorId;
		this.state = state;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getDoctorId() {
		return this.doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}