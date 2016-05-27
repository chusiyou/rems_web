package com.rems.service.impl;

import java.util.List;

import com.rems.service.PatientService;
import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;
import com.rems.vo.PatientVODAO;

public class PatientServiceImpl implements PatientService {
	
	private PatientVODAO patientVODAO;

	public PatientVODAO getPatientVODAO() {
		return patientVODAO;
	}

	public void setPatientVODAO(PatientVODAO patientVODAO) {
		this.patientVODAO = patientVODAO;
	}

	public List SearchPatient(PatientVO vo,Integer page) {
		return patientVODAO.findByExample(vo,page);
	}

	public void addPatient(PatientVO vo) {
		patientVODAO.save(vo);
	}

	public void deletePatient(PatientVO vo) {
		patientVODAO.delete(vo);
	}

	public PatientVO findPatientById(Integer id) {
		return patientVODAO.findById(id);
	}

	public void updatePatient(PatientVO vo) {
		patientVODAO.merge(vo);
	}

	public Integer patientCount(PatientVO vo) {
		return patientVODAO.patientCount(vo);
	}

	public PatientVO findPatientByLogin(PatientVO vo) {
		List list=patientVODAO.findByExample(vo);
		if(list!=null && list.size()>0){
			return (PatientVO)list.get(0);
		}
		return null;
	}

	public List findAllPatinent() {
		return patientVODAO.findAll();
	}

}
