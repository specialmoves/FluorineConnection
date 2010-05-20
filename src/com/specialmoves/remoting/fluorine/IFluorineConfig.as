/*
 * Licensed under the MIT License
 * 
 * Copyright (c) 2010 Specialmoves Ltd
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * http://github.com/specialmoves/FluorineConnection
 * http://www.opensource.org/licenses/mit-license.php
 */
package com.specialmoves.remoting.fluorine {

	/**
	 * 
	 * Any FluorineConnection instance needs to know the url of the gateway, have some class aliases registered, and know the API prefix.
	 * This interface makes sure that the config property of the FluorineConnection class is an object that contains this information.
	 * 
	 * @author mattbilson 22 Jan 2010
* @version 3.0
	 * @see com.specialmoves.remoting.fluorine.FluorineConnection#config
	 * 
	 * @example An example FluorineConfig class
	 * 
	 * <listing version="3.0">
	 * public class FluorineConfig implements IFluorineConfig {
		 * private var _url : String;
		 * 
		 * public function FluorineConfig(url : String) {
		 * 		_url = url;
		 * }
		 * 		
		 * public function defineClassMapping() : void {
		 * 		registerClassAlias(apiPrefix+"Content", ContentVO);
		 * 		registerClassAlias(apiPrefix+"Property", PropertyVO);
		 * }
		 * 
		 * public function get gatewayURL() : String {
		 * 		return _url;
		 * }
		 * 		
		 * public function get apiPrefix() : String {
		 * 		return "com.specialmoves.projectname.Frontend.";
		 * }
	 * }
	 * </listing>
	 */
	public interface IFluorineConfig {
		/**
		 * This is where to define the class mappings between backend and frontend classes
		 */
		function defineClassMapping():void;
		
		/**
		 * The url to the Gateway.aspx Fluorine page
		 */
		function get gatewayURL() : String;
		
		/**
		 * The package name prefixed to the method calls.
		 * This can also be used in <code>defineClassMappings()</code>
		 */		function get apiPrefix() : String;
	}
}
