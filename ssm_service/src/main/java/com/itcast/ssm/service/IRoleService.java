package com.itcast.ssm.service;

import com.itcast.ssm.domain.Permission;
import com.itcast.ssm.domain.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;

    Role findById(String id) throws Exception;

    void delete(String id) throws Exception;

    List<Permission> findOtherPermission(String roleId);

    void addPermissionToRole(String roleId, String[] ids);

}
