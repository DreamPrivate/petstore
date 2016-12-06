/**
 *    Copyright 2010-2015 the original author or authors.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
package com.dream.petstore.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dream.petstore.entity.Category;
import com.dream.petstore.entity.Item;
import com.dream.petstore.entity.Product;
import com.dream.petstore.mapper.CategoryMapper;
import com.dream.petstore.mapper.ItemMapper;
import com.dream.petstore.mapper.ProductMapper;
import com.dream.petstore.service.ICatalogService;

/**
 * @author Eduardo Macarron
 *
 */
@Service
public class CatalogService implements ICatalogService {

	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<Category> getCategoryList() {
		return categoryMapper.getCategoryList();
	}

	@Override
	public Category getCategory(String categoryId) {
		return categoryMapper.getCategory(categoryId);
	}

	@Override
	public Product getProduct(String productId) {
		return productMapper.getProduct(productId);
	}

	@Override
	public List<Product> getProductListByCategory(String categoryId) {
		return productMapper.getProductListByCategory(categoryId);
	}

	@Override
	public List<Product> searchProductList(String keywords) {
		List<Product> products = new ArrayList<Product>();
		for (String keyword : keywords.split("\\s+")) {
			products.addAll(productMapper.searchProductList("%" + keyword.toLowerCase() + "%"));
		}
		return products;
	}

	@Override
	public List<Item> getItemListByProduct(String productId) {
		return itemMapper.getItemListByProduct(productId);
	}

	@Override
	public Item getItem(String itemId) {
		return itemMapper.getItem(itemId);
	}

	@Override
	public boolean isItemInStock(String itemId) {
		return itemMapper.getInventoryQuantity(itemId) > 0;
	}
}