package com.rems.vo;
// default package

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 	* A data access object (DAO) providing persistence and search support for UsersVO entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .UsersVO
  * @author MyEclipse Persistence Tools 
 */

public class UsersVODAO extends HibernateDaoSupport  {
    private static final Log log = LogFactory.getLog(UsersVODAO.class);
	//property constants
	public static final String GH = "gh";
	public static final String PASS = "pass";
	public static final String WT = "wt";
	public static final String DA = "da";
	public static final String TYPE = "type";
	public static final String YX = "yx";



	protected void initDao() {
		//do nothing
	}
    
    public void save(UsersVO transientInstance) {
        log.debug("saving UsersVO instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(UsersVO persistentInstance) {
        log.debug("deleting UsersVO instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public UsersVO findById( java.lang.Integer id) {
        log.debug("getting UsersVO instance with id: " + id);
        try {
            UsersVO instance = (UsersVO) getHibernateTemplate()
                    .get("UsersVO", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(UsersVO instance) {
        log.debug("finding UsersVO instance by example");
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
      log.debug("finding UsersVO instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from UsersVO as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByGh(Object gh
	) {
		return findByProperty(GH, gh
		);
	}
	
	public List findByPass(Object pass
	) {
		return findByProperty(PASS, pass
		);
	}
	
	public List findByWt(Object wt
	) {
		return findByProperty(WT, wt
		);
	}
	
	public List findByDa(Object da
	) {
		return findByProperty(DA, da
		);
	}
	
	public List findByType(Object type
	) {
		return findByProperty(TYPE, type
		);
	}
	
	public List findByYx(Object yx
	) {
		return findByProperty(YX, yx
		);
	}
	

	public List findAll() {
		log.debug("finding all UsersVO instances");
		try {
			String queryString = "from UsersVO";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public UsersVO merge(UsersVO detachedInstance) {
        log.debug("merging UsersVO instance");
        try {
            UsersVO result = (UsersVO) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(UsersVO instance) {
        log.debug("attaching dirty UsersVO instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(UsersVO instance) {
        log.debug("attaching clean UsersVO instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UsersVODAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UsersVODAO) ctx.getBean("UsersVODAO");
	}
}