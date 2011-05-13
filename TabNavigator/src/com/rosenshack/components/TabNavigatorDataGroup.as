package com.rosenshack.components
{
    import com.rosenshack.layout.TabNavigatorLayout;
    import com.saturnboy.components.TerrificTabBar;
    import com.saturnboy.events.TerrificTabBarEvent;

    import spark.components.DataGroup;
    import spark.events.IndexChangeEvent;

    public class TabNavigatorDataGroup extends DataGroup
    {

        private var _tabBar:TerrificTabBar;

        public function TabNavigatorDataGroup()
        {
            super();
            this.layout = new TabNavigatorLayout();
            this.itemRenderer = new TabNavigatorRenderer();
        }

        [Bindable] public function get tabBar():TerrificTabBar
        {
            return _tabBar;
        }

        public function set tabBar( value:TerrificTabBar ):void
        {
            _tabBar = value;

            // setup up data provider
            _tabBar.dataProvider = this.dataProvider;

            // listen for changes
            _tabBar.addEventListener( IndexChangeEvent.CHANGE, tabChangedHandler );
        }

        private function tabChangedHandler( event:IndexChangeEvent ):void
        {
            this.invalidateDisplayList();
        }

    }
}
