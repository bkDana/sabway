package kr.co.subway.headOffice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import kr.co.subway.headOffice.vo.Apply;

public class ApplyRowMapper implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Apply ap = null;
		ap = new Apply();
		ap.setApplyNo(rs.getInt("apply_no"));
		ap.setApplyName(rs.getString("apply_name"));
		ap.setApplyPhone(rs.getString("apply_phone"));
		ap.setApplyEmail(rs.getString("apply_email"));
		ap.setApplyArea(rs.getString("apply_area"));
		ap.setApplyTitle(rs.getString("apply_title"));
		ap.setApplyContent(rs.getString("apply_content"));
		ap.setApplyFilename(rs.getString("apply_filename"));
		ap.setApplyFilepath(rs.getString("apply_filepath"));
		ap.setApplyStatus(rs.getInt("apply_status"));
		ap.setApplyDate(rs.getDate("sysdate"));
		return ap;
		}
}
