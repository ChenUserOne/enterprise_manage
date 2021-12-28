package com.itcast.ssm.service;

import com.itcast.ssm.domain.Product;


import java.util.List;

/**
 * 业务层接口
 * @author 17710
 */

public interface IProductService {

    /**
     * 查询所有的产品信息
     * @return
     * @throws Exception
     */
    public List<Product> findAll() throws Exception;

    void save(Product product)throws Exception;
}
