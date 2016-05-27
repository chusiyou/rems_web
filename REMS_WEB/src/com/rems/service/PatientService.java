package com.rems.service;

import java.util.List;

import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;

public interface PatientService {
	
	
	public void addPatient(PatientVO vo);
	
	public void deletePatient(PatientVO vo);
	
	public void updatePatient(PatientVO vo);
	
	public PatientVO findPatientById(Integer id);
	
	public PatientVO findPatientByLogin(PatientVO vo);
	
	public List SearchPatient(PatientVO vo ,Integer page);
	
	public Integer patientCount(PatientVO vo);
	
	public List findAllPatinent();

}
