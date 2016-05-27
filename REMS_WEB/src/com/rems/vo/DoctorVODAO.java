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
 	* A data access object (DAO) providing persistence and search support for DoctorVO entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .DoctorVO
  * @author MyEclipse Persistence Tools 
 */

public class DoctorVODAO extends HibernateDaoSupport  {
    private static final Log log = LogFactory.getLog(DoctorVODAO.class);
	//property constants
	public static final String USERNAME = "username";
	public static final String NUM = "num";
	public static final String ADDR = "addr";
	public static final String COL = "col";
	public static final String SEX = "sex";
	public static final String MAIL = "mail";
	public static final String MZ = "mz";
	public static final String CEL = "cel";
	public static final String PRO = "pro";
	public static final String MARRY = "marry";
	public static final String BZZT = "bzzt";



	protected void initDao() {
		//do nothing
	}
    
    public void save(DoctorVO transientInstance) {
        log.debug("saving DoctorVO instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(DoctorVO persistentInstance) {
        log.debug("deleting DoctorVO instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public DoctorVO findById( java.lang.Integer id) {
        log.debug("getting DoctorVO instance with id: " + id);
        try {
            DoctorVO instance = (DoctorVO) getHibernateTemplate()
                    .get("com.rems.vo.DoctorVO", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(DoctorVO instance,Integer page) {
        log.debug("finding DoctorVO instance by example");
        Session session=null;
        try {
        	/*
            List results = getHibernateTemplate().findByExample(instance);
            getHibernateTemplate().setf
            log.debug("find by example successful, result size: " + results.size());
            */
        	session =this.getSession();
        	String queryString= " from DoctorVO as model where 1=1 ";
        	if(instance!=null){
        		if(instance.getSysname()!=null && !"".equals(instance.getSysname())){
        			queryString+=" and model.sysname like :sysname";
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			queryString+=" and model.username like :username";
        		}
        		if(instance.getPro()!=null && !"".equals(instance.getPro())){
        			queryString+=" and model.pro = :subjectId";
        		}
        	}
        	Query query=session.createQuery(queryString);
        	
        	if(instance!=null){
        		if(instance.getSysname()!=null && !"".equals(instance.getSysname())){
        			query.setParameter("sysname", "%"+instance.getSysname()+"%");  
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			query.setParameter("username","%"+instance.getUsername()+"%");  
        		}
        		if(instance.getPro()!=null && !"".equals(instance.getPro())){
        			query.setParameter("subjectId",instance.getPro());  
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
    
    
    public Integer patientCount(DoctorVO instance) {
        log.debug("finding DoctorVO instance by doctorCount");
        Session session=null;
        try {
        	session =this.getSession();
        	String queryString= " select count(*)  from DoctorVO as model where 1=1 ";
        	if(instance!=null){
        		if(instance.getSysname()!=null && !"".equals(instance.getSysname())){
        			queryString+=" and model.sysname like :sysname";
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			queryString+=" and model.username like :username";
        		}if(instance.getPro()!=null && !"".equals(instance.getPro())){
        			queryString+=" and model.pro = :subjectId";
        		}
        	}
        	Query query=session.createQuery(queryString);
        	
        	if(instance!=null){
        		if(instance.getSysname()!=null && !"".equals(instance.getSysname())){
        			query.setParameter("sysname", "%"+instance.getSysname()+"%");  
        		}
        		if(instance.getUsername()!=null && !"".equals(instance.getUsername())){
        			query.setParameter("username", "%"+instance.getUsername()+"%");  
        		}if(instance.getPro()!=null && !"".equals(instance.getPro())){
        			query.setParameter("subjectId",instance.getPro());  
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
    
    
    public List findByExample(DoctorVO instance) {
        log.debug("finding DoctorVO instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding DoctorVO instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from DoctorVO as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUsername(Object username
	) {
		return findByProperty(USERNAME, username
		);
	}
	
	public List findByNum(Object num
	) {
		return findByProperty(NUM, num
		);
	}
	
	public List findByAddr(Object addr
	) {
		return findByProperty(ADDR, addr
		);
	}
	
	public List findByCol(Object col
	) {
		return findByProperty(COL, col
		);
	}
	
	public List findBySex(Object sex
	) {
		return findByProperty(SEX, sex
		);
	}
	
	public List findByMail(Object mail
	) {
		return findByProperty(MAIL, mail
		);
	}
	
	public List findByMz(Object mz
	) {
		return findByProperty(MZ, mz
		);
	}
	
	public List findByCel(Object cel
	) {
		return findByProperty(CEL, cel
		);
	}
	
	public List findByPro(Object pro
	) {
		return findByProperty(PRO, pro
		);
	}
	
	public List findByMarry(Object marry
	) {
		return findByProperty(MARRY, marry
		);
	}
	
	public List findByBzzt(Object bzzt
	) {
		return findByProperty(BZZT, bzzt
		);
	}
	

	public List findAll() {
		log.debug("finding all DoctorVO instances");
		try {
			String queryString = "from DoctorVO";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public DoctorVO merge(DoctorVO detachedInstance) {
        log.debug("merging DoctorVO instance");
        try {
            DoctorVO result = (DoctorVO) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(DoctorVO instance) {
        log.debug("attaching dirty DoctorVO instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(DoctorVO instance) {
        log.debug("attaching clean DoctorVO instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static DoctorVODAO getFromApplicationContext(ApplicationContext ctx) {
    	return (DoctorVODAO) ctx.getBean("DoctorVODAO");
	}
}