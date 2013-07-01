package com.halici.chp_scs.fragment;

import android.net.Uri;
import android.support.v4.app.Fragment;

public class SandikBilgiKartiFragment extends Fragment {

public static final String TAG=SandikBilgiKartiFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "sandik_bilgi_karti";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
}
