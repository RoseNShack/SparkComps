package com.rosenshack.components
{
	import com.rosenshack.skins.iOSCalloutSkin;
	import com.rosenshack.utils.DefaultStyles;

	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.core.FlexGlobals;
	import mx.styles.CSSStyleDeclaration;

	import spark.components.Group;
	import spark.components.SkinnableContainer;

	[Event(name="clear", type="flash.events.Event")]
	public class iOSCallout extends SkinnableContainer
	{

		{
			DefaultStyles.setupDefaultStyles("com.rosenshack.components.iOSCallout", iOSCalloutSkin,
				function():void
			{
				this.skinClass=Class(iOSCalloutSkin);
			});
		}

		[SkinPart(required="false")]
		public var clearButton:Group;

		// properties 

		[Bindable] public var label:String;
		[Bindable] public var showClearButton:Boolean=false;
		[Bindable] public var arrowPositionX:Number=0;

		[Bindable]
		[Inspectable(category="General", defaultValue="above", enumeration="above,below")]
		public var arrowDrection:String="above";

		public function iOSCallout()
		{
			super();
		}

		private function clearClickHandler(event:MouseEvent=null):void
		{
			this.dispatchEvent(new Event("clear"));
		}

		override protected function commitProperties():void
		{
			super.commitProperties();

			if (clearButton != null)
			{
				clearButton.addEventListener(MouseEvent.CLICK, clearClickHandler, false, 0, true);
			}
		}

	}
}
