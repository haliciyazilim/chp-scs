package com.halici.chp_scs;

import android.content.Context;
import android.graphics.Typeface;

public class ExternalFont {
	
	private static Context context;
	
	public ExternalFont(Context con) {
		context=con;
	}
	
	public static Typeface getFontM(){
	return Typeface.createFromAsset(context.getAssets(), "fonts/SWZ721M.TTF");
	}
	
	public static Typeface getFontL(){
		return Typeface.createFromAsset(context.getAssets(), "fonts/SWZ721L.TTF");
	}

	public static Typeface getFontT(){
		return Typeface.createFromAsset(context.getAssets(), "fonts/SWZ721T.TTF");
	}

}
