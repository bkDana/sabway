package kr.co.subway.managerOrder.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;

@Component
@Repository
public class ManagerOrderSchedule {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//@Scheduled(cron="1 50 16 * * *")
/*	@Scheduled(cron="1 1 8 * * *")
	private void deliveryEnd() {
		
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String endDay = f.format(new Date());
		
		SearchVO search = new SearchVO();
		search.setDelDay(endDay);
		int result = sqlSession.update("managerOrder.deliveryEnd",search);
		System.out.println("["+endDay+"] 총 "+result+"개의 발주상태 변경");
	}
*/
}
