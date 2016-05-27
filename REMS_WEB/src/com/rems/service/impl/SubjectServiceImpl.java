package com.rems.service.impl;

import java.util.List;

import com.rems.service.SubjectService;
import com.rems.vo.Subject;
import com.rems.vo.SubjectDAO;

public class SubjectServiceImpl implements SubjectService {
	
	private SubjectDAO subjectDAO;
	

	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}

	public void addSubject(Subject vo) {
		subjectDAO.save(vo);
	}

	public void deleteSubject(Subject vo) {
		subjectDAO.delete(vo);
	}

	public Subject findSubjectById(Integer id) {
		return subjectDAO.findById(id);
	}

	public List getAllSubject() {
		return subjectDAO.findAll();
	}

	public void updateSubject(Subject vo) {
		subjectDAO.merge(vo);
	}

}
