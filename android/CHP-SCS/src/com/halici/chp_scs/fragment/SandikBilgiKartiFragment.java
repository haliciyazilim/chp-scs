package com.halici.chp_scs.fragment;

import com.halici.chp_scs.R;
import com.halici.chp_scs.common.Util;

import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class SandikBilgiKartiFragment extends Fragment {

public static final String TAG=SandikBilgiKartiFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "sandik_bilgi_karti";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	
	private WebView webView;
	private String url;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
	final View v = inflater.inflate(R.layout.sandik_bilgi_karti, container, false);
	
	url=getArguments().getString(Util.SANDIK_BILGI_KARTI);
	
	webView = (WebView) v.findViewById(R.id.sandikBilgikarti);
	webView.setWebViewClient(new MyWebViewClient());
	webView.getSettings().setBuiltInZoomControls(false); 
	webView.getSettings().setSupportZoom(false);
	webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);   
	webView.getSettings().setAllowFileAccess(true); 
	webView.getSettings().setDomStorageEnabled(true);
	webView.loadUrl(url);
	
	return v;
	}
	
	private class MyWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
        	view.loadUrl(url);
            return true;
        }
    }
}

