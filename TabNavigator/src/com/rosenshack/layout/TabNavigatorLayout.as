package com.rosenshack.layout
{
    import com.rosenshack.components.TabNavigatorDataGroup;

    import mx.core.IVisualElement;

    import spark.layouts.supportClasses.LayoutBase;

    /**
     *
     */
    public class TabNavigatorLayout extends LayoutBase
    {
        override public function updateDisplayList( width:Number, height:Number ):void
        {
            var layoutTarget:TabNavigatorDataGroup = target as TabNavigatorDataGroup;
            var selectedIndex:int = layoutTarget.tabBar.selectedIndex;
            var count:int = layoutTarget.numElements;

            for ( var i:int = 0; i < count; i++ )
            {
                var element:IVisualElement = ( useVirtualLayout ? layoutTarget.getVirtualElementAt( i ) : layoutTarget.getElementAt( i ) ) as IVisualElement;

                if ( i == selectedIndex )
                {
                    element.visible = true;
                    element.width = layoutTarget.width;
                    element.height = layoutTarget.height;
                }
                else
                {
                    element.visible = false;
                }
            }
        }
    }
}