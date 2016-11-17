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

import java.io.Serializable;

import org.springframework.ui.Model;


/**
 * @author ronghua
 *
 */
public abstract class AbstractController implements Serializable {

  private static final long serialVersionUID = -1767714708233127983L;

  protected static final String MAIN = "catalog/Main";
  protected static final String ERROR = "common/Error";
  protected static final String KEY_MSG = "msg";
  protected static final String KEY_ACCOUNT_CONTROLLER = "accountBean";
  protected static final String KEY_CART_CONTROLLER = "cartBean";

  //protected transient ActionBeanContext context;

  /*protected void setMessage(String value) {
    context.getMessages().add(new SimpleMessage(value));
  }*/
  
  protected void setMessage(Model model, String msg) {
	  model.addAttribute(KEY_MSG, msg);
  }
}
