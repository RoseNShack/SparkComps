package com.rosenshack.utils
{
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.styles.CSSStyleDeclaration;

	import spark.components.SkinnableContainer;

	public class DefaultStyles
	{
		public static function setupDefaultStyles(compName:String, skinClazz:Class, styleFactor:Function):void
		{
			var styles:CSSStyleDeclaration=FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration(compName);
			if (!styles)
			{
				var defStyles:CSSStyleDeclaration=new CSSStyleDeclaration();
				defStyles.defaultFactory=styleFactor;
				FlexGlobals.topLevelApplication.styleManager.setStyleDeclaration(compName, defStyles, true);
			}
			else if (!styles.getStyle('skinClass'))
			{
				styles.setStyle('skinClass', Class(skinClazz));
			}
		}
	}
}