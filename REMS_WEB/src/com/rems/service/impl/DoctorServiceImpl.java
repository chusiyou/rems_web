package com.rems.service.impl;

import java.util.List;

import com.rems.service.DoctorService;
import com.rems.vo.DoctorVO;
import com.rems.vo.DoctorVODAO;
import com.rems.vo.PatientVO;

public class DoctorServiceImpl implements DoctorService {
	
	
	private DoctorVODAO doctorDao;

	public void setDoctorDao(DoctorVODAO doctorDao) {
		this.doctorDao = doctorDao;
	}

	public List SearchDoctor(DoctorVO vo, Integer page) {
		return doctorDao.findByExample(vo, page);
	}

	public void addDoctor(DoctorVO vo) {
		doctorDao.save(vo);
	}

	public void deleteDoctor(DoctorVO vo) {
		doctorDao.delete(vo);
	}

	public Integer doctorCount(DoctorVO vo) {
		return doctorDao.patientCount(vo);
	}

	public DoctorVO findDoctorById(Integer id) {
		return doctorDao.findById(id);
	}

	public void updateDoctor(DoctorVO vo) {
		doctorDao.merge(vo);
	}

	public DoctorVO findDoctorByLogin(DoctorVO vo) {
		List list=doctorDao.findByExample(vo);
		if(list!=null && list.size()>0){
			return (DoctorVO)list.get(0);
		}
		return null;
	}

}
