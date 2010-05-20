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
	import flash.events.ErrorEvent;
	import flash.events.Event;

	/**
	 * This class is used by FluorineConnection when there is an error upon connecting to, or calling a method on the Fluorine gateway.
	 * @author mattbilson 22 Jan 2010
	 * @version 3.0
	 */
	public class FluorineErrorEvent extends ErrorEvent {
		/**
		* CONNECT_ERROR defines the value of the 
		* <code>type</code> property of the event object 
		* for a <code>CONNECT_ERROR</code> event.
		*
		* <p>The properties of the event object have the following values:</p>
		* <table class=innertable>
		* <tr><th>Property</th><th>Value</th></tr>
		* <tr><td>bubbles</td><td>false</td></tr>		* <tr><td>cancelable</td><td>false</td></tr>		* <tr><td>text</td><td>A string describing the error</td></tr>
		* </table>
		*
		* @eventType CONNECT_ERROR
		*/
		public static const CONNECT_ERROR : String = "CONNECT_ERROR";
		
		/**
		* CALL_ERROR defines the value of the 
		* <code>type</code> property of the event object 
		* for a <code>CALL_ERROR</code> event.
		*
		* <p>The properties of the event object have the following values:</p>
		* <table class=innertable>
		* <tr><th>Property</th><th>Value</th></tr>
		* <tr><td>bubbles</td><td>false</td></tr>
		* <tr><td>cancelable</td><td>false</td></tr>
		* <tr><td>text</td><td>A string describing the error</td></tr>
		* </table>
		*
		* @eventType CALL_ERROR
		*/		public static const CALL_ERROR : String = "CALL_ERROR";

		public function FluorineErrorEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false, text : String = "", id:int =0) {
//			super(type, bubbles, cancelable, text, id);			super(type, bubbles, cancelable, text);	//as3 documentation says this constructor takes an id parameter, FDT says no.
		}
		
		override public function clone() : Event {
			var e : FluorineErrorEvent = new FluorineErrorEvent(type,bubbles, cancelable, text);
			return e;
		}
	}
}
