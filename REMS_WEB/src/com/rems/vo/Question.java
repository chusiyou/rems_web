package com.rems.vo;

import java.util.Date;

/**
 * Question entity. @author MyEclipse Persistence Tools
 */

public class Question implements java.io.Serializable {

	// Fields

	private Integer id;
	private String question;
	private Integer userId;
	private Integer answerId;
	private Integer state;
	private Integer subjectId;
	private String title;
	private Date createTime;

	// Constructors

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/** default constructor */
	public Question() {
	}

	/** minimal constructor */
	public Question(String question, Integer userId, Integer state,
			Integer subjectId) {
		this.question = question;
		this.userId = userId;
		this.state = state;
		this.subjectId = subjectId;
	}

	/** full constructor */
	public Question(String question, Integer userId, Integer answerId,
			Integer state, Integer subjectId) {
		this.question = question;
		this.userId = userId;
		this.answerId = answerId;
		this.state = state;
		this.subjectId = subjectId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getAnswerId() {
		return this.answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

}