package kr.co.subway.customerOrder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.UpdateQuantity;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.manager.vo.Mgr;

@Repository("cusOrderDao")
public class CusOrderDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List ingreSelectAll() {
		return sqlSession.selectList("bucket.ingreSelectAll");
	}
			
	public int insertMember(Bucket buc) {
		return sqlSession.insert("bucket.insertBucket",buc);
	}

	public List<Bucket> allOrderList(int customerIdx) {
		return sqlSession.selectList("bucket.selectAllBucket", customerIdx);
	}

	public IngreVo selectCostMain(IngreVo ingre) {
		return sqlSession.selectOne("ingre.selectOneMain", ingre);
	}
	
	public int tempOrderInsert(Bucket b) {
		return sqlSession.insert("bucket.tempOrderInsert", b);
	}

	public int insertBucket(Bucket b) {
		return sqlSession.insert("bucket.insertBucket",b);
	}
	
	public int tempOrderSelect() {
		return sqlSession.selectOne("bucket.tempOrderSelect");
	}
	
	public int tempOrderDelete(int idx) {
		return sqlSession.delete("bucket.tempOrderDelete",idx);
	}
	
	public Mgr mgrSelectOne(int mgrNo) {
		return sqlSession.selectOne("bucket.mgrSelectOne", mgrNo); 
	}
	
	public int updateQuantity(UpdateQuantity uq) {
		
		return sqlSession.update("bucket.updateQuantity", uq);
	}
}
