package com.halici.chp_scs.fragment;

import com.halici.chp_scs.R;
import com.halici.chp_scs.common.Util;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class SandikBilgiKartiActivity extends Activity {

public static final String TAG=SandikBilgiKartiActivity.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "sandik_bilgi_karti";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	
	private WebView webView;
	private String url;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.sandik_bilgi_karti);
		
		url=getIntent().getStringExtra(Util.SANDIK_BILGI_KARTI);
		
		webView = (WebView)findViewById(R.id.sandikBilgikarti);
		webView.setWebViewClient(new MyWebViewClient());
		webView.getSettings().setBuiltInZoomControls(true); 
		webView.getSettings().setSupportZoom(true);
		webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);   
		webView.getSettings().setAllowFileAccess(true); 
		webView.getSettings().setDomStorageEnabled(true);
		webView.loadUrl(url);
		
		
	}


	/*
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
	final View v = inflater.inflate(R.layout.sandik_bilgi_karti, container, false);
	
	url=getArguments().getString(Util.SANDIK_BILGI_KARTI);
	
	webView = (WebView) v.findViewById(R.id.sandikBilgikarti);
	webView.setWebViewClient(new MyWebViewClient());
	webView.getSettings().setBuiltInZoomControls(true); 
	webView.getSettings().setSupportZoom(true);
	webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);   
	webView.getSettings().setAllowFileAccess(true); 
	webView.getSettings().setDomStorageEnabled(true);
	webView.loadUrl(url);
	
	return v;
	}
	*/
	private class MyWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
        	view.loadUrl(url);
            return true;
        }
    }
}

