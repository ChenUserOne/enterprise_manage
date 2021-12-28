package com.itcast.ssm.service.impl;

import com.itcast.ssm.dao.ISysLogDao;
import com.itcast.ssm.domain.SysLog;
import com.itcast.ssm.service.ISysLogSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogSService {
    @Autowired
    private ISysLogDao sysLogDao;


    @Override
    public void save(SysLog sysLog) {
         sysLogDao.save(sysLog);
    }

    @Override
    public List<SysLog> findAll() {
        return sysLogDao.findAll();
    }
}
