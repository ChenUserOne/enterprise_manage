package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 17710
 */
public interface IPermissionDao {
    /**
     * 根据roleid查询
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id})")

    List<Permission> findPermissionByRoleId(String id) throws  Exception;

    /**
     * 查询
     * @return
     * @throws Exception
     */
    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    /**
     * 增加
     * @param permission
     */
    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission);

    /**
     * ID查询
     * @param id
     * @return
     */
    @Select("select * from permission where id=#{id}")
    Permission findById(String id);

    /**
     * permissionId删除
     * @param id
     */
    @Delete("delete from role_permission where permissionId=#{id}")
    void deleteFromRole_PermissionByPermissionId(String id);

    /**
     * id删除
     * @param id
     */
    @Delete("delete from permission where id=#{id}")
    void deleteFromPermissionById(String id);
}
