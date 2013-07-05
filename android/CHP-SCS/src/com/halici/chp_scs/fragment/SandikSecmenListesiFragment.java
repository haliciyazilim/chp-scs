package com.halici.chp_scs.fragment;


import com.halici.chp_scs.ExternalFont;
import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.SecmenListesiAdapter;
import com.halici.chp_scs.common.Crypto;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;

import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

public class SandikSecmenListesiFragment extends Fragment {

	public static final String TAG=SandikSecmenListesiFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "sandik_secmen_listesi";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();

	
	SharedPreferences shPreferences;
	SharedPreferences.Editor shPrefEditor;
	String savedName, savedPassword;
	SandikSecmenListesi liste;
	LinearLayout topBar;
	ListView listView;
	TextView txtSandikNo, txtSecmenSayisi;
	String sandikNo;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
		System.out.println("SandikSecmenLstesi oncreateView");
		
		final View view = inflater.inflate(R.layout.sandik_secmen_listesi, container, false);
		
		new ExternalFont(getActivity());
		Typeface fontM=ExternalFont.getFontM();
		Typeface fontL=ExternalFont.getFontL();
		
		topBar=(LinearLayout)view.findViewById(R.id.llSecmenListeTop);
		topBar.getBackground().setAlpha(70);
		
		liste=(SandikSecmenListesi)getArguments().getSerializable(Util.SANDIK_SECMEN_LISTESI);
		
		txtSandikNo=(TextView)view.findViewById(R.id.txtSandikNo);
		txtSecmenSayisi=(TextView)view.findViewById(R.id.txtSecmenSayisi);
		txtSandikNo.setTypeface(fontM);
		txtSecmenSayisi.setTypeface(fontM);
		txtSandikNo.setText("Sandık No: "+liste.getSandikNo());
		txtSecmenSayisi.setText("Seçmen Sayısı: "+liste.getKayitSayisi());
		
		listView=(ListView)view.findViewById(R.id.listSecmen);
		SecmenListesiAdapter adapter=new SecmenListesiAdapter(getActivity(),liste);
		listView.setAdapter(adapter);
		
		return view;
		
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
	}


}