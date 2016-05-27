package com.rems.struts;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rems.service.AnswerService;
import com.rems.service.PatientService;
import com.rems.service.QuestionService;
import com.rems.vo.Answer;
import com.rems.vo.PatientVO;
import com.rems.vo.Question;

public class PatientAction extends DispatchAction {
	
	
	private PatientService patientService;
	
	private AnswerService answerService;
	
	private QuestionService questionService;
	

	public void setAnswerService(AnswerService answerService) {
		this.answerService = answerService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}

	/**
	 * 患者信息增加跳转页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addPatientUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return mapping.findForward("addPatientView");
	}
	
	
	/**
	 * 患者信息详情修改页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward patientDetailOrUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Integer patientId=Integer.parseInt(request.getParameter("patientId"));
		String operator=request.getParameter("operator");
		PatientVO vo=patientService.findPatientById(patientId);
		request.setAttribute("patientVO", vo);
		request.setAttribute("operator", operator);
		return mapping.findForward("patientDetailOrUpdateView");
	}
	
	
	/**
	 * 患者信息列表页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward patientListView(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int pageInt=1;
		PatientVO vo=new PatientVO();
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		if(name!=null &&! "".equals(name)){
			vo.setName(name);
		}
		if(username!=null && !"".equals(username)){
			vo.setUsername(username);
		}
		String pageParameter=request.getParameter("pageInt");
		if(pageParameter!=null && !"".equals(pageParameter)){
			pageInt=Integer.parseInt(pageParameter);
		}
		
		
		List patientList=patientService.SearchPatient(vo,(pageInt-1)*10);
		
		int pageCount=patientService.patientCount(vo);
		
		request.setAttribute("patientList", patientList);
		request.setAttribute("name", name);
		request.setAttribute("username", username);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageInt", pageInt);
		//System.out.println("pageInt========="+pageInt);
		//System.out.println("pageCount========="+pageCount);
		//System.out.println("patientList========="+patientList.size());
		return mapping.findForward("patientListView");
	}
	
	/**
	 * 增加患者信息方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addPatient(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Integer age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		String marry=request.getParameter("marry");
		String jg=request.getParameter("jg");
		String job=request.getParameter("job");
		String profession=request.getParameter("profession");
		String address=request.getParameter("address");
		String jws=request.getParameter("jws");
		String gms=request.getParameter("gms");
		String bqzz=request.getParameter("bqzz");
		String bqfx=request.getParameter("bqfx");
		String state=request.getParameter("state");
		
		PatientVO vo=new PatientVO();
		vo.setAddress(address);
		vo.setAge(age);
		vo.setBqfx(bqfx);
		vo.setGms(gms);
		vo.setJg(jg);
		vo.setJob(job);
		vo.setJws(jws);
		vo.setMarry(marry);
		vo.setName(name);
		vo.setPassword(password);
		vo.setProfession(profession);
		vo.setSex(sex);
		vo.setState(state);
		vo.setUsername(username);
		vo.setBqzz(bqzz);
		
		patientService.addPatient(vo);
		
		request.setAttribute("message1", "增加患者信息成功！");
		request.setAttribute("message2", "增加患者页面！");
		request.setAttribute("url", "patient.do?method=addPatientUI");
		return mapping.findForward("fowardJspView");
	}
	
	/**
	 * 修改患者信息方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward updatePatient(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Integer userid=Integer.parseInt(request.getParameter("userid"));
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Integer age=Integer.parseInt(request.getParameter("age"));
		String sex=request.getParameter("sex");
		String marry=request.getParameter("marry");
		String jg=request.getParameter("jg");
		String job=request.getParameter("job");
		String profession=request.getParameter("profession");
		String address=request.getParameter("address");
		String jws=request.getParameter("jws");
		String gms=request.getParameter("gms");
		String bqzz=request.getParameter("bqzz");
		String bqfx=request.getParameter("bqfx");
		String state=request.getParameter("state");
		
		PatientVO vo=patientService.findPatientById(userid);
		vo.setAddress(address);
		vo.setAge(age);
		vo.setBqfx(bqfx);
		vo.setGms(gms);
		vo.setJg(jg);
		vo.setJob(job);
		vo.setJws(jws);
		vo.setMarry(marry);
		vo.setName(name);
		vo.setPassword(password);
		vo.setProfession(profession);
		vo.setSex(sex);
		vo.setState(state);
		vo.setUsername(username);
		vo.setBqzz(bqzz);
		
		patientService.updatePatient(vo);
		
		return null;
	}
	
	
	/**
	 * 删除患者信息方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward deletePatient(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Integer userid=Integer.parseInt(request.getParameter("userid"));
		
		//删除患者信息
		PatientVO vo=patientService.findPatientById(userid);
		patientService.deletePatient(vo);
		
		//同时删除患者所提问的问题信息
		List questionList=questionService.findQuestionListByPatientId(vo.getUserid());
		if(questionList!=null && questionList.size()>0){
			for(int i=0;i<questionList.size();i++){
				Question question=(Question)questionList.get(i);
				if(question.getAnswerId()!=null && question.getAnswerId()!=0){
					//同时删除问题答案信息
					Answer as=answerService.queryAnswerById(question.getAnswerId());
					answerService.deleteAnswer(as);
				}
				questionService.deleteQuestion(question);
				
			}
		}
		
		
		return null;
	}
	

}
