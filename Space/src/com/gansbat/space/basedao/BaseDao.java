package com.gansbat.space.basedao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;

import sun.net.www.content.text.plain;

/**
 * @desc ����Spring����Hibernate֮�����ݳ־ò����ķ�װ���ṩ�˻�����������ɾ�Ĳ飬�Լ�����HQL�Ĳ�ѯ����ҳ��ѯ������SQL�Ĳ�ѯ����ҳ��ѯ�ȡ�
 *
 * @author wangwei
 * @param <T> ʵ����
 * @param <PK> ʵ�����OID����Ӧ��������ֶ�
 */
public abstract class BaseDao<T, PK extends Serializable> {

	private Class<T> entityClass;

	@Resource
	private SessionFactory sessionFactory;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public BaseDao() {
		Class c = getClass();
		Type t = c.getGenericSuperclass();
		if (t instanceof ParameterizedType) {
			Type[] p = ((ParameterizedType) t).getActualTypeArguments();
			this.entityClass = (Class<T>) p[0];
		}
	}

	// **************������ɾ�Ĳ�*********************

	public void save(T entity) throws Exception {
		this.sessionFactory.getCurrentSession().save(entity);
	}

	public void update(T entity) throws Exception {
		this.sessionFactory.getCurrentSession().update(entity);
	}

	public void delete(Object entity) throws Exception {
		this.sessionFactory.getCurrentSession().delete(entity);
	}

	public void delete(Serializable id) throws Exception {
		this.delete(this.sessionFactory.getCurrentSession().load(entityClass, id));
	}

	public T get(Serializable id) throws Exception {
		return (T) this.sessionFactory.getCurrentSession().get(entityClass, id);
	}

	public T load(Serializable id) throws Exception {
		return (T) this.sessionFactory.getCurrentSession().load(entityClass, id);
	}

	// **************HQL***************************

	/**
	 * @desc ����hql��䣬��ѯ����ʵ����Ķ���
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return ����ʵ����Ķ���
	 * @throws Exception
	 */
	
	@SuppressWarnings("unchecked")
	public T findOne(String hql, Object[] params) throws Exception {
		System.out.println("ksdjf");
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return (T) query.uniqueResult();
	}

	/**
	 * @desc ��ѯȫ������
	 * @return ȫ�����ݵ�List����
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<T> findAll() throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from " + entityClass.getSimpleName());
		return query.list();
	}

	/**
	 * 
	 * @desc ����hql��䣬��������ѯ����
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return ��������ѯ�����ݵ�List����
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return query.list();
	}

	/**
	 * @desc ͳ��ȫ����������
	 * @return ȫ�����ݵ�����
	 * @throws Exception
	 */
	public Long findCount() throws Exception {
		Query query = this.sessionFactory.getCurrentSession()
				.createQuery("select count(" + entityClass.getSimpleName() + ") from " + entityClass.getSimpleName());
		return (Long) query.uniqueResult();
	}

	/**
	 * @desc ��ҳ��ѯȫ������
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @return Page�Ķ���
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Page<T> findPage(int pageNum, int pageSize) throws Exception {
		long total = this.findCount();
		Query query = this.sessionFactory.getCurrentSession().createQuery("from " + entityClass.getSimpleName());
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		List<T> rows = query.list();
		return new Page<T>(pageNum, pageSize, (int) total, rows);
	}

	/**
	 * @desc ����hql����������ѯ��������
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return ��������
	 * @throws Exception
	 */
	public Long findCount(String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return (Long) query.uniqueResult();
	}

	/**
	 * @desc ��������ҳ��ѯ����
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return ��ѯ�������ݣ�List����
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(int pageNum, int pageSize, String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * @desc ��ҳ��ѯ
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @param hqlCount ����ͳ�����ݸ�����hql���
	 * @param hqlList ���ڲ�ѯ���ݵ�hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return Page����
	 * @throws Exception
	 */
	public Page<T> findPage(int pageNum, int pageSize, String hqlCount, String hqlList, Object[] params)
			throws Exception {
		long total = findCount(hqlCount, params);
		List<T> rows = find(pageNum, pageSize, hqlList, params);
		return new Page<T>(pageNum, pageSize, (int) total, rows);
	}

