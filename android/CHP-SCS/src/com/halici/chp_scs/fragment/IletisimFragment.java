package com.halici.chp_scs.fragment;



import com.halici.chp_scs.R;

import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class IletisimFragment extends Fragment{

	public static final String TAG=IletisimFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "iletisim";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		final View v=inflater.inflate(R.layout.iletisim, container,false);
		
		
		return v;
	}
	
}
