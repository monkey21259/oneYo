package main.ict.mem.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.ict.mem.dao.MemDAO;

@Service
@Transactional
public class MemServiceImpl implements MemService {
	
	//	log4j 세팅
	private Logger logger = LogManager.getLogger(MemServiceImpl.class);
	
	//	DAO
	@Autowired(required=false)
	private MemDAO memDAO;
	
}
