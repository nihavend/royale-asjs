////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.icons
{
    import org.apache.royale.utils.StringUtil;

    /**
     *  Icons can be used alone or in buttons and other controls 
     * 
     *  This class could be used with any icon family out there and with
     *  its text property
     *
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.9.3
     * 
     *  @deprecated this class will be removed soon
     */
    public class FontIcon extends FontIconBase
    {
        /**
         *  constructor.
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
        public function FontIcon()
        {
            super();

            typeNames = "fonticon";
        }
        
        /**
         *  The text of the icon
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
        override public function set text(value:String):void
		{
            super.text = value;

			COMPILE::JS
			{
                textNode.nodeValue = _text;	
			}
		}

        /**
         *  The icon text
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
        override protected function get iconText():String
        {
            return text;
        }

        private var _material:Boolean;
        /**
         *  add class name "material-icons" since in IE11 this font only
         *  works with that class name strangely. it seems we can avoid this 
         *  self-hosting the fonts @see https://google.github.io/material-design-icons/
         *  but we must think if this is or not the right way.
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.3
         */
        public function get material():Boolean
        {
            return _material;
        }
        public function set material(value:Boolean):void
        {
            if (_material != value)
            {
                _material = value;

                typeNames = StringUtil.removeWord(typeNames, " material-icons");
                typeNames += " material-icons";

                COMPILE::JS
                {
                    if (parent)
                        setClassName(computeFinalClassNames()); 
                }
            }
        }
    }
}
