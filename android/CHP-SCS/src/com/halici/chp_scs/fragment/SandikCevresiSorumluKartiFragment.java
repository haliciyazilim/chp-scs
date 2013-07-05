
package com.halici.chp_scs.fragment;

import com.halici.chp_scs.ExternalFont;
import com.halici.chp_scs.R;
import com.halici.chp_scs.common.SandikCevresiSorumluBilgileri;
import com.halici.chp_scs.common.Util;
import com.halici.chp_scs.common.Resim;

import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

public class SandikCevresiSorumluKartiFragment extends Fragment {
  public static final String TAG = SandikCevresiSorumluKartiFragment.class.getSimpleName();

  private static final String ABOUT_SCHEME = "view";
  private static final String ABOUT_AUTHORITY = "secmen_bilgi_karti";
  public static final Uri ABOUT_URI = new Uri.Builder()
  .scheme(ABOUT_SCHEME)
  .authority(ABOUT_AUTHORITY)
  .build();

  
  
  TextView tvCardDate, tvCardHeader, tvCardName, tvCardSurName;
  TextView  tvSandikNoHeader,tvSandikYeriHeader, tvmuhtarlikHeader, tvSandikAlaniHeader, 
  tvSandikGorevilisi2NameHeader, tvSandikGorevlisi2PhoneHeader; 
  TextView  tvSandikNo,tvSandikYeriIl, tvSandikYeriIlce, tvmuhtarlik, tvSandikAlani, 
  tvSandikGorevilisi2Name, tvSandikGorevlisi2Phone;
  
  ImageView photo;
  
  SandikCevresiSorumluBilgileri scsSorumluBilgileri;
  
  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {

    final View v = inflater.inflate(R.layout.sandik_cevresi_sorumlu_karti, container, false);

    scsSorumluBilgileri=(SandikCevresiSorumluBilgileri)getArguments().getSerializable(Util.SANDIK_CEVRESI_SORUMLU_KARTI);
    
    photo=(ImageView)v.findViewById(R.id.imgSorumluKartiFoto);
    new ResimIndirme().execute();
    
    
    new ExternalFont(getActivity().getApplicationContext());
	Typeface fontM=ExternalFont.getFontM();
	Typeface fontL=ExternalFont.getFontL();
	Typeface fontT=ExternalFont.getFontT();
    
	tvCardDate=(TextView)v.findViewById(R.id.tvsorumluKartiDate);
	tvCardDate.setTypeface(fontT);
	
	tvCardHeader=(TextView)v.findViewById(R.id.tvSorumluKartiHeader);
	tvCardHeader.setTypeface(fontL);

	String[] nameArray=scsSorumluBilgileri.getAdSoyad().split(" ");
	
	String name="";
	for(int i=0; i<nameArray.length-1;i++){
		name+=nameArray[i]+" ";
	}

	String surName=nameArray[nameArray.length-1];
	
	
	
	tvCardName=(TextView)v.findViewById(R.id.tvSorumluKartiName);
	tvCardName.setTypeface(fontM);
	tvCardName.setText(name);
	
	tvCardSurName=(TextView)v.findViewById(R.id.tvSorumluKartiSurName);
	tvCardSurName.setTypeface(fontM);
	tvCardSurName.setText(surName);

	tvSandikNoHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikNoHeader);
	tvSandikNoHeader.setTypeface(fontL);
	
	tvSandikNo=(TextView)v.findViewById(R.id.tvSorumluKartiSandikSandikNo);
	tvSandikNo.setTypeface(fontT);
	tvSandikNo.setText(scsSorumluBilgileri.getSandikNo());
	
	tvSandikYeriHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriHeader);
	tvSandikYeriHeader.setTypeface(fontL);
	
	tvSandikYeriIl=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriIl);
	tvSandikYeriIl.setTypeface(fontM);
	tvSandikYeriIl.setText(scsSorumluBilgileri.getSandikIli());
	
	tvSandikYeriIlce=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriIlce);
	tvSandikYeriIlce.setTypeface(fontL);
	tvSandikYeriIlce.setText(scsSorumluBilgileri.getSandikIlcesi());

	tvmuhtarlikHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikMuhtarlikHeader);
	tvmuhtarlikHeader.setTypeface(fontL);

	tvmuhtarlik=(TextView)v.findViewById(R.id.tvSorumluKartiSandikMuhtarlik);
	tvmuhtarlik.setTypeface(fontM);
	tvmuhtarlik.setText(scsSorumluBilgileri.getMahalleMuhtarligi());
	
	tvSandikAlaniHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikAlaniHeader);
	tvSandikAlaniHeader.setTypeface(fontL);

	tvSandikAlani=(TextView)v.findViewById(R.id.tvSorumluKartiSandikAlani);
	tvSandikAlani.setTypeface(fontM);
	tvSandikAlani.setText(scsSorumluBilgileri.getSandikAlani());
	
	tvSandikGorevilisi2NameHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2NameHeader);
	tvSandikGorevilisi2NameHeader.setTypeface(fontL);

	tvSandikGorevilisi2Name=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2Name);
	tvSandikGorevilisi2Name.setTypeface(fontL);
	tvSandikGorevilisi2Name.setText(scsSorumluBilgileri.getDigerGorevliAdi());
	
	tvSandikGorevlisi2PhoneHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2PhoneHeader);
	tvSandikGorevlisi2PhoneHeader.setTypeface(fontL);

	tvSandikGorevlisi2Phone=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2Phone);
	tvSandikGorevlisi2Phone.setTypeface(fontL);
	tvSandikGorevlisi2Phone.setText(scsSorumluBilgileri.getDigerGoervliTel());
	tvSandikGorevlisi2Phone.setOnClickListener(new View.OnClickListener() {
		
		@Override
		public void onClick(View v) {
			 Intent callIntent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:"+Util.convertPhoneNumber(scsSorumluBilgileri.getDigerGoervliTel()))); 
			 callIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		     getActivity().startActivity(callIntent);
			
		}
	});
	
	
    return v;
  }
  
  
  public class ResimIndirme extends AsyncTask<String, Void, Void>{
	  BitmapDrawable gelenResim;
		@Override
		protected Void doInBackground(String... sUrl) {
			System.out.println("GorevliFoto URL: "+scsSorumluBilgileri.getGorevliFotoUrl());
			gelenResim=Resim.resimGetir(scsSorumluBilgileri.getGorevliFotoUrl());

			
			return null;
			
		}

		@Override
		protected void onPostExecute(Void result) {

			if(gelenResim!=null)
				photo.setImageDrawable(gelenResim);
			else
				System.out.println("Gelen resim null");
			
			super.onPostExecute(result);
		}

		

		

	}
  
}


