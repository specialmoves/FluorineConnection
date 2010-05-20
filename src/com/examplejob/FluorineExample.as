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
package com.examplejob {
	import com.examplejob.remoting.FluorineConfig;
	import com.specialmoves.remoting.fluorine.FluorineConnection;
	import com.specialmoves.remoting.fluorine.FluorineError;
	import com.specialmoves.remoting.fluorine.FluorineErrorEvent;
	import com.specialmoves.remoting.fluorine.FluorineUtils;
	import com.specialmoves.remoting.fluorine.IFluorineConfig;
	import com.specialmoves.remoting.fluorine.IFluorineConnection;

	import flash.display.MovieClip;
	import flash.net.Responder;

	/**
	 * @author mattbilson 22 Jan 2010
	 * @version 3.0
	 */
	public class FluorineExample extends MovieClip {
		
		public function FluorineExample() {
			//set up fluorine connection (PureMVC projects can do this in PrepModelCommand)
			var config : IFluorineConfig = new FluorineConfig("domain" + "/Gateway.aspx");
			var standardFluorineConnection : IFluorineConnection = new FluorineConnection(config);
			//you can listen for errors on the connection object			standardFluorineConnection.addEventListener(FluorineErrorEvent.CONNECT_ERROR, errorHandler, false, 0, true);
			standardFluorineConnection.addEventListener(FluorineErrorEvent.CALL_ERROR, errorHandler, false, 0, true);
			
			//you can set up more than one connection. To use different domains, or totally different configurations.
			var noCdnFluorineConnection : IFluorineConnection = new FluorineConnection(new FluorineConfig("noCdnDomain" + "/Gateway.aspx"));
			
			//PureMVC projects can pass the relevant connection to the proxies which need it
			//facade.registerProxy(new ContentProxy(standardFluorineConnection)); 
			
			//making a call
			var responder : Responder = new Responder(onSuccess, onError);
			var contentId : String = "1";
			standardFluorineConnection.call("Content.GetTypedContentByVirtualPathID", responder, contentId);
			
			//during development, there's a utility error handler you can use for quick debugging
			var responder : Responder = new Responder(onSuccess, FluorineUtils.onError);
			var contentId : String = "1";
			standardFluorineConnection.call("Content.GetTypedContentByVirtualPathID", responder, contentId);
		}
		
		private function errorHandler(event : FluorineErrorEvent) : void {
			trace(event);
		}

		private function onSuccess(result : *) : void {
			trace("success - typed result is returned");
		}

		private function onError(result : Object) : void {
			trace("error - error object returned - this can be parsed into a FluorineError object")
			var error : FluorineError = new FluorineError(result);
		}
	}
}
