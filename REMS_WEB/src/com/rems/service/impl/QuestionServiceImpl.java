package com.rems.service.impl;

import java.util.List;

import com.rems.service.QuestionService;
import com.rems.vo.Question;
import com.rems.vo.QuestionDAO;

public class QuestionServiceImpl implements QuestionService {
	
	private QuestionDAO  questionDAO;
	

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public void addQuestion(Question vo) {
		questionDAO.save(vo);
	}

	public Question findQuestionById(Integer id) {
		return questionDAO.findById(id);
	}

	public List findQuestionBySearch(Question vo ,Integer page) {
		return questionDAO.findQuestionBySearch(vo, page);
	}

	public void updateQuestion(Question vo) {
		questionDAO.merge(vo);
	}

	public Integer questionCount(Question vo) {
		return questionDAO.questionCount(vo);
	}

	public void deleteQuestion(Question vo) {
		questionDAO.delete(vo);
	}

	public List findQuestionListByPatientId(Integer patientId) {
		return questionDAO.findByUserId(patientId);
	}

}
