package com.rems.service;

import java.util.List;

import com.rems.vo.Answer;

public interface AnswerService {
	
	
	public void addAnswer(Answer as);
	
	public Answer queryAnswerById(Integer answerId);
	
	public void updateAnswer(Answer as);
	
	public Integer queryAnsDoctorCount(Integer doctorId);
	
	public void deleteAnswer(Answer as);
	

}
