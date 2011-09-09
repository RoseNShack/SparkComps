package com.rosenshack.skins
{

	import com.rosenshack.components.iOSBlackButton;
	import com.rosenshack.components.iOSCallout;
	import com.rosenshack.graphics.DownArrow;
	import com.rosenshack.graphics.UpArrow;
	import com.rosenshack.graphics.iOSCalloutBackground;

	import spark.components.supportClasses.StyleableTextField;
	import spark.skins.mobile.SkinnableContainerSkin;

	public class iOSCalloutSkin extends SkinnableContainerSkin
	{
		private var background:iOSCalloutBackground;
		private var titleLabel:StyleableTextField;
		private var upArrow:UpArrow;
		private var downArrow:DownArrow;

		public function iOSCalloutSkin()
		{
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  SkinParts
		//
		//--------------------------------------------------------------------------

		public var clearButton:iOSBlackButton;


		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------

		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			// background
			background=new iOSCalloutBackground();
			this.addChild(background);

			// title label
			titleLabel=StyleableTextField(createInFontContext(StyleableTextField));
			this.addChild(titleLabel);

			// arrows
			upArrow=new UpArrow();
			this.addChild(upArrow);

			downArrow=new DownArrow();
			this.addChild(downArrow);

			clearButton=new iOSBlackButton();
			clearButton.roundCorners=true;
			this.addChild(clearButton);

			//content group
			super.createChildren();
		}

		/**
		 *  @private
		 */
		override protected function commitProperties():void
		{
			super.commitProperties();

			if (downArrow != null)
			{
				downArrow.visible=(hostComponent as iOSCallout).arrowDrection == 'above';
				downArrow.x=(hostComponent as iOSCallout).arrowPositionX;
			}

			if (upArrow != null)
			{
				upArrow.visible=(hostComponent as iOSCallout).arrowDrection != 'above';
				upArrow.x=(hostComponent as iOSCallout).arrowPositionX;
			}

			if (titleLabel != null)
			{
				titleLabel.text=(hostComponent as iOSCallout).label;
				titleLabel.setStyle("textAlign", "center");
				titleLabel.setStyle("fontWeight", "bold");
				titleLabel.setStyle("fontSize", 20);
				titleLabel.setStyle("color", 0xffffff);
				titleLabel.commitStyles();
			}

			if (clearButton != null)
			{
				clearButton.label="Clear";
				clearButton.visible=(hostComponent as iOSCallout).showClearButton;
			}
		}

		/**
		 *  @private
		 */
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);

			setElementPosition(background, 0, 14);
			setElementSize(background, this.width, this.height - 28);

			downArrow.y=this.height - 15;

			titleLabel.width=this.width;
			titleLabel.y=24;

			setElementPosition(contentGroup, 6, 60);
			setElementSize(contentGroup, this.width - 12, this.height - 81);

			setElementPosition(clearButton, this.width - 85, 20);
			setElementSize(clearButton, 75, 32);
		}

		/**
		 *  @private
		 */
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			//no background
		}

	}
}