package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Permission;
import com.itcast.ssm.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 17710
 */
public interface IRoleDao {
    /**
     * id查询
     * @param userId
     * @return
     * @throws Exception
     */
    @Select("select * from role where id in (select roleId from users_role where usersId=#{userId})")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "roleName", column = "roleName"),
            @Result(property = "roleDesc", column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.itcast.ssm.dao.IPermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByUserId(String userId) throws Exception;

    /**
     * 查询全部
     * @return
     * @throws Exception
     */
    @Select("select * from role" )
    List<Role> findAll() throws Exception;

    /**
     * 增加
     * @param role
     * @throws Exception
     */
    @Insert("insert into role (roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role) throws Exception;

    /**
     * ID查询
     * @param id
     * @return
     */
    @Select("select * from role where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = List.class,many = @Many(select = "com.itcast.ssm.dao.IPermissionDao.findPermissionByRoleId")),
    })
    Role findById(String id);

    /**
     * 删除
     * @param id
     * @return
     */
    @Delete("delete from users_role where roleId=#{id}")
    void deleteFromUser_RoleByRoleId(String id);
    /**
     * 删除
     * @param id
     * @return
     */
    @Delete("delete from role_permission where roleId=#{id}")
    void deleteFromRole_PermissionByRoleId(String id);
    /**
     * 删除
     * @param id
     * @return
     */
    @Delete("delete from role where id=#{id}")
    void deleteRoleById(String id);

    /**
     *查询role中没有的permission
     * @param roleId
     * @return
     */
    @Select("select * from permission where id not in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermission(String roleId);



    /**
     * 添加
     * @param roleId
     * @param permissionId
     */
    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId") String permissionId);
}
