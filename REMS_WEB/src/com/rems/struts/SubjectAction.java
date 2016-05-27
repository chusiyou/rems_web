package com.rems.struts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.rems.service.SubjectService;
import com.rems.vo.Subject;

public class SubjectAction extends DispatchAction{
	
	
	private SubjectService subjectService;
	
	
	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}



	/**
	 * 科目显示页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward subjectUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List subList=subjectService.getAllSubject();
		request.setAttribute("subList", subList);
		return mapping.findForward("subjectView");
	}
	
	
	/**
	 * 科目增加或修改页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addOrUpdateSubjectUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String operator=request.getParameter("operator");
		if("update".equals(operator)){
			String subjectId=request.getParameter("subjectId");
			Subject sj=subjectService.findSubjectById(Integer.parseInt(subjectId));
			request.setAttribute("subject", sj);
		}
		request.setAttribute("operator", operator);
		return mapping.findForward("addOrUpdateSubjectView");
	}
	
	/**
	 * 科目增加
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addSubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String subjectCode=request.getParameter("subjectCode");
		String subjectName=request.getParameter("subjectName");
		
		Subject sj=new Subject();
		sj.setSubjectCode(subjectCode);
		sj.setSubjectName(subjectName);
		sj.setState(1);
		
		subjectService.addSubject(sj);
		return null;
	}
	
	
	/**
	 * 科目修改
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward updateSubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String subjectId=request.getParameter("subjectId");
		
		String subjectCode=request.getParameter("subjectCode");
		String subjectName=request.getParameter("subjectName");
		
		Subject sj=subjectService.findSubjectById(Integer.parseInt(subjectId));
		sj.setSubjectCode(subjectCode);
		sj.setSubjectName(subjectName);
		
		subjectService.updateSubject(sj);
		return null;
	}

}
