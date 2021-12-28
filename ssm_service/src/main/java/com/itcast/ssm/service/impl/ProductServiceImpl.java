package com.itcast.ssm.service.impl;

import com.itcast.ssm.dao.IProductDao;
import com.itcast.ssm.domain.Product;
import com.itcast.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 业务层实现类
 * @author 17710
 */
@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;



    @Override
    public List<Product> findAll() throws Exception {

        return productDao.findAll();
    }

    @Override
    public void save(Product product) throws Exception {
        productDao.save(product);
    }
}
