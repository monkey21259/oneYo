package main.ict.test.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.test.dao.TestDAO;
import main.ict.test.vo.TestVO;

@Service
@Transactional
public class TestServiceImpl implements TestService {
	Logger logger = LogManager.getLogger(TestServiceImpl.class);
	
	@Autowired(required=false)
	private TestDAO testDAO;
	
	@Override
	public List<TestVO> testSelectAll() {
		// TODO Auto-generated method stub
		logger.info("testSelectAll() 함수 진입");
		return testDAO.testSelectAll();
	}

}
