package com.dream.petstore.service;

import java.util.List;

import com.dream.petstore.entity.Category;
import com.dream.petstore.entity.Item;
import com.dream.petstore.entity.Product;

/**
 * CatalogService接口
 * 
 * @author ronghua
 * @version 1.0
 * @date 2016年12月6日 下午11:13:00
 * @since 1.8
 */
public interface ICatalogService {

	public List<Category> getCategoryList();
	
	public Category getCategory(String categoryId);
	
	public Product getProduct(String productId);
	
	public List<Product> getProductListByCategory(String categoryId);
	
	public List<Product> searchProductList(String keywords);
	
	public List<Item> getItemListByProduct(String productId);
	
	public Item getItem(String itemId);
	
	public boolean isItemInStock(String itemId);
}
