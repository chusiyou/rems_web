package com.rems.struts;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionServlet;

import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;

public class SessionInterceptor extends ActionServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		DoctorVO doctorVO = (DoctorVO) request.getSession().getAttribute("doctorVO");  
		PatientVO patientVO = (PatientVO) request.getSession().getAttribute("patientVO");
		System.out.println("doctorVO11111111="+doctorVO);
		System.out.println("patientVO11111111="+patientVO);
		if(doctorVO == null && patientVO ==null){
			System.out.println("111111111");
			response.sendRedirect("login.do?method=loginUI");
		}else{
			super.doGet(request, response);
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		DoctorVO doctorVO = (DoctorVO) request.getSession().getAttribute("doctorVO");  
		PatientVO patientVO = (PatientVO) request.getSession().getAttribute("patientVO");
		System.out.println("doctorVO2222222="+doctorVO);
		System.out.println("patientVO2222222="+patientVO);
		if(doctorVO == null && patientVO ==null){
			System.out.println("22222222222");
			response.sendRedirect("login.do?method=loginUI");
		}else{
			super.doPost(request, response);
		}
	}

}
