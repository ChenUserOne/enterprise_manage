package com.itcast.ssm.service;

import com.itcast.ssm.domain.SysLog;

import java.util.List;

public interface ISysLogSService {
    void save(SysLog sysLog);

    List<SysLog> findAll();
}
