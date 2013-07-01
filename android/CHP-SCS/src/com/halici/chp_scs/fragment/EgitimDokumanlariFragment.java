package com.halici.chp_scs.fragment;

import android.net.Uri;
import android.support.v4.app.Fragment;

public class EgitimDokumanlariFragment extends Fragment {
public static final String TAG=EgitimDokumanlariFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "egitim_dokumanlari";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
}
