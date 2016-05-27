package com.rems.vo;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Question entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.rems.vo.Question
 * @author MyEclipse Persistence Tools
 */

public class QuestionDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(QuestionDAO.class);
	// property constants
	public static final String QUESTION = "question";
	public static final String USER_ID = "userId";
	public static final String ANSWER_ID = "answerId";
	public static final String STATE = "state";
	public static final String SUBJECT_ID = "subjectId";

	protected void initDao() {
		// do nothing
	}

	public void save(Question transientInstance) {
		log.debug("saving Question instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Question persistentInstance) {
		log.debug("deleting Question instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Question findById(java.lang.Integer id) {
		log.debug("getting Question instance with id: " + id);
		try {
			Question instance = (Question) getHibernateTemplate().get(
					"com.rems.vo.Question", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
	public Integer questionCount(Question instance) {
		log.debug("finding Question instance by QuestionCount");
        Session session=null;
        try {
        	session =this.getSession();
        	String queryString= " select count(*)  from Question as model where 1=1 ";
        	if(instance!=null){
        		if(instance.getTitle()!=null && !"".equals(instance.getTitle())){
        			queryString+=" and model.title like :title";
        		}
        		if(instance.getSubjectId()!=null && !"".equals(instance.getSubjectId())){
        			queryString+=" and model.subjectId = :subjectId";
        		}
        		
        	}
        	Query query=session.createQuery(queryString);
        	
        	if(instance!=null){
        		if(instance.getTitle()!=null && !"".equals(instance.getTitle())){
        			query.setParameter("title", "%"+instance.getTitle()+"%");  
        		}
        		if(instance.getSubjectId()!=null && !"".equals(instance.getSubjectId())){
        			query.setParameter("subjectId",instance.getSubjectId());  
        		}
        	}
        	
        	 int count = ((Long) query.iterate().next()).intValue();
            return count;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }finally{
        	releaseSession(session);
        }
	}
	
	 public List findQuestionBySearch(Question instance ,Integer page) {
	        log.debug("finding Question instance by example");
	        Session session=null;
	        try {
	        	session =this.getSession();
	        	String queryString= " from Question as model where 1=1 ";
	        	if(instance!=null){
	        		if(instance.getTitle()!=null && !"".equals(instance.getTitle())){
	        			queryString+=" and model.title like :title";
	        		}
	        		if(instance.getSubjectId()!=null && !"".equals(instance.getSubjectId())){
	        			queryString+=" and model.subjectId = :subjectId";
	        		}
	        		
	        	}
	        	Query query=session.createQuery(queryString);
	        	
	        	if(instance!=null){
	        		if(instance.getTitle()!=null && !"".equals(instance.getTitle())){
	        			query.setParameter("title", "%"+instance.getTitle()+"%");  
	        		}
	        		if(instance.getSubjectId()!=null && !"".equals(instance.getSubjectId())){
	        			query.setParameter("subjectId",instance.getSubjectId());  
	        		}
	        	}
	        	
	            //设置每页显示多少个，设置多大结果。  
	            query.setMaxResults(10);  
	            //设置起点  
	            query.setFirstResult(page);  
	            return query.list();
	        } catch (RuntimeException re) {
	            log.error("find by example failed", re);
	            throw re;
	        }finally{
	        	releaseSession(session);
	        }
	       
	    }    

	public List findByExample(Question instance) {
		log.debug("finding Question instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Question instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Question as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQuestion(Object question) {
		return findByProperty(QUESTION, question);
	}

	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	public List findByAnswerId(Object answerId) {
		return findByProperty(ANSWER_ID, answerId);
	}

	public List findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findBySubjectId(Object subjectId) {
		return findByProperty(SUBJECT_ID, subjectId);
	}

	public List findAll() {
		log.debug("finding all Question instances");
		try {
			String queryString = "from Question";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Question merge(Question detachedInstance) {
		log.debug("merging Question instance");
		try {
			Question result = (Question) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Question instance) {
		log.debug("attaching dirty Question instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Question instance) {
		log.debug("attaching clean Question instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static QuestionDAO getFromApplicationContext(ApplicationContext ctx) {
		return (QuestionDAO) ctx.getBean("QuestionDAO");
	}
}