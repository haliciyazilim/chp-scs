package com.halici.chp_scs.fragment;



import java.util.ArrayList;
import java.util.HashMap;

import com.artifex.mupdfdemo.MuPDFActivity;
import com.halici.chp_scs.PDFObject;
import com.halici.chp_scs.R;
import com.halici.chp_scs.adapter.PDFListAdapter;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.ListFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

public class GenelgelerFragment extends ListFragment {
public static final String TAG=GenelgelerFragment.class.getSimpleName();
	
	private static final String ABOUT_SCHEME = "view";
	private static final String ABOUT_AUTHORITY = "genelgeler";
	public static final Uri ABOUT_URI = new Uri.Builder()
		.scheme(ABOUT_SCHEME)
		.authority(ABOUT_AUTHORITY)
		.build();
	
//	private ListView listView;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
		System.out.println("Genelgeler oncreateView");
		
		final View v = inflater.inflate(R.layout.pdf_list, container, false);
			
//		listView=(ListView)v.findViewById(R.id.pdfList);
		
		HashMap<String, String> pdf=new HashMap<String, String>();
		pdf.put("Birinci PDF", "http://google.com.tr");
		pdf.put("İkinci PDF", "http://gmail.com");
		
		PDFObject bir=new PDFObject("Title", "SUbTitle", pdf);
		
		ArrayList<PDFObject> obje=new ArrayList<PDFObject>();
		obje.add(bir);
		
		PDFListAdapter adapter=new PDFListAdapter(getActivity(),obje);
		
		if(adapter.isEmpty())
			System.out.println("adapter is empty");
		else
			System.out.println("adapter is not empty");
		
		setListAdapter(adapter);
		
		return v;
		
		}
	
	
	@Override
		public void onListItemClick(ListView l, View v, int position, long id) {
			super.onListItemClick(l, v, position, id);
			
			HashMap<String, String> hashmap=(HashMap<String, String>)l.getItemAtPosition(position);
			
			String[] list=hashmap.keySet().toArray(new String[hashmap.size()]);
			
			System.out.println("Selected: "+list[0]+" value"+hashmap.get(list[0]));
			
//			String adress=(String)l.getItemAtPosition(position)) ;
//			System.out.println("Selected: "+adress);
			
			showPDF("/mnt/sdcard/Download/matematik_1.pdf");
			
			
		}
	
	
	
	public void showPDF(String adress){
		Intent intent=new Intent(getActivity(), MuPDFActivity.class);
		intent.putExtra("pdfFile", adress);
		startActivity(intent);
		
	}
	
	@Override
		public void onCreate(Bundle savedInstanceState) {
			super.onCreate(savedInstanceState);
			System.out.println("Genelgeler oncreate");
//			HashMap<String, String> pdf=new HashMap<String, String>();
//			pdf.put("Birinci PDF", "http://google.com.tr");
//			pdf.put("İkinci PDF", "http://gmail.com");
//			
//			PDFObject bir=new PDFObject("Title", "SUbTitle", pdf);
//			
//			ArrayList<PDFObject> obje=new ArrayList<PDFObject>();
//			obje.add(bir);
//			
//			PDFListAdapter adapter=new PDFListAdapter(getActivity(),obje);
//			
//			if(adapter.isEmpty())
//				System.out.println("adapter is empty");
//			else
//				System.out.println("adapter is empty");
//			
//			listView.setAdapter(adapter);
		}
}
