package com.rems.service;

import java.util.List;

import com.rems.vo.Subject;

public interface SubjectService {
	
	
	public List getAllSubject();
	
	public void updateSubject(Subject vo);
	
	public void deleteSubject(Subject vo);
	
	public void addSubject(Subject vo);
	
	public Subject findSubjectById(Integer id);

}
