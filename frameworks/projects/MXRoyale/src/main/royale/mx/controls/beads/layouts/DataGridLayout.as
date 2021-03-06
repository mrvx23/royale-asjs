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
package mx.controls.beads.layouts
{
    import org.apache.royale.core.IUIBase;
    import org.apache.royale.core.IBorderPaddingMarginValuesImpl;
    import org.apache.royale.core.ValuesManager;
    import org.apache.royale.core.layout.EdgeData;
    import org.apache.royale.html.beads.IDataGridView;
    import org.apache.royale.html.beads.models.ButtonBarModel;
    import org.apache.royale.html.beads.layouts.DataGridLayout;
    import mx.controls.dataGridClasses.DataGridColumn;

	
    /**
     *  The DataGridLayout class.
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.0
     */
	public class DataGridLayout extends org.apache.royale.html.beads.layouts.DataGridLayout
	{
        /**
         *  Constructor.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.0
         */
		public function DataGridLayout()
		{
        }

        /**
         * @copy org.apache.royale.core.IBeadLayout#layout
         * @royaleignorecoercion org.apache.royale.core.IBorderPaddingMarginValuesImpl
         * @royaleignorecoercion org.apache.royale.core.IDataGridModel
         * @royaleignorecoercion org.apache.royale.core.IUIBase
         * @royaleignorecoercion org.apache.royale.core.UIBase
         * @royaleignorecoercion org.apache.royale.html.beads.IDataGridView
         * @royaleignorecoercion org.apache.royale.html.beads.models.ButtonBarModel
         * @royaleignorecoercion org.apache.royale.html.supportClasses.IDataGridColumn
         */
        override public function layout():Boolean
        {
            var header:IUIBase = (uiHost.view as IDataGridView).header;
            // fancier DG's will filter invisible columns and only put visible columns
            // in the bbmodel, so do all layout based on the bbmodel, not the set
            // of columns that may contain invisible columns
            var bbmodel:ButtonBarModel = header.getBeadByType(ButtonBarModel) as ButtonBarModel;
            // do the proportional sizing of columns
            var borderMetrics:EdgeData = (ValuesManager.valuesImpl as IBorderPaddingMarginValuesImpl).getBorderMetrics(_strand as IUIBase);			
            var useWidth:Number = uiHost.width - (borderMetrics.left + borderMetrics.right);
            var useHeight:Number = uiHost.height - (borderMetrics.top + borderMetrics.bottom);
            
            var totalWidths:Number = 0;
            var unspecifiedWidths:int = 0;
            if (bbmodel.dataProvider)
            {
                for(var i:int=0; i < bbmodel.dataProvider.length; i++) {
                    var columnDef:DataGridColumn = bbmodel.dataProvider[i] as DataGridColumn;
                    if (!isNaN(columnDef.width))
                        totalWidths += columnDef.width;
                    else
                        unspecifiedWidths++;
                }
            }
            else
            {
                return true;
            }
            
            if (unspecifiedWidths > 0 && totalWidths > 0)
            {
                // some widths are specified, others are not, so fit the unspecified
                // in the remaining space
                var remainingSpace:Number = useWidth - totalWidths;
                var proportionateShare:Number = remainingSpace / unspecifiedWidths;
                for(i=0; i < bbmodel.dataProvider.length; i++) {
                    columnDef = bbmodel.dataProvider[i] as DataGridColumn;
                    if (!isNaN(columnDef.width))
                        columnDef.columnWidth = columnDef.width;
                    else
                        columnDef.columnWidth = proportionateShare;
                }                
            }
            else if (totalWidths > 0)
            {
                if (totalWidths != useWidth)
                {
                    var factor:Number = useWidth / totalWidths;
                    for(i=0; i < bbmodel.dataProvider.length; i++) {
                        columnDef = bbmodel.dataProvider[i] as DataGridColumn;
                        columnDef.columnWidth = columnDef.width * factor;
                    }                
                }
            }
            
            return super.layout();
        }
	}
}
