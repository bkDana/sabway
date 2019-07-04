package kr.co.subway.manager.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import kr.co.subway.manager.vo.Mgr;

public class MgrRowMapper implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Mgr mgr= null;
		mgr = new Mgr();
		mgr.setMgrNo(rs.getInt("mgr_no"));
		mgr.setMgrId(rs.getString("mgr_id"));
		mgr.setMgrPw(rs.getString("mgr_pw"));
		mgr.setMgrName(rs.getString("mgr_name"));
		mgr.setMgrTel(rs.getString("mgr_tel"));
		mgr.setMgrPost(rs.getInt("mgr_post"));
		mgr.setMgrAddr(rs.getString("mgr_addr"));
		mgr.setMgrLevel(rs.getInt("mgr_level"));
		mgr.setMgrStatus(rs.getInt("mgr_status"));
		mgr.setMgrEnrollDate(rs.getDate("sysdate"));
		mgr.setMgrAddrType(rs.getString("mgr_addr_type"));
		return mgr;
	}

}
