package com.rems.struts;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.jspsmart.upload.SmartUpload;
import com.rems.service.DoctorService;
import com.rems.service.SubjectService;
import com.rems.vo.DoctorVO;
import com.rems.vo.PatientVO;
import com.rems.vo.Subject;

public class DoctorAction extends DispatchAction{
	
	private DoctorService doctorService;
	private SubjectService subjectService;




	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}


	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}


	/**
	 * 增加医生信息页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addDoctorUI(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List subList = subjectService.getAllSubject();
		request.setAttribute("subList", subList);
		return mapping.findForward("addDoctorView");
	}
	/**
	 * 医生信息详情修改页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward doctorDetailOrUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Integer doctorId=Integer.parseInt(request.getParameter("doctorId"));
		String operator=request.getParameter("operator");
		DoctorVO vo=doctorService.findDoctorById(doctorId);
		List subList = subjectService.getAllSubject();
		request.setAttribute("subList", subList);
		request.setAttribute("doctorVO", vo);
		request.setAttribute("operator", operator);
		return mapping.findForward("doctorDetailOrUpdateView");
	}
	
	/**
	 * 医生信息列表页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward doctorListView(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int pageInt=1;
		DoctorVO vo=new DoctorVO();
		String sysname=request.getParameter("sysname");
		String username=request.getParameter("username");
		String subjectId=request.getParameter("subjectId");
		if(sysname!=null &&! "".equals(sysname)){
			vo.setSysname(sysname);
		}
		if(username!=null && !"".equals(username)){
			vo.setUsername(username);
		}
		if(subjectId!=null && !"".equals(subjectId)){
			vo.setPro(subjectId);
		}
		String pageParameter=request.getParameter("pageInt");
		if(pageParameter!=null && !"".equals(pageParameter)){
			pageInt=Integer.parseInt(pageParameter);
		}
		
		
		List doctorList=doctorService.SearchDoctor(vo,(pageInt-1)*10);
		
		int pageCount=doctorService.doctorCount(vo);
		
		List subList = subjectService.getAllSubject();
		
		Map subMap=new HashMap();
		
		if(subList!=null && subList.size()>0){
			for(int i=0;i<subList.size();i++){
				Subject sj=(Subject)subList.get(i);
				subMap.put(sj.getId().toString(), sj.getSubjectName());
			}
		}		
		request.setAttribute("subMap", subMap);
		request.setAttribute("doctorList", doctorList);
		request.setAttribute("sysname", sysname);
		request.setAttribute("username", username);
		request.setAttribute("subjectId", subjectId);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageInt", pageInt);
		//System.out.println("pageInt========="+pageInt);
		//System.out.println("pageCount========="+pageCount);
		//System.out.println("patientList========="+patientList.size());
		return mapping.findForward("doctorListView");
	}
	
	
	/**
	 * 增加医生信息方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward addDoctor(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		DoctorVO vo=new DoctorVO();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat   sdf   =   new   SimpleDateFormat("yyyyMMdd_HHmmss");   
		DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("UTF-8");  
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		try {  
		    List items = upload.parseRequest(request);  
		    
		    Iterator iter = items.iterator();  
		    while (iter.hasNext()) {  
		        FileItem item = (FileItem) iter.next();  
		        
		        if (item.isFormField()) {  
		        	//参数名  
			        String fieldName= item.getFieldName();  
			      //参数值  
			        String fieldValue=item.getString("UTF-8"); 
		          if(fieldName.equals("username")){
		        	  vo.setUsername(fieldValue);
		          }else if(fieldName.equals("num")){
		        	  vo.setNum(fieldValue);
		          }else if(fieldName.equals("addr")){
		        	  vo.setAddr(fieldValue);
		          }else if(fieldName.equals("age")){
		        	  vo.setAge(Integer.parseInt(fieldValue));
		          }else if(fieldName.equals("col")){
		        	  vo.setCol(fieldValue);
		          }else if(fieldName.equals("sex")){
		        	  vo.setSex(fieldValue);
		          }else if(fieldName.equals("mail")){
		        	  vo.setMail(fieldValue);
		          }else if(fieldName.equals("mz")){
		        	  vo.setMz(fieldValue);
		          }else if(fieldName.equals("cel")){
		        	  vo.setCel(fieldValue);
		          }else if(fieldName.equals("birth")){
		        	  if(fieldValue!=null && !"".equals(fieldValue)){
		      			vo.setBirth(simpleDateFormat.parse(fieldValue));
		      		}
		          }else if(fieldName.equals("rynf")){
		        	  if(fieldValue!=null && !"".equals(fieldValue)){
		      			vo.setRynf(simpleDateFormat.parse(fieldValue));
		      		}
		          }else if(fieldName.equals("pro")){
		        	  vo.setPro(fieldValue);
		          }else if(fieldName.equals("marry")){
		        	  vo.setMarry(fieldValue);
		          }else if(fieldName.equals("bzzt")){
		        	  vo.setBzzt(fieldValue);
		          }else if(fieldName.equals("sysname")){
		        	  vo.setSysname(fieldValue);
		          }else if(fieldName.equals("syspass")){
		        	  vo.setSyspass(fieldValue);
		          }
		        } else{
		        	String name = item.getName();
		        	if(name !=null && !"".equals(name)){
		        		if(name.contains("\\")){
			        		//如果name 包含\  证明是IE浏览器
			        		int lastChar=name.lastIndexOf("\\");
			        		name=name.substring(lastChar+1, name.length());
			        	}
			        	//String userImage="/photo/"+ File.separatorChar + name;
			        	String userImage=sdf.format(new Date())+ name;
			        	String saveImage=request.getRealPath("/")+"photo/"+sdf.format(new Date())+ name;
			        	
			        	//System.out.println("saveImage===="+saveImage);
			        	File file = new File(saveImage);
			        	item.write(file);
	                    item.delete();  //释放输出流
	                    vo.setUserimage(userImage);
		        	}
		        	
		        }
		    }  
		}catch (Exception ex) {  
			ex.printStackTrace();
		}  
		
		
		
		
		doctorService.addDoctor(vo);
	
		/*
		SmartUpload mySmartUpload =new SmartUpload(); 
		//上传文件的限制大小
		//long file_size_max=4000000; 
		
		SimpleDateFormat   sdf   =   new   SimpleDateFormat("yyyyMMdd_HHmmss");   

		//String fileName2="",ext="",testvar=""; 

		//应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹） 
		//String url="/photo/"; 
		//初始化 
		mySmartUpload.initialize(servlet.getServletConfig(), request, response); 

		//只允许上载此类文件 
		try { 

		mySmartUpload.setAllowedFilesList("bmp,jpg,tiff,gif,pcx,tga,exif,fpx,svg,psd,cdr,pcd,dxf,ufo,eps,ai,raw");//此处的文件格式可以根据需要自己修改 

		
		//上载文件 
		mySmartUpload.upload(); 
		
		//mySmartUpload.save("photo");
		
		String imageName="/photo/"   +   sdf.format(new Date())+"."+mySmartUpload.getFiles().getFile(0).getFileExt();
		
		mySmartUpload.getFiles().getFile(0).saveAs(imageName);  
		
		//String getFileName=mySmartUpload.getFiles().getFile(0).getFileName();
		//String getFileExt=mySmartUpload.getFiles().getFile(0).getFileExt();
		//String getFilePathName=mySmartUpload.getFiles().getFile(0).getFilePathName();
		
		} catch (Exception e){ 
			e.printStackTrace();
		}
		*/
		
		request.setAttribute("message1", "增加医生信息成功！");
		request.setAttribute("message2", "增加医生信息页面！");
		request.setAttribute("url", "doctor.do?method=addDoctorUI");
		
		return mapping.findForward("fowardJspView");
	}
	
	
	/**
	 * 修改医生信息方法
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward updateDoctor(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat   sdf   =   new   SimpleDateFormat("yyyyMMdd_HHmmss");   
		DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("UTF-8");  
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		
		
		try {  
			Integer userid=null;
			String username="";
			String num="";
			String addr="";
			Integer age=null;
			String col="";
			String sex="";
			String mail="";
			String mz="";
			String cel="";
			Date birth=null;
			Date rynf=null;
			String pro="";
			String marry="";
			String bzzt="";
			String sysname="";
			String syspass="";
			String userImage=null;
		    List items = upload.parseRequest(request);  
		    
		    Iterator iter = items.iterator();  
		   
		    while (iter.hasNext()) {  
		        FileItem item = (FileItem) iter.next();  
		        
		        if (item.isFormField()) {  
		        	//参数名  
			        String fieldName= item.getFieldName();  
			      //参数值  
			        String fieldValue=item.getString("UTF-8"); 
			      if(fieldName.equals("userid")){
			    	  userid= Integer.parseInt(fieldValue);
			      }else if(fieldName.equals("username")){
			    	  username=fieldValue;
		          }else if(fieldName.equals("num")){
		        	  num=fieldValue;
		          }else if(fieldName.equals("addr")){
		        	  addr=fieldValue;
		          }else if(fieldName.equals("age")){
		        	  if(fieldValue!=null && !"".equals(fieldValue)){
		        		  age=Integer.parseInt(fieldValue);
		        	  }
		          }else if(fieldName.equals("col")){
		        	  col=fieldValue;
		          }else if(fieldName.equals("sex")){
		        	  sex=fieldValue;
		          }else if(fieldName.equals("mail")){
		        	  mail=fieldValue;
		          }else if(fieldName.equals("mz")){
		        	  mz=fieldValue;
		          }else if(fieldName.equals("cel")){
		        	  cel=fieldValue;
		          }else if(fieldName.equals("birth")){
		        	  if(fieldValue!=null && !"".equals(fieldValue)){
		      			birth=simpleDateFormat.parse(fieldValue);
		      		}
		          }else if(fieldName.equals("rynf")){
		        	  if(fieldValue!=null && !"".equals(fieldValue)){
		        		  rynf=simpleDateFormat.parse(fieldValue);
		      		}
		          }else if(fieldName.equals("pro")){
		        	  pro=fieldValue;
		          }else if(fieldName.equals("marry")){
		        	  marry=fieldValue;
		          }else if(fieldName.equals("bzzt")){
		        	  bzzt=fieldValue;
		          }else if(fieldName.equals("sysname")){
		        	  sysname=fieldValue;
		          }else if(fieldName.equals("syspass")){
		        	  syspass=fieldValue;
		          }
		        } else{
		        	String name = item.getName();
		        	if(name !=null && !"".equals(name)){
		        		if(name.contains("\\")){
			        		//如果name 包含\  证明是IE浏览器
			        		int lastChar=name.lastIndexOf("\\");
			        		name=name.substring(lastChar+1, name.length());
			        	}
			        	//System.out.println("name======="+name);
			        	//String userImage="/photo/"+ File.separatorChar + name;
			        	userImage=sdf.format(new Date())+ name;
			        	String saveImage=request.getRealPath("/")+"photo/"+sdf.format(new Date())+ name;
			        	
			        	//System.out.println("saveImage===="+saveImage);
			        	File file = new File(saveImage);
			        	item.write(file);
	                    item.delete();  //释放输出流
	                    //vo.setUserimage(userImage);
		        	}
		        	
		        }
		    }
		    DoctorVO vo=null;;
		    if(userid!=null){
		    	vo=doctorService.findDoctorById(userid);
		    }
		    vo.setAddr(addr);
		    vo.setAge(age);
		    vo.setBirth(birth);
		    vo.setBzzt(bzzt);
		    vo.setCel(cel);
		    vo.setCol(col);
		    vo.setMail(mail);
		    vo.setMarry(marry);
		    vo.setMz(mz);
		    vo.setNum(num);
		    vo.setPro(pro);
		    vo.setPro(pro);
		    vo.setRynf(rynf);
		    vo.setSex(sex);
		    vo.setSysname(sysname);
		    vo.setSyspass(syspass);
		    if(userImage!=null){
		    	vo.setUserimage(userImage);
		    }
		    vo.setUsername(username);
		    doctorService.updateDoctor(vo);
		}catch (Exception ex) {  
			ex.printStackTrace();
		}  
		
		
		
		
		
	
		
		
		
		return null;
	}
}
