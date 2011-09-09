package com.saturnboy.events
{
    import flash.events.Event;

    import mx.core.UIComponent;

    /**
     *
     */
    public class TerrificTabBarEvent extends Event
    {

        public static const CLOSE_TAB:String = "closeTab";

        public var index:int;
        public var tab:Object;

        public function TerrificTabBarEvent( type:String,
            index:int,
            tab:Object,
            bubbles:Boolean = false,
            cancelable:Boolean = false )
        {
            super( type, bubbles, cancelable );
            this.index = index;
            this.tab = tab;
        }

        override public function clone():Event
        {
            return new TerrificTabBarEvent( type, index, tab, bubbles, cancelable );
        }

    }
}
