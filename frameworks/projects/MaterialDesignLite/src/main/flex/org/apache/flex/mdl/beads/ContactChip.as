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
package org.apache.flex.mdl.beads
{
    import org.apache.flex.core.IBead;
    import org.apache.flex.core.IStrand;
    import org.apache.flex.html.Span;
    import org.apache.flex.mdl.supportClasses.IMdlColor;
    import org.apache.flex.mdl.supportClasses.IMdlTextColor;
    import org.apache.flex.utils.StrandUtils;

    COMPILE::JS
    {
        import org.apache.flex.core.UIHTMLElementWrapper;
        import org.apache.flex.core.UIBase;
        import org.apache.flex.core.WrappedHTMLElement;
    }
    /**
     *  The ContactChip bead class is a specialty bead that can be used to add additional
     *  button to Chip MDL control.
     *
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion FlexJS 0.0
     */
    COMPILE::SWF
    public class ContactChip
    {
        private var _contactText:String;

        public function ContactChip()
        {

        }

        public function set contactText(value:String):void
        {
            _contactText = value;
        }
    }

    COMPILE::JS
    public class ContactChip implements IBead
    {
        /**
         *  constructor.
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        public function ContactChip()
        {
        }

        private var _contactText:String = "";

        private var contact:Span;
        private var textNode:Text;

        private var _strand:IStrand;
        private var _strandHtmlElement:HTMLElement;

        /**
         * @flexjsignorecoercion HTMLElement
         * @flexjsignorecoercion HTMLSpanElement
         * @flexjsignorecoercion Text
         * @flexjsignorecoercion HTMLButtonElement
         * @flexjsignorecoercion org.apache.flex.core.WrappedHTMLElement
         *
         * @param value
         */
        public function set strand(value:IStrand):void
        {
            _strand = value;
            
            var host:UIBase = value as UIBase;
            _strandHtmlElement = host.element as HTMLElement;
            var isValidElement:Boolean = _strandHtmlElement is HTMLSpanElement || _strandHtmlElement is HTMLButtonElement;

            if (isValidElement && _strandHtmlElement.className.search("mdl-chip") > -1)
            {
                _strandHtmlElement.classList.add("mdl-chip--contact");

                textNode = document.createTextNode('') as Text;
                textNode.nodeValue = _contactText;

                contact = new Span();
                contact.element.classList.add("mdl-chip__contact");

                loadColorBead();
                loadTextColorBead();

                contact.element.appendChild(textNode);

                _strandHtmlElement.insertBefore(contact.element, host["chipTextSpan"]);
            }
            else
            {
                throw new Error("Host component must be an MDL Host for Chips.");
            }
        }

        public function set contactText(value:String):void
        {
            _contactText = value;
        }

        private function loadColorBead():void
        {
            var mdlColorBead:MdlColor = StrandUtils.loadBead(MdlColor, "MdlColor", _strand) as MdlColor;

            if (mdlColorBead != null)
            {
                var mdlColorElement:String = mdlColorBead.getMdlElementColor();
                if (!mdlColorElement)
                {
                   throw new Error("MdlColor bead exists, but there is no color specified");
                }

                _strandHtmlElement.classList.remove(mdlColorElement);
                contact.addBead(mdlColorBead);
            }
        }

        private function loadTextColorBead():void
        {
            var mdlTextColorBead:MdlTextColor = StrandUtils.loadBead(MdlTextColor, "MdlTextColor", _strand)
                    as MdlTextColor;

            if (mdlTextColorBead != null)
            {
                var mdlTextElementTextColor:String = mdlTextColorBead.getMdlElementTextColor();
                if (!mdlTextElementTextColor)
                {
                    throw new Error("MdlTextColor bead exists, but there is no textColor specified");
                }

                _strandHtmlElement.classList.remove(mdlTextElementTextColor);
                contact.addBead(mdlTextColorBead);
            }
        }
    }
}
