package com.rems.service;

import java.util.List;

import com.rems.vo.PatientVO;
import com.rems.vo.Question;

public interface QuestionService {
	
	
	public void addQuestion(Question vo);
	
	public void updateQuestion(Question vo);
	
	public List findQuestionBySearch(Question vo,Integer page);
	
	public Question findQuestionById(Integer qId);
	
	public Integer questionCount(Question vo) ;
	
	public List findQuestionListByPatientId(Integer patientId);
	
	public void deleteQuestion(Question vo);

}
