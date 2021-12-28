package com.itcast.ssm.dao;

import com.itcast.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 数据层接口
 * @author 17710
 */
public interface IProductDao {


        /**
         * 根据id查询
         * @param id
         * @return
         * @throws Exception
         */
        @Select("select * from product where id=#{id}")
        public Product findById(String id) throws Exception;

        /**
         * 查询所有的产品信息
         * @return
         * @throws Exception
         */
        @Select("select * from product")
         List<Product> findAll() throws Exception;

        /**
         * 增加
         * @param product
         */
        @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values (#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
        void save(Product product);
}
