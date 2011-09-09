package com.rosenshack.skins
{
	import com.rosenshack.components.iOSBlackButton;
	import com.rosenshack.graphics.iOSBlackButtonDown;
	import com.rosenshack.graphics.iOSBlackButtonDownRounded;
	import com.rosenshack.graphics.iOSBlackButtonUp;
	import com.rosenshack.graphics.iOSBlackButtonUpRounded;

	import mx.events.FlexEvent;

	import spark.components.supportClasses.ButtonBase;
	import spark.components.supportClasses.StyleableTextField;
	import spark.skins.mobile.ButtonSkin;

	public class iOSBlackButtonSkin extends ButtonSkin
	{
		public function iOSBlackButtonSkin()
		{
			super();
		}

		override public function set hostComponent(value:ButtonBase):void
		{
			super.hostComponent=value;

			if ((this.hostComponent as iOSBlackButton).roundCorners)
			{
				upBorderSkin=iOSBlackButtonUpRounded;
				downBorderSkin=iOSBlackButtonDownRounded;
			}
			else
			{
				upBorderSkin=iOSBlackButtonUp;
				downBorderSkin=iOSBlackButtonDown;
			}
		}

		override protected function createChildren():void
		{
			labelDisplay=StyleableTextField(createInFontContext(StyleableTextField));
			labelDisplay.setStyle("color", 0xffffff);
			labelDisplay.setStyle("fontSize", 14);
			labelDisplay.setStyle("fontWeight", "bold");
			labelDisplay.styleName=this;

			// update shadow when labelDisplay changes
			labelDisplay.addEventListener(FlexEvent.VALUE_COMMIT, labelDisplay_valueCommitHandler);

			addChild(labelDisplay);

			if (!labelDisplayShadow && labelDisplay)
			{
				labelDisplayShadow=StyleableTextField(createInFontContext(StyleableTextField));
				labelDisplayShadow.styleName=this;
			}
		}

		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			//no background
		}
	}
}
