package com.halici.chp_scs.fragment;


import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.SecmenListesiAdapter;
import com.halici.chp_scs.common.Crypto;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;

import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

public class SandikSecmenListesiFragment extends ListFragment {

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
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
		System.out.println("SandikSecmenLstesi oncreateView");
		
		final View v = inflater.inflate(R.layout.pdf_list, container, false);
		
		new Servis().execute();

		return v;
		
	}


	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
	}


	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		shPreferences=this.getActivity().getSharedPreferences("data", 0);
		
		try {
			this.savedName= Crypto.decrypt(Util.SH_SEED, shPreferences.getString(Util.SH_NAME, ""));
			this.savedPassword=Crypto.decrypt(Util.SH_SEED, shPreferences.getString(Util.SH_PASSWORD, ""));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public class Servis extends AsyncTask<String, Void, String>{
		private ProgressDialog dialog = new ProgressDialog(getActivity());
	
		@Override
		protected String doInBackground(String... params) {
			Sorgulama sorgu=new Sorgulama(savedName,savedPassword);
			String sonuc=sorgu.secmenListesiGetir();
						
			liste=new SandikSecmenListesi(sonuc);
			
			return sonuc;
		}
	
		@Override
		protected void onPostExecute(String sonuc) {
			dialog.dismiss();
			
			SecmenListesiAdapter adapter=new SecmenListesiAdapter(getActivity(),liste);
			setListAdapter(adapter);
		
		}
	
		@Override
		protected void onPreExecute() {
			
			dialog.setMessage("Bilgiler alınıyor; lütfen Bekleyin.");
			dialog.show();
		}
	
		@Override
		protected void onProgressUpdate(Void... values) {
			
		}
	}	
}