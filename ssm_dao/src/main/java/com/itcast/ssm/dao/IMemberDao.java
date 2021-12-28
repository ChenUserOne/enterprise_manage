package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;


/**
 * @author 17710
 */

public interface IMemberDao {
    /**
     * id查询
     * @param memberId
     * @return
     * @throws Exception
     */
    @Select("select * from member where id=#{memberId}")
    Member findById(Integer memberId) throws Exception;
}
