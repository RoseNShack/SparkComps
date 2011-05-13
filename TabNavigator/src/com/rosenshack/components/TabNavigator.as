package com.rosenshack.components
{
    import com.rosenshack.skins.TabNavigatorDefaultSkin;
    import com.saturnboy.components.TerrificTabBar;

    import mx.collections.ArrayCollection;
    import mx.core.FlexGlobals;
    import mx.styles.CSSStyleDeclaration;

    import spark.components.SkinnableContainer;

    /**
     *
     */
    public class TabNavigator extends SkinnableContainer
    {
        /**
         *
         */
        [Bindable] public var dataProvider:ArrayCollection;

        /**
         * @private
         */
        public var tabBar:TerrificTabBar;

        /**
         * @private
         */
        public var dataGroup:TabNavigatorDataGroup;

        // static block to setup default styles
        {
            setupDefaultStyles( "com.rosenshack.components.TabNavigator", TabNavigatorDefaultSkin );
        }

        /**
         * @private
         */
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

        /**
         * @private
         */
        override protected function createChildren():void
        {
            super.createChildren();

            tabBar = new TerrificTabBar();
            tabBar.left = 0;
            tabBar.right = 0;
            tabBar.top = 0;
            tabBar.height = 25;
            addElement( tabBar );

            dataGroup = new TabNavigatorDataGroup();
            dataGroup.left = 0;
            dataGroup.right = 0;
            dataGroup.top = 26;
            dataGroup.bottom = 0;
            addElement( dataGroup );
        }

        override protected function commitProperties():void
        {
            super.commitProperties();

            if ( dataGroup != null )
            {
                dataGroup.tabBar = this.tabBar;
                dataGroup.dataProvider = this.dataProvider;
            }

            if ( tabBar != null )
            {
                this.tabBar.dataProvider = this.dataProvider;
            }
        }

    }
}