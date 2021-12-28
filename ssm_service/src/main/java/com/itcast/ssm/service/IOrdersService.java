package com.itcast.ssm.service;

import com.itcast.ssm.domain.Orders;

import java.util.List;

/**
 * @author 17710
 */
public interface IOrdersService {
    /**
     * 查询全部
     * @return
     * @throws Exception
     */
    List<Orders> findAll(int page, int size)throws Exception;

    /**
     * id查询
     * @param ordersId
     * @return
     * @throws Exception
     */
    Orders findById(Integer ordersId) throws  Exception;
}
