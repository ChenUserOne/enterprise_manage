package com.itcast.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 格式转换工具类
 * @author 17710
 */
public class DateUtils {
    /**
     * 日期转化为字符串
     * @param date
     * @param str
     */
    public static String dateToString(Date date,String str){
        SimpleDateFormat dateFormat=new SimpleDateFormat(str);
        String format = dateFormat.format(date);
        return format;
    }

    public static Date stringToDate(String str,String patt) throws ParseException {
        SimpleDateFormat dateFormat=new SimpleDateFormat(patt);
        Date parse = dateFormat.parse(str);
        return  parse;
    }
}