	/**
	 * @desc ����hql������������ͶӰ��ѯ
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return List���ϣ������������Ƕ�������
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findByProjection(String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return query.list();
	}

	/**
	 * @desc ����hql�����������з�ҳ��ͶӰ��ѯ
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @param hql hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return List���ϣ������������Ƕ�������
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Object[]> findByProjection(int pageNum, int pageSize, String hql, Object[] params) throws Exception {
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * @desc ����hql�����������з�ҳ��ͶӰ��ѯ
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @param hqlCount ����ͳ��������hql���
	 * @param hqlList ���ڲ�ѯ��hql���
	 * @param params hql�����ռλ����Ӧ�Ĳ���
	 * @return Page����
	 * @throws Exception
	 */
	public Page<Object[]> findPageByProjection(int pageNum, int pageSize, String hqlCount, String hqlList,
			Object[] params) throws Exception {
		long total = findCount(hqlCount, params);
		List<Object[]> rows = findByProjection(pageNum, pageSize, hqlList, params);
		return new Page<Object[]>(pageNum, pageSize, (int) total, rows);
	}

	// **************SQL***************************
	/**
	 * @desc ͨ��ԭ��SQL�����������޸ģ�ɾ��
	 * @param sql sql���
	 * @param params sql�����ռλ����Ӧ�Ĳ���
	 * @return ִ��sql�����Ӱ�������
	 * @throws Exception
	 */
	public int excuteBySql(String sql, Object[] params) throws Exception {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return query.executeUpdate();
	}

	/**
	 * @desc ͨ��ԭ��SQL���в�ѯ�����ص������������Map<String, Object>��ʽ���
	 * @param sql sql���
	 * @param params sql�����ռλ����Ӧ�Ĳ���
	 * @return ��ѯ��������
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> findOneBySql(String sql, Object[] params) throws Exception {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return (Map<String, Object>) query.uniqueResult();
	}

	/**
	 * @desc ͨ��ԭ��SQL���в�ѯ�����ض�����������List<Map<String, Object>>��ʽ���
	 * @param sql sql���
	 * @param params sql�����ռλ����Ӧ�Ĳ���
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findBySql(String sql, Object[] params) throws Exception {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return query.list();
	}

	/**
	 * @desc ��ҳԭ��SQL����ͳ������
	 * @param sql sql���
	 * @param params sql�����ռλ����Ӧ�Ĳ���
	 * @return ͳ�Ƶ�����
	 * @throws Exception
	 */
	public Long findCountBySql(String sql, Object[] params) throws Exception {
		SQLQuery query = this.sessionFactory.getCurrentSession().createSQLQuery(sql);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		return (Long) query.uniqueResult();
	}

	/**
	 * @desc ��ҳԭ��SQL���в�ѯ
	 * @param sql sql���
	 * @param params sql�����ռλ����Ӧ�Ĳ���
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @return 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findBySql(String sql, Object[] params, int pageNum, int pageSize)
			throws Exception {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++)
				query.setParameter(i, params[i]);
		}
		query.setFirstResult((pageNum - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/**
	 * @desc ��ҳԭ��SQL���в�ѯ
	 * @param pageNum ҳ��
	 * @param pageSize ÿҳ���ݸ���
	 * @param sqlCount ͳ������������sql���
	 * @param sqlList ��ѯ��ҳ���ݵ�sql���
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> findPageBySql(int pageNum, int pageSize, String sqlCount, String sqlList, Object[] params)
			throws Exception {
		long total = this.findCountBySql(sqlCount, params);
		List<Map<String, Object>> rows = this.findBySql(sqlList, params, pageNum, pageSize);
		return new Page<Map<String, Object>>(pageNum, pageSize, (int) total, rows);
	}

}
