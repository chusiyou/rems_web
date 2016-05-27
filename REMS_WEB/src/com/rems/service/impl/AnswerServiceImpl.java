package com.rems.service.impl;

import java.util.List;

import com.rems.service.AnswerService;
import com.rems.vo.Answer;
import com.rems.vo.AnswerDAO;

public class AnswerServiceImpl implements AnswerService {
	
	private AnswerDAO answerDAO;
	

	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}

	public void addAnswer(Answer as) {
		answerDAO.save(as);
	}

	public Answer queryAnswerById(Integer answerId) {
		return answerDAO.findById(answerId);
	}

	public void updateAnswer(Answer as) {
		answerDAO.merge(as);
	}

	public Integer queryAnsDoctorCount(Integer doctorId) {
		return answerDAO.queryAnsDoctorCount(doctorId);
	}

	public void deleteAnswer(Answer as) {
		answerDAO.delete(as);
	}


}
