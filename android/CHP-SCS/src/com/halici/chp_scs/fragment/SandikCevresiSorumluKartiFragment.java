
package com.halici.chp_scs.fragment;

import com.halici.chp_scs.ExternalFont;
import com.halici.chp_scs.MainActivity;
import com.halici.chp_scs.R;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
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
  
  @Override
  public View onCreateView(LayoutInflater inflater, ViewGroup container,
      Bundle savedInstanceState) {

    final View v = inflater.inflate(R.layout.sandik_cevresi_sorumlu_karti, container, false);

    new ExternalFont(getActivity().getApplicationContext());
	Typeface fontM=ExternalFont.getFontM();
	Typeface fontL=ExternalFont.getFontL();
	Typeface fontT=ExternalFont.getFontT();
    
	tvCardDate=(TextView)v.findViewById(R.id.tvsorumluKartiDate);
	tvCardDate.setTypeface(fontT);
	
	tvCardHeader=(TextView)v.findViewById(R.id.tvSorumluKartiHeader);
	tvCardHeader.setTypeface(fontL);

	tvCardName=(TextView)v.findViewById(R.id.tvSorumluKartiName);
	tvCardName.setTypeface(fontM);
	
	tvCardSurName=(TextView)v.findViewById(R.id.tvSorumluKartiSurName);
	tvCardSurName.setTypeface(fontM);

	tvSandikNoHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikNoHeader);
	tvSandikNoHeader.setTypeface(fontL);
	
	tvSandikNo=(TextView)v.findViewById(R.id.tvSorumluKartiSandikSandikNo);
	tvSandikNo.setTypeface(fontT);
	
	tvSandikYeriHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriHeader);
	tvSandikYeriHeader.setTypeface(fontL);
	
	tvSandikYeriIl=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriIl);
	tvSandikYeriIl.setTypeface(fontM);
	
	tvSandikYeriIlce=(TextView)v.findViewById(R.id.tvSorumluKartiSandikYeriIlce);
	tvSandikYeriIlce.setTypeface(fontL);

	tvmuhtarlikHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikMuhtarlikHeader);
	tvmuhtarlikHeader.setTypeface(fontL);

	tvmuhtarlik=(TextView)v.findViewById(R.id.tvSorumluKartiSandikMuhtarlik);
	tvmuhtarlik.setTypeface(fontM);
	
	tvSandikAlaniHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikAlaniHeader);
	tvSandikAlaniHeader.setTypeface(fontL);

	tvSandikAlani=(TextView)v.findViewById(R.id.tvSorumluKartiSandikAlani);
	tvSandikAlani.setTypeface(fontM);
	
	tvSandikGorevilisi2NameHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2NameHeader);
	tvSandikGorevilisi2NameHeader.setTypeface(fontL);

	tvSandikGorevilisi2Name=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2Name);
	tvSandikGorevilisi2Name.setTypeface(fontL);
	
	tvSandikGorevlisi2PhoneHeader=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2PhoneHeader);
	tvSandikGorevlisi2PhoneHeader.setTypeface(fontL);

	tvSandikGorevlisi2Phone=(TextView)v.findViewById(R.id.tvSorumluKartiSandikGorevli2Phone);
	tvSandikGorevlisi2Phone.setTypeface(fontL);
	tvSandikGorevlisi2Phone.setOnClickListener(new View.OnClickListener() {
		
		@Override
		public void onClick(View v) {
			 Intent callIntent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:00903122100020")); 
			 callIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		     getActivity().startActivity(callIntent);
			
		}
	});
	
	
    return v;
  }
}
