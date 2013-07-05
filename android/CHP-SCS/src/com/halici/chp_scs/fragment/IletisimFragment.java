package com.halici.chp_scs.fragment;



import com.halici.chp_scs.ExternalFont;
import com.halici.chp_scs.MainActivity;
import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.SecmenListesiAdapter;
import com.halici.chp_scs.common.Crypto;
import com.halici.chp_scs.common.Iletisim;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

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
	
	TextView tvIlceBaskaniHeader,tvIlceBaskanligiHeader,
	tvBilsimSorumlusuHeader,tvBitemHeader;
	
	TextView tvSandikNo,tvIlceBaskani,tvIlceBaskaniTel,tvIlceBaskanligiTel,
	tvBilsimSorumlusu,tvBilsimSorumlusuTel,tvBitemEPosta,tvBitemTel;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		final View v=inflater.inflate(R.layout.iletisim, container,false);
		
		
		new ExternalFont(getActivity());
		Typeface fontM=ExternalFont.getFontM();
		Typeface fontL=ExternalFont.getFontL();
		
		tvIlceBaskaniHeader=(TextView)v.findViewById(R.id.ilceBaskaniHeader);
		tvIlceBaskaniHeader.setTypeface(fontM);
		tvIlceBaskanligiHeader=(TextView)v.findViewById(R.id.ilceBaskanligiHaeder);
		tvIlceBaskanligiHeader.setTypeface(fontM);
		tvBilsimSorumlusuHeader=(TextView)v.findViewById(R.id.bitemHeader);
		tvBilsimSorumlusuHeader.setTypeface(fontM);
		
		
		tvSandikNo=(TextView) v.findViewById(R.id.iletisimSandiNo);
		tvIlceBaskani=(TextView) v.findViewById(R.id.ilceBaskaniName);
		tvIlceBaskaniTel=(TextView) v.findViewById(R.id.ilceBaskaniTel);
		tvIlceBaskanligiTel=(TextView) v.findViewById(R.id.ilceBaskanligiTel);
		tvBilsimSorumlusu=(TextView) v.findViewById(R.id.ilceBilisimSorumlusuName);
		tvBilsimSorumlusuTel=(TextView) v.findViewById(R.id.ilceBilisimSorumlusuTel);
		tvBitemEPosta=(TextView) v.findViewById(R.id.bitem_ePostaMail);
		tvBitemTel=(TextView) v.findViewById(R.id.bitemTelefonPhone);
		
		iletisimBilgileri=(Iletisim)getArguments().getSerializable(Util.ILETISIM);
		
		tvSandikNo.setText(iletisimBilgileri.getSandikNo());
		tvSandikNo.setTypeface(fontL);
		tvIlceBaskani.setText(iletisimBilgileri.getIlceBaskani());
		tvIlceBaskani.setTypeface(fontL);
		tvIlceBaskaniTel.setText(iletisimBilgileri.getIlceBaskaniTel());
		tvIlceBaskaniTel.setTypeface(fontL);
		tvIlceBaskanligiTel.setText(iletisimBilgileri.getIlceBaskanligiTel());
		tvIlceBaskanligiTel.setTypeface(fontL);
		tvBilsimSorumlusu.setText(iletisimBilgileri.getIlceBilisimSorumlusu());
		tvBilsimSorumlusu.setTypeface(fontL);
		tvBilsimSorumlusuTel.setText(iletisimBilgileri.getIlceBilisimSorumlusuTel());
		tvBilsimSorumlusuTel.setTypeface(fontL);
		tvBitemEPosta.setText(iletisimBilgileri.getBitemEPosta());
		tvBitemEPosta.setTypeface(fontL);
		tvBitemEPosta.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent mailIntent=new Intent(Intent.ACTION_SENDTO);
				mailIntent.setType("text/plain");
//				mailIntent.putExtra(Intent.EXTRA_SUBJECT, "CHP-SÇS Mobil Uygulaması");
//				mailIntent.putExtra(Intent.EXTRA_TEXT, "Abdullah Karacabey");
				mailIntent.setData(Uri.parse("mailto:"+iletisimBilgileri.getBitemEPosta()));
				mailIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
				
			    
			    
			    try {
			    	getActivity().startActivity(mailIntent);
			    } catch (android.content.ActivityNotFoundException ex) {
			        Toast.makeText(getActivity(), "There are no email clients installed.", Toast.LENGTH_SHORT).show();
			    }
				
			}
		});
		tvBitemTel.setText(iletisimBilgileri.getBitemTel());
		tvBitemTel.setTypeface(fontL);
		
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
}
