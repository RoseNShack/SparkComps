package com.saturnboy.components
{

    import com.saturnboy.events.TerrificTabBarEvent;

    import flash.events.MouseEvent;

    import spark.components.Button;
    import spark.components.ButtonBarButton;
    import spark.components.Label;

    [Event( name='closeTab', type='com.saturnboy.events.TerrificTabBarEvent' )]
    public class TerrificTabBarButton extends ButtonBarButton
    {

        [SkinPart( required="false" )]
        public var closeButton:Button;

        private var _closeable:Boolean = true;

        public function TerrificTabBarButton()
        {
            super();
            this.mouseChildren = true;
        }

        [Bindable] public function get closeable():Boolean
        {
            return _closeable;
        }

        public function set closeable( val:Boolean ):void
        {
            if ( _closeable != val )
            {
                _closeable = val;
                ( labelDisplay as Label ).right = ( val ? 30 : 14 );
            }
        }

        private function closeHandler( e:MouseEvent ):void
        {
            dispatchEvent( new TerrificTabBarEvent( TerrificTabBarEvent.CLOSE_TAB, itemIndex, this.content, true ) );
        }

        override protected function partAdded( partName:String, instance:Object ):void
        {
            super.partAdded( partName, instance );

            if ( instance == closeButton )
            {
                closeButton.addEventListener( MouseEvent.CLICK, closeHandler );
            }
            else if ( instance == labelDisplay )
            {
                ( labelDisplay as Label ).right = ( closeable ? 30 : 14 );
            }
        }

        override protected function partRemoved( partName:String, instance:Object ):void
        {
            super.partRemoved( partName, instance );

            if ( instance == closeButton )
            {
                closeButton.removeEventListener( MouseEvent.CLICK, closeHandler );
            }
        }

    }
}
