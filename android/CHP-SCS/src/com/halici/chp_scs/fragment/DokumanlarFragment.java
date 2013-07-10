package com.halici.chp_scs.fragment;




import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;

import com.artifex.mupdfdemo.MuPDFActivity;

import com.halici.chp_scs.Login;
import com.halici.chp_scs.MainActivity;
import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.PDFListAdapter;
import com.halici.chp_scs.common.Document;
import com.halici.chp_scs.common.DocumentList;
import com.halici.chp_scs.common.DownloadDocument;
import com.halici.chp_scs.common.Iletisim;
import com.halici.chp_scs.common.SandikCevresiSorumluBilgileri;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;

import android.R.bool;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.Toast;


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
	boolean isCanceled;
	String clickedItemTitle;
//	private ListView listView;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
		System.out.println("Genelgeler oncreateView");
		
		final View v = inflater.inflate(R.layout.pdf_list, container, false);
		if(docType==1)
			liste=(DocumentList)getArguments().getSerializable(Util.EGITIM_DOKUMANLARI);
		else
			liste=(DocumentList)getArguments().getSerializable(Util.GENELGELER);
		PDFListAdapter adapter=new PDFListAdapter(getActivity(),liste);
		setListAdapter(adapter);
		
//		System.out.println("Dokumanlar fragment docTye:"+docType);
		return v;
		
		}
	
	
	@Override
	public void onListItemClick(ListView l, View v, int position, long id) {
		super.onListItemClick(l, v, position, id);
			
		@SuppressWarnings("unchecked")
		HashMap<String, String> hashmap=(HashMap<String, String>)l.getItemAtPosition(position);
			
		System.out.println("Selected: "+hashmap.get(Document.DOC_NAME)+" value"+hashmap.get(Document.DOC_LINK));

//		showPDF(hashmap.get(Document.DOC_LINK));
		clickedItemTitle=hashmap.get(Document.DOC_NAME);
		new Servis().execute(hashmap.get(Document.DOC_LINK));
	}
	
	public void showPDF(String adress, String title){
		Intent intent=new Intent(getActivity(), MuPDFActivity.class);
		intent.putExtra(PDF_FILE, adress);
		intent.putExtra(Util.PDF_TITLE, title);
		startActivity(intent);
	}
	

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
	}
	
	public class Servis extends AsyncTask<String, Void, String>{
		AlertDialog alert;
		@Override
		protected void onPreExecute() {
			AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
	        builder.setMessage("Dokümanlar indiriliyor...");
	        builder.setCancelable(true);
	        builder.setNeutralButton("İptal Et",
	                new DialogInterface.OnClickListener() {
	            public void onClick(DialogInterface dialog, int id) {
	            	isCanceled=true;
	                dialog.cancel();
	            }
	        });

	        alert = builder.create();
	        alert.show();
		}
		
		@Override
		protected String doInBackground(String... params) {
			
			DownloadDocument download=new DownloadDocument(getActivity(),params[0]);
			String sonuc=download.downloadDocument();
			System.out.println("Pdf Adres: "+sonuc);
			return sonuc;
		}

		@Override
		protected void onProgressUpdate(Void... values) {
			
		}
		
		@Override
		protected void onPostExecute(String sonuc) {
			
			alert.dismiss();
			
			if(!isCanceled && sonuc!=null)
				showPDF(sonuc,clickedItemTitle);
			else{
				Toast.makeText(getActivity(), "İnternet bağlantınız ile ilgili bir sorun var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
				
			}
			
			
		}

		

		
		
		
		
	}


	
}
