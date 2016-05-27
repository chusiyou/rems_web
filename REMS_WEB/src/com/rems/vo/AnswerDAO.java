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
 * Answer entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.rems.vo.Answer
 * @author MyEclipse Persistence Tools
 */

public class AnswerDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(AnswerDAO.class);
	// property constants
	public static final String ANSWER = "answer";
	public static final String DOCTOR_ID = "doctorId";
	public static final String STATE = "state";

	protected void initDao() {
		// do nothing
	}

	public void save(Answer transientInstance) {
		log.debug("saving Answer instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Answer persistentInstance) {
		log.debug("deleting Answer instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Answer findById(java.lang.Integer id) {
		log.debug("getting Answer instance with id: " + id);
		try {
			Answer instance = (Answer) getHibernateTemplate().get(
					"com.rems.vo.Answer", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public Integer queryAnsDoctorCount(Integer doctorId) {
		log.debug("finding Answer instance by queryAnsDoctorCount");
        Session session=null;
        try {
        	session =this.getSession();
        	String queryString= " select count(*)  from Answer as model where 1=1 ";
        	if(doctorId!=null){
        		queryString+=" and model.doctorId = :doctorId";
        		
        	}
        	Query query=session.createQuery(queryString);
        	if(doctorId!=null){
        		query.setParameter("doctorId",doctorId);  
        		
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
	

	public List findByExample(Answer instance) {
		log.debug("finding Answer instance by example");
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
		log.debug("finding Answer instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Answer as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAnswer(Object answer) {
		return findByProperty(ANSWER, answer);
	}

	public List findByDoctorId(Object doctorId) {
		return findByProperty(DOCTOR_ID, doctorId);
	}

	public List findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findAll() {
		log.debug("finding all Answer instances");
		try {
			String queryString = "from Answer";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Answer merge(Answer detachedInstance) {
		log.debug("merging Answer instance");
		try {
			Answer result = (Answer) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Answer instance) {
		log.debug("attaching dirty Answer instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Answer instance) {
		log.debug("attaching clean Answer instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AnswerDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AnswerDAO) ctx.getBean("AnswerDAO");
	}
}