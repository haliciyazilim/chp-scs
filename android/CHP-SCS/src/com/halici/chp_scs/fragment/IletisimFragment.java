package com.halici.chp_scs.fragment;



import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.SecmenListesiAdapter;
import com.halici.chp_scs.common.Crypto;
import com.halici.chp_scs.common.Iletisim;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;

import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class IletisimFragment extends Fragment{

	public static final String TAG=IletisimFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "iletisim";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	
	
	SharedPreferences shPreferences;
	SharedPreferences.Editor shPrefEditor;
	String savedName, savedPassword;
	Iletisim iletisimBilgileri;
	
	TextView tvSandikNo,tvIlceBaskani,tvIlceBaskaniTel,tvIlceBaskanligiTel,
	tvBilsimSorumlusu,tvBilsimSorumlusuTel,tvBitemEPosta,tvBitemTel;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		final View v=inflater.inflate(R.layout.iletisim, container,false);
		
		tvSandikNo=(TextView) v.findViewById(R.id.iletisimSandiNo);
		tvIlceBaskani=(TextView) v.findViewById(R.id.ilceBaskaniName);
		tvIlceBaskaniTel=(TextView) v.findViewById(R.id.ilceBaskaniTel);
		tvIlceBaskanligiTel=(TextView) v.findViewById(R.id.ilceBaskanligiTel);
		tvBilsimSorumlusu=(TextView) v.findViewById(R.id.ilceBilisimSorumlusuName);
		tvBilsimSorumlusuTel=(TextView) v.findViewById(R.id.ilceBilisimSorumlusuTel);
		tvBitemEPosta=(TextView) v.findViewById(R.id.bitem_ePostaMail);
		tvBitemTel=(TextView) v.findViewById(R.id.bitemTelefonPhone);
		new Servis().execute();
		return v;
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
			String sonuc=sorgu.iletisimGetir();
						
			iletisimBilgileri=new Iletisim(sonuc);
			
			return sonuc;
		}
	
		@Override
		protected void onPostExecute(String sonuc) {
			dialog.dismiss();
			tvSandikNo.setText(iletisimBilgileri.getSandikNo());
			tvIlceBaskani.setText(iletisimBilgileri.getIlceBaskani());
			tvIlceBaskaniTel.setText(iletisimBilgileri.getIlceBaskaniTel());
			tvIlceBaskanligiTel.setText(iletisimBilgileri.getIlceBaskanligiTel());
			tvBilsimSorumlusu.setText(iletisimBilgileri.getIlceBilisimSorumlusu());
			tvBilsimSorumlusuTel.setText(iletisimBilgileri.getIlceBilisimSorumlusuTel());
			tvBitemEPosta.setText(iletisimBilgileri.getBitemEPosta());
			tvBitemTel.setText(iletisimBilgileri.getBitemTel());
			
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
