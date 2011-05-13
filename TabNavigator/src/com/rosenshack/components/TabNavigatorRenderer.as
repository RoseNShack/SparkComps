package com.rosenshack.components
{
    import com.saturnboy.components.ITab;
    import mx.core.IFactory;
    import spark.components.supportClasses.ItemRenderer;

    /**
     *
     */
    public class TabNavigatorRenderer extends ItemRenderer implements IFactory
    {

        public function TabNavigatorRenderer()
        {
            this.percentHeight = 100;
            this.percentWidth = 100;
        }

        public function newInstance():*
        {
            return new TabNavigatorRenderer();
        }

        override public function set data( value:Object ):void
        {
            this.removeAllElements();

            if ( value != null )
            {
                var comp:ITab = value as ITab;
                comp.percentHeight = 100;
                comp.percentWidth = 100;
                this.addElement( comp );
            }
        }

    }
}
