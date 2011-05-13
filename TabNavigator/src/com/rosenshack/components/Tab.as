package com.rosenshack.components
{
    import com.saturnboy.components.ITab;

    import spark.components.Group;

    /**
     *
     */
    public class Tab extends Group implements ITab
    {
        private var _closeable:Boolean = true;
        private var _tabTitle:String = "";

        [Bindable] public function get tabTitle():String
        {
            return _tabTitle;
        }

        public function set tabTitle( value:String ):void
        {
            _tabTitle = value;
        }

        [Bindable] public function get closeable():Boolean
        {
            return _closeable;
        }

        public function set closeable( value:Boolean ):void
        {
            _closeable = value;
        }
    }
}