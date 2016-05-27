package com.rems.struts;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rems.service.AnswerService;
import com.rems.service.DoctorService;
import com.rems.service.PatientService;
import com.rems.service.QuestionService;
import com.rems.service.SubjectService;
import com.rems.service.impl.PatientServiceImpl;
import com.rems.service.impl.SubjectServiceImpl;
import com.rems.vo.Answer;
import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;
import com.rems.vo.Question;
import com.rems.vo.Subject;

public class QuestionAction extends DispatchAction{
	
	private SubjectService subjectService;
	
	private QuestionService questionService;
	
	private PatientService patientService;
	
	private AnswerService answerService;
	
	private DoctorService doctorService;
	
	
	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	public void setAnswerService(AnswerService answerService) {
		this.answerService = answerService;
	}

	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}
	
	public ActionForward questionAddUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List subList = subjectService.getAllSubject();
		request.setAttribute("subList", subList);
		return mapping.findForward("questionAddView");
		
	}
	
	public ActionForward answerByQuestion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String questionId=request.getParameter("questionId");
		String doctorId=request.getParameter("doctorId");
		String ansContent=request.getParameter("ansContent");
		
		Answer answer=new Answer();
		answer.setAnswer(ansContent);
		answer.setCreateTime(new Date());
		answer.setDoctorId(Integer.parseInt(doctorId));
		answer.setState(1);  //设置正常问题
		
		answerService.addAnswer(answer);
		
		
		//问题信息
		Question ques=questionService.findQuestionById(Integer.parseInt(questionId));
		
		ques.setAnswerId(answer.getId());
		
		questionService.updateQuestion(ques);
		
		request.setAttribute("message1", "回答问题成功！");
		request.setAttribute("message2", "问题列表页面！");
		request.setAttribute("url", "question.do?method=questionListUI");
		return mapping.findForward("fowardJspView");
		
	}
	
	public ActionForward queryQuestionById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String questionId=request.getParameter("questionId");
		//问题信息
		Question ques=questionService.findQuestionById(Integer.parseInt(questionId));
		//患者信息
		PatientVO patientVO=patientService.findPatientById(ques.getUserId());
		//科目信息
		Subject subject=subjectService.findSubjectById(ques.getSubjectId());
		
		if(ques.getAnswerId()!=null ){
			Answer answer=answerService.queryAnswerById(ques.getAnswerId());
			DoctorVO doctorVO=doctorService.findDoctorById(answer.getDoctorId());
			Integer doctorAnsCount=answerService.queryAnsDoctorCount(doctorVO.getUserid());
			request.setAttribute("doctorAnsCount", doctorAnsCount);
			request.setAttribute("answer", answer);
			request.setAttribute("doctorVO", doctorVO);
		}
		List subList = subjectService.getAllSubject();
		Map<Integer, String> subMap=new HashMap();
		
		if(subList!=null && subList.size()>0){
			for(int i=0;i<subList.size();i++){
				Subject sj=(Subject)subList.get(i);
				subMap.put(sj.getId(), sj.getSubjectName());
			}
		}
		request.setAttribute("subMap", subMap);
		
		request.setAttribute("question", ques);
		request.setAttribute("patientVO", patientVO);
		request.setAttribute("subject", subject);
		
		return mapping.findForward("questionView");
		
	}
	
	public ActionForward questionDoAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String title=request.getParameter("title");
		String userId=request.getParameter("userId");
		String quesContent=request.getParameter("quesContent");
		String subjectId=request.getParameter("subjectId");
		String noname=request.getParameter("noname");
		
		Question ques=new Question();
		ques.setCreateTime(new Date());
		ques.setQuestion(quesContent);
		ques.setSubjectId(Integer.parseInt(subjectId));
		ques.setTitle(title);
		ques.setUserId(Integer.parseInt(userId));
		if(noname!=null && !"".equals(noname)){
			//2匿名问题
			ques.setState(Integer.parseInt(noname));
		}else{
			//正常问题
			ques.setState(1);
		}
		questionService.addQuestion(ques);
		
		
		request.setAttribute("message1", "提问成功！");
		request.setAttribute("message2", "问题列表页面！");
		request.setAttribute("url", "question.do?method=questionListUI");
		return mapping.findForward("fowardJspView");
		
	}
	
	public ActionForward questionListUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int pageInt=1;
		Question ques=new Question();
		String title=request.getParameter("title");
		String subjectId=request.getParameter("subjectId");
		if(title!=null &&! "".equals(title)){
			ques.setTitle(title);
		}
		if(subjectId!=null && !"".equals(subjectId)){
			ques.setSubjectId(Integer.parseInt(subjectId));
		}
		String pageParameter=request.getParameter("pageInt");
		if(pageParameter!=null && !"".equals(pageParameter)){
			pageInt=Integer.parseInt(pageParameter);
		}
		List subList = subjectService.getAllSubject();
		List questionList=questionService.findQuestionBySearch(ques, (pageInt-1)*10);
		int pageCount=questionService.questionCount(ques);
		List patientList=patientService.findAllPatinent();
		Map patientMap=new HashMap();
		if(patientList!=null && patientList.size()>0){
			for(int i=0;i<patientList.size();i++){
				PatientVO patientVO=(PatientVO)patientList.get(i);
				patientMap.put(patientVO.getUserid(), patientVO.getName());
			}
		}
		
		Map subMap=new HashMap();
		
		if(subList!=null && subList.size()>0){
			for(int i=0;i<subList.size();i++){
				Subject sj=(Subject)subList.get(i);
				subMap.put(sj.getId(), sj.getSubjectName());
			}
		}
		request.setAttribute("subMap", subMap);
		request.setAttribute("patientMap", patientMap);
		request.setAttribute("questionList", questionList);
		request.setAttribute("title", title);
		request.setAttribute("subjectId", subjectId);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageInt", pageInt);
		request.setAttribute("subList", subList);
		return mapping.findForward("questionListView");
		
	}

}
