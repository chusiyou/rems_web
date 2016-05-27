package com.rems.service;

import java.util.List;

import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;

public interface DoctorService {
	
	public void addDoctor(DoctorVO vo);
	
	public void deleteDoctor(DoctorVO vo);
	
	public void updateDoctor(DoctorVO vo);
	
	public DoctorVO findDoctorById(Integer id);
	
	public DoctorVO findDoctorByLogin(DoctorVO vo);
	
	public List SearchDoctor(DoctorVO vo ,Integer page);
	
	public Integer doctorCount(DoctorVO vo);

}
