package com.dream.petstore.util;

/**
 * 字符串工具类，扩展自org.apache.commons.lang3.StringUtils
 * 
 * @author ronghua
 * @version 1.0
 * @date 2016年12月14日 下午10:51:02
 * @since 1.7
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

	/**
	 * 如果obj是null，返回空串，否则返回obj.toString()
	 * @param obj	判断对象
	 * @return
	 */
	public static String emptyIfNull(Object obj) {
		return obj == null ? "" : obj.toString();
	}
}
