package com.saturnboy.events
{
    import flash.events.Event;

    /**
     *
     */
    public class TerrificTabBarEvent extends Event
    {

        public static const CLOSE_TAB:String = "closeTab";

        public var index:int;

        public function TerrificTabBarEvent( type:String,
            index:int,
            bubbles:Boolean = false,
            cancelable:Boolean = false )
        {
            super( type, bubbles, cancelable );
            this.index = index;
        }

        override public function clone():Event
        {
            return new TerrificTabBarEvent( type, index, bubbles, cancelable );
        }

    }
}
