package com.rems.struts;

import java.io.IOException;  
import java.io.PrintWriter;

import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class WebFilter implements Filter {  
    // 字符编码  
    String encoding = null;  
    public void destroy() {  
        encoding = null;  
    }  
    public void doFilter(ServletRequest req, ServletResponse res,  
            FilterChain chain) throws IOException, ServletException {  
    	
    	
    	HttpServletRequest request = (HttpServletRequest) req;  
        HttpServletResponse response = (HttpServletResponse) res;  
        HttpSession session = request.getSession();  
        
        // 判断字符编码是否为空  
        if (encoding != null) {  
            // 设置request编码格式  
            request.setCharacterEncoding(encoding);  
            // 设置response编码格式  
            response.setContentType("text/html;charset=" + encoding);  
        }  
        
        chain.doFilter(request, response);
        
       /*
        String url = request.getRequestURI();
        String contextPath = request.getServletPath();
        
        if(contextPath.equals("/login.jsp") || contextPath.equals( "/login.do")){
        	chain.doFilter(request, response);
        } else if(url.contains(".css") || url.contains(".jquery.min.js") || url.contains(".jpg") || url.contains(".png") || url.contains(".gif")){
        	//如果发现是css或者js文件，直接放行
        	chain.doFilter(request, response);
        }else {
        	if(session.getAttribute("patientVO") == null && session.getAttribute("doctorVO") == null){
		        	response.setContentType("text/html;charset=utf-8");  
	                PrintWriter out = response.getWriter();  
	                out.println("<script language='javascript' type='text/javascript'>");  
	                out.println("alert('非法请求，请从页面登录！!');window.location.href='" + request.getContextPath() + "/login.jsp'");  
	                out.println("</script>"); 
		        	return;
		   }else{
			   chain.doFilter(request, response);
		   }
        }
        
        
        */
        
    }  
    /** 
     * 初始化的时候设置编码方式 
     */  
    public void init(FilterConfig filterConfig) throws ServletException {  
        // 获取初始化参数  
        encoding = filterConfig.getInitParameter("encoding");  
    }  
}  