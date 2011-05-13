package com.saturnboy.components
{
    import mx.core.IVisualElement;

    public interface ITab extends IVisualElement
    {

        function get closeable():Boolean;
        function set closeable( value:Boolean ):void;

        function get tabTitle():String;
        function set tabTitle( value:String ):void;

    }
}