package com.rosenshack.skins
{

	import com.rosenshack.components.iOSCallout;
	import com.rosenshack.graphics.DownArrow;
	import com.rosenshack.graphics.UpArrow;
	import com.rosenshack.graphics.iOSCalloutBackground;

	import flash.events.Event;

	import spark.components.Group;
	import spark.components.supportClasses.StyleableTextField;
	import spark.skins.mobile.SkinnableContainerSkin;

	//[SkinState("normal")]
	//[SkinState("disabled")]
	//[HostComponent("com.rosenshack.components.iOSCallout")]
	public class iOSCalloutSkin extends SkinnableContainerSkin
	{
		private var background:iOSCalloutBackground;
		private var titleLabel:StyleableTextField;
		private var upArrow:UpArrow;
		private var downArrow:DownArrow;
		private var clearButton:Group;

		public function iOSCalloutSkin()
		{
			super();
		}

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

			clearButton=new Group();
			clearButton.id="clearButton";
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
		}

		/**
		 *  @private
		 */
		override protected function commitCurrentState():void
		{
			alpha=(currentState == "disabled") ? 0.5 : 1;
		}

		/**
		 *  @private
		 */
		override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);

			setElementPosition(background, 0, 15);
			setElementSize(background, this.width, this.height - 30);

			downArrow.y=this.height - 15;

			titleLabel.width=this.width;
			titleLabel.y=24;

			contentGroup.setLayoutBoundsSize(this.width - 12, this.height - 81);
			contentGroup.setLayoutBoundsPosition(6, 60);
		}

		/**
		 *  @private
		 */
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			//no background
		}

		//
		//
		//

		protected function clearButton_touchRollOverHandler(event:Event):void
		{
//			clearButtonBackgroundEffect.alpha=1;
		}

		protected function clearButton_touchRollOutHandler(event:Event):void
		{
//			clearButtonBackgroundEffect.alpha=0;
		}



	}
}