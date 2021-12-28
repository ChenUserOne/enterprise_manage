package com.itcast.ssm.service;

import com.itcast.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll() throws Exception;

    void save(Permission permission) throws Exception;

    Permission findById(String id);

    void delete(String id);
}
