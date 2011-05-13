package com.saturnboy.components
{

    import com.saturnboy.events.TerrificTabBarEvent;
    import com.saturnboy.skins.TerrificTabBarButtonDefaultSkin;
    import com.saturnboy.skins.TerrificTabBarCloseButtonDefaultSkin;
    import com.saturnboy.skins.TerrificTabBarDefaultSkin;

    import mx.collections.IList;
    import mx.core.FlexGlobals;
    import mx.core.IVisualElement;
    import mx.core.UIComponent;
    import mx.styles.CSSStyleDeclaration;

    import spark.components.IItemRenderer;
    import spark.components.TabBar;

    [Event( name='closeTab', type='com.saturnboy.events.TerrificTabBarEvent' )]
    public class TerrificTabBar extends TabBar
    {

        // static block to setup default styles
        {
            setupDefaultStyles( "com.saturnboy.components.TerrificTabBar", TerrificTabBarDefaultSkin );
            setupDefaultStyles( "com.saturnboy.components.TerrificTabBarButton", TerrificTabBarButtonDefaultSkin );
            setupDefaultStyles( "com.saturnboy.components.TerrificTabBarCloseButton", TerrificTabBarCloseButtonDefaultSkin );
        }

        private static function setupDefaultStyles( compName:String, skinClazz:Class ):void
        {
            var styles:CSSStyleDeclaration = FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration( compName );
            if ( !styles )
            {
                var defStyles:CSSStyleDeclaration = new CSSStyleDeclaration();
                defStyles.defaultFactory = function():void
                {
                    this.skinClass = Class( skinClazz );
                }
                FlexGlobals.topLevelApplication.styleManager.setStyleDeclaration( compName, defStyles, true );
            }
            else if ( !styles.getStyle( 'skinClass' ) )
            {
                styles.setStyle( 'skinClass', Class( skinClazz ) );
            }
        }

        public function setCloseableTab( index:int, value:Boolean ):void
        {
            if ( index >= 0 && index < dataGroup.numElements )
            {
                var btn:TerrificTabBarButton = dataGroup.getElementAt( index ) as TerrificTabBarButton;
                btn.closeable = value;
            }
        }

        public function getCloseableTab( index:int ):Boolean
        {
            if ( index >= 0 && index < dataGroup.numElements )
            {
                var btn:TerrificTabBarButton = dataGroup.getElementAt( index ) as TerrificTabBarButton;
                return btn.closeable;
            }
            return false;
        }

        public function closeTab( closedTab:int, selectedTab:int ):void
        {
            if ( dataProvider.length == 0 )
            {
                return;
            }

            if ( dataProvider is IList )
            {
                dataProvider.removeItemAt( closedTab );
            }
            else if ( dataProvider is UIComponent )
            {
                //remove the entire child from the dataProvider, which also removes it from the ViewStack
                ( dataProvider as UIComponent ).removeChildAt( closedTab );
            }

            //adjust selectedIndex appropriately
            if ( dataProvider.length == 0 )
            {
                selectedIndex = -1;
            }
            else if ( closedTab < selectedTab )
            {
                selectedIndex = selectedTab - 1;
            }
            else if ( closedTab == selectedTab )
            {
                selectedIndex = ( selectedTab == 0 ? 0 : selectedTab - 1 );
            }
            else
            {
                selectedIndex = selectedTab;
            }
        }

        protected function closeHandler( e:TerrificTabBarEvent ):void
        {
            closeTab( e.index, this.selectedIndex );
            this.dispatchEvent( e );
        }

        protected override function partAdded( partName:String, instance:Object ):void
        {
            super.partAdded( partName, instance );

            if ( instance == dataGroup )
            {
                dataGroup.addEventListener( TerrificTabBarEvent.CLOSE_TAB, closeHandler );
            }
        }

        protected override function partRemoved( partName:String, instance:Object ):void
        {
            super.partRemoved( partName, instance );

            if ( instance == dataGroup )
            {
                dataGroup.removeEventListener( TerrificTabBarEvent.CLOSE_TAB, closeHandler );
            }
        }

        override public function updateRenderer( renderer:IVisualElement, itemIndex:int, data:Object ):void
        {
            super.updateRenderer( renderer, itemIndex, data );

            if ( data is ITab )
            {
                var page:ITab = data as ITab;

                //set title
                ( renderer as IItemRenderer ).label = page.tabTitle;

                //set closeable 
                if ( renderer as TerrificTabBarButton )
                {
                    ( renderer as TerrificTabBarButton ).closeable = page.closeable;
                }
            }
        }

    }
}
