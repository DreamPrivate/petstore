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
package com.dream.petstore.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dream.petstore.entity.Order;
import com.dream.petstore.service.OrderService;

/**
 * @author ronghua
 * 
 */
@Controller
@RequestMapping("/order")
public class OrderController extends AbstractController {

	private static final long serialVersionUID = -6171288227470176272L;

	private static final String CONFIRM_ORDER = "order/ConfirmOrder";
	private static final String LIST_ORDERS = "order/ListOrders";
	private static final String NEW_ORDER = "order/NewOrderForm";
	private static final String SHIPPING = "order/ShippingForm";
	private static final String VIEW_ORDER = "order/ViewOrder";
	
	private static final String KEY_ORDER = "order";
	private static final String KEY_ORDERSID = "orderSid";

	private static final List<String> CARD_TYPE_LIST;

	@Autowired
	private transient OrderService orderService;

	static {
		List<String> cardList = new ArrayList<String>();
		cardList.add("Visa");
		cardList.add("MasterCard");
		cardList.add("American Express");
		CARD_TYPE_LIST = Collections.unmodifiableList(cardList);
	}

	@RequestMapping(value = "listOrders", method = RequestMethod.GET)
	public String listOrders(HttpSession session, Model model) {
		AccountController accountBean = (AccountController) session
				.getAttribute(KEY_ACCOUNT_CONTROLLER);
		List<Order> orderList = orderService.getOrdersByUsername(accountBean.getAccount()
				.getUsername());
		model.addAttribute("orderList", orderList);
		return LIST_ORDERS;
	}

	@RequestMapping(value = "newOrderForm", method = RequestMethod.GET)
	public String newOrderForm(HttpSession session, Model model) {
		AccountController accountBean = (AccountController) session
				.getAttribute(KEY_ACCOUNT_CONTROLLER);
		CartController cartBean = (CartController) session
				.getAttribute(KEY_CART_CONTROLLER);

		clear();
		if (accountBean == null || !accountBean.isAuthenticated()) {
			String msg = "You must sign on before attempting to check out.  Please sign on and try checking out again.";
			setMessage(model, msg);
			// return new ForwardResolution(AccountActionBean.class);
			return "forward:/account/signonForm";
		} else if (cartBean != null) {
			Order order = new Order();
			order.initOrder(accountBean.getAccount(), cartBean.getCart());
			model.addAttribute(KEY_ORDER, order);
			model.addAttribute("creditCardTypes", CARD_TYPE_LIST);
			String orderSid = KEY_ORDERSID + System.currentTimeMillis();
			model.addAttribute(KEY_ORDERSID, orderSid);
			session.setAttribute(orderSid, order);
			return NEW_ORDER;
		} else {
			String msg = "An order could not be created because a cart could not be found.";
			setMessage(model, msg);
			return ERROR;
		}
	}
	
	@RequestMapping(value = "newShipping", method = RequestMethod.POST)
	public String newShipping(boolean shippingAddressRequired, Order orderInfo, 
			String orderSid, HttpSession session, Model model) {
		Order order = (Order) session.getAttribute(orderSid);
		if (order == null) {
			setMessage(model, "An error occurred processing your order (order was null).");
			return ERROR;
		}
		
		String returnPage = null;
		if (shippingAddressRequired) {
			mergeOrderInfo(order, orderInfo);
			returnPage = SHIPPING;
		} else {
			mergeShippingInfo(order, orderInfo);
			returnPage = CONFIRM_ORDER;
		}
		
		model.addAttribute(KEY_ORDER, order);
		model.addAttribute(KEY_ORDERSID, orderSid);
		session.setAttribute(orderSid, order);
		return returnPage;
	}
	
	@RequestMapping(value = "newOrder", method = {RequestMethod.POST, RequestMethod.GET})
	public String newOrder(boolean confirmed, Order orderInfo, 
			String orderSid, HttpSession session, Model model) {
		Order order = (Order) session.getAttribute(orderSid);
		if(order == null) {
			setMessage(model, "An error occurred processing your order (order was null).");
			return ERROR;
		} else if (!confirmed) {
			mergeOrderInfo(order, orderInfo);
			model.addAttribute(KEY_ORDER, order);
			model.addAttribute(KEY_ORDERSID, orderSid);
			session.setAttribute(orderSid, order);
			return CONFIRM_ORDER;
		} else {
			orderService.insertOrder(order);
			CartController cartBean = (CartController) session
					.getAttribute(KEY_CART_CONTROLLER);
			cartBean.clear(session);
			model.addAttribute(KEY_ORDER, order);
			session.removeAttribute(orderSid);
			setMessage(model, "Thank you, your order has been submitted.");

			return VIEW_ORDER;
		}
	}

	@RequestMapping(value = "viewOrder", method = RequestMethod.GET)
	public String viewOrder(Order order, HttpSession session, Model model) {
		AccountController accountBean = (AccountController) session
				.getAttribute(KEY_ACCOUNT_CONTROLLER);

		order = orderService.getOrder(order.getOrderId());

		if (accountBean.getAccount().getUsername().equals(order.getUsername())) {
			model.addAttribute(KEY_ORDER, order);
			return VIEW_ORDER;
		} else {
			//order = null;
			setMessage(model, "You may only view your own orders.");
			return ERROR;
		}
	}

	public void clear() {
		
	}

	public List<String> getCreditCardTypes() {
		return CARD_TYPE_LIST;
	}
	
	private void mergeOrderInfo(Order order, Order orderInfo) {
		order.setCardType(orderInfo.getCardType());
		order.setCreditCard(orderInfo.getCreditCard());
		order.setExpiryDate(orderInfo.getExpiryDate());
		order.setBillToFirstName(orderInfo.getBillToFirstName());
		order.setBillToLastName(orderInfo.getBillToLastName());
		order.setBillAddress1(orderInfo.getBillAddress1());
		order.setBillAddress2(orderInfo.getBillAddress2());
		order.setBillCity(orderInfo.getBillCity());
		order.setBillState(orderInfo.getBillState());
		order.setBillZip(orderInfo.getBillZip());
		order.setBillCountry(orderInfo.getBillCountry());
	}
	
	private void mergeShippingInfo(Order order, Order shippingInfo) {
		order.setShipToFirstName(shippingInfo.getShipToFirstName());
		order.setShipToLastName(shippingInfo.getShipToLastName());
		order.setShipAddress1(shippingInfo.getShipAddress1());
		order.setShipAddress2(shippingInfo.getShipAddress2());
		order.setShipCity(shippingInfo.getShipCity());
		order.setShipState(shippingInfo.getShipState());
		order.setShipZip(shippingInfo.getShipZip());
		order.setShipCountry(shippingInfo.getShipCountry());
	}
}
