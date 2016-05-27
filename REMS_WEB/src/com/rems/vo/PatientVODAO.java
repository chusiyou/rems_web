package com.rems.vo;
// default package

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 	* A data access object (DAO) providing persistence and search support for PatientVO entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .PatientVO
  * @author MyEclipse Persistence Tools 
 */

public class PatientVODAO extends HibernateDaoSupport  {
    private static final Log log = LogFactory.getLog(PatientVODAO.class);
	//property constants
	public static final String NAME = "name";
	public static final String ADDR = "addr";
	public static final String COLL = "coll";
	public static final String PRO = "pro";
	public static final String BL = "bl";



	protected void initDao() {
		//do nothing
	}
    
    public void save(PatientVO transientInstance) {
        log.debug("saving PatientVO instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(PatientVO persistentInstance) {
        log.debug("deleting PatientVO instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public PatientVO findById( java.lang.Integer id) {
        log.debug("getting PatientVO instance with id: " + id);
        try {
            PatientVO instance = (PatientVO) getHibernateTemplate()
                    .get("com.rems.vo.PatientVO", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
	public List findByExample(PatientVO instance) {
		log.debug("finding PatientVO instance by example");
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
    
    
    public List findByExample(PatientVO instance,Integer page) {
        log.debug("finding PatientVO instance by example");
        Session session=null;
        try {
        	/*
            List results = getHibernateTemplate().findByExample(instance);
            getHibernateTemplate().setf
            log.debug("find by example successful, result size: " + results.size());
            */
        	session =this.getSession();
        	String queryString= " from PatientVO as model where 1=1 ";
        	if(instance!=null){
        		if(instance.getName()!=null && !"".equals(instance.getName())){
        			queryString+=" and model.name like :name";
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			queryString+=" and model.username like :username";
        		}
        	}
        	Query query=session.createQuery(queryString);
        	
        	if(instance!=null){
        		if(instance.getName()!=null && !"".equals(instance.getName())){
        			query.setParameter("name", "%"+instance.getName()+"%");  
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			query.setParameter("username","%"+instance.getUsername()+"%");  
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
    
    
    public Integer patientCount(PatientVO instance) {
        log.debug("finding PatientVO instance by patientCount");
        Session session=null;
        try {
        	session =this.getSession();
        	String queryString= " select count(*)  from PatientVO as model where 1=1 ";
        	if(instance!=null){
        		if(instance.getName()!=null && !"".equals(instance.getName())){
        			queryString+=" and model.name like :name";
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			queryString+=" and model.username like :username";
        		}
        	}
        	Query query=session.createQuery(queryString);
        	
        	if(instance!=null){
        		if(instance.getName()!=null && !"".equals(instance.getName())){
        			query.setParameter("name", "%"+instance.getName()+"%");  
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			query.setParameter("username", "%"+instance.getUsername()+"%");  
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
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding PatientVO instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from PatientVO as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByName(Object name
	) {
		return findByProperty(NAME, name
		);
	}
	
	public List findByAddr(Object addr
	) {
		return findByProperty(ADDR, addr
		);
	}
	
	public List findByColl(Object coll
	) {
		return findByProperty(COLL, coll
		);
	}
	
	public List findByPro(Object pro
	) {
		return findByProperty(PRO, pro
		);
	}
	
	public List findByBl(Object bl
	) {
		return findByProperty(BL, bl
		);
	}
	

	public List findAll() {
		log.debug("finding all PatientVO instances");
		try {
			String queryString = "from PatientVO";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public PatientVO merge(PatientVO detachedInstance) {
        log.debug("merging PatientVO instance");
        try {
            PatientVO result = (PatientVO) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(PatientVO instance) {
        log.debug("attaching dirty PatientVO instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(PatientVO instance) {
        log.debug("attaching clean PatientVO instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static PatientVODAO getFromApplicationContext(ApplicationContext ctx) {
    	return (PatientVODAO) ctx.getBean("PatientVODAO");
	}
}