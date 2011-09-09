package com.rosenshack.components
{
	import com.rosenshack.skins.iOSBlackButtonSkin;
	import com.rosenshack.utils.DefaultStyles;

	import spark.components.Button;

	public class iOSBlackButton extends Button
	{

		public var roundCorners:Boolean=false;

		/**
		 * Set default style class
		 */
		{
			DefaultStyles.setupDefaultStyles("com.rosenshack.components.iOSBlackButton", iOSBlackButtonSkin,
				function():void
			{
				this.skinClass=Class(iOSBlackButtonSkin);
			});
		}

		public function iOSBlackButton()
		{
			super();
		}

	}
}