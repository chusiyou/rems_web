package com.rems.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rems.service.DoctorService;
import com.rems.service.PatientService;
import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;

public class LoginAction extends DispatchAction {
	
	private DoctorService doctorService;
	
	private PatientService patientService;
	

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}


	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}
	
	public ActionForward loginUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return mapping.findForward("loginView");
		
	}
	
	/**
	 * 注销方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.getSession().invalidate(); 
		response.sendRedirect("login.jsp");//返回到登录页面 
		return null;
		
	}
	
	public ActionForward doLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String userType=request.getParameter("userType");
		String errorMessage="";
		String fwdUrl="indexView";
		if(userType.equals("doctor")){
			//如果是医生用户
			DoctorVO intvo=new DoctorVO();
			intvo.setSysname(username);
			intvo.setSyspass(password);
			DoctorVO outvo=doctorService.findDoctorByLogin(intvo);
			if(outvo!=null){
				request.getSession().setAttribute("doctorVO", outvo);
			}else{
				errorMessage="您输入的用户名或者密码不正确，请重新输入！";
				fwdUrl="loginView";
				request.setAttribute("errorMessage", errorMessage);
			}
			
		}else{
			//如果是患者用户
			PatientVO intvo=new PatientVO();
			intvo.setUsername(username);
			intvo.setPassword(password);
			PatientVO outvo=patientService.findPatientByLogin(intvo);
			if(outvo!=null){
				request.getSession().setAttribute("patientVO", outvo);
			}else{
				errorMessage="您输入的用户名或者密码不正确，请重新输入！";
				fwdUrl="loginView";
				request.setAttribute("errorMessage", errorMessage);
			}
			
		}
		request.getSession().setAttribute("userType", userType);
		return mapping.findForward(fwdUrl);
		
	}
	
	

}
