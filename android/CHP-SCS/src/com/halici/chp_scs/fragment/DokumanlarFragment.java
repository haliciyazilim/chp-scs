package com.halici.chp_scs.fragment;




import java.util.HashMap;

import com.artifex.mupdfdemo.MuPDFActivity;

import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.PDFListAdapter;
import com.halici.chp_scs.common.Document;
import com.halici.chp_scs.common.DocumentList;
import com.halici.chp_scs.common.Sorgulama;

import android.app.ProgressDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;


public class DokumanlarFragment extends ListFragment {
	public static final String TAG=DokumanlarFragment.class.getSimpleName();
	public static final String PDF_FILE="pdfFile";
	public static int docType;
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "dokumanlar";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	DocumentList liste;
//	private ListView listView;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
		System.out.println("Genelgeler oncreateView");
		
		final View v = inflater.inflate(R.layout.pdf_list, container, false);
		
		new Servis().execute();
//		System.out.println("Dokumanlar fragment docTye:"+docType);
		return v;
		
		}
	
	
	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
			
		@SuppressWarnings("unchecked")
		HashMap<String, String> hashmap=(HashMap<String, String>)l.getItemAtPosition(position);
			
		System.out.println("Selected: "+hashmap.get(Document.DOC_NAME)+" value"+hashmap.get(Document.DOC_LINK));

		showPDF(hashmap.get(Document.DOC_LINK));	
	}
	
	
	
	public void showPDF(String adress){
		Intent intent=new Intent(getActivity(), MuPDFActivity.class);
		intent.putExtra(PDF_FILE, adress);
		startActivity(intent);
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
	}
	
	
	public class Servis extends AsyncTask<String, Void, String>{
		private ProgressDialog dialog = new ProgressDialog(getActivity());

		@Override
		protected String doInBackground(String... params) {
			Sorgulama sorgu=new Sorgulama(docType);
			String sonuc=sorgu.docGetir();
			
//			System.out.println("Genelge sonuc: "+sonuc);
			
			liste=new DocumentList(docType, sonuc);
			
			return sonuc;
		}

		@Override
		protected void onPostExecute(String sonuc) {
			dialog.dismiss();
			System.out.println("Genelge getActivity"+getActivity().toString());
			PDFListAdapter adapter=new PDFListAdapter(getActivity(),liste);
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
