package kr.co.subway.customerOrder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.customerOrder.vo.Bucket;

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

	public List<Bucket> allBucketList(int cusoIdx) {
		return sqlSession.selectList("bucket.selectAllBucket", cusoIdx);
	}

}
