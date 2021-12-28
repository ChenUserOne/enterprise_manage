package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 17710
 */
public interface ITravellerDao {
    /**
     * 根据ordersId查询
     * @param ordersId
     * @return
     * @throws Exception
     */
    @Select("select * from traveller  where id in (select travellerId from order_traveller where orderId=#{ordersId})")
    List<Traveller> findByOrdersId(Integer ordersId) throws Exception;
}
