package com.halici.chp_scs.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import android.content.Context;
import android.os.Environment;

public class DownloadDocument {

	private File root;
	private String documentName;
	private String url;
	private Context context;
	
	public DownloadDocument(Context context, String url) {
		this.context=context;
		this.url=url;
		this.root=new File(Environment.getExternalStorageDirectory().getAbsolutePath()+"/CHP-SCS");
		
		String[] urlArray=this.url.split("/");
		this.documentName=urlArray[urlArray.length-1];
		
		if(this.root.exists()==false)
			root.mkdir();
	}
	


	public static long getLastModifiedDate(String url){
		
		HttpURLConnection.setFollowRedirects(false);
		HttpURLConnection con;
		long date = 0;
		try {
			con = (HttpURLConnection) new URL(url).openConnection();
			date = con.getLastModified();

			if (date == 0)
				System.out.println("No last-modified information.");
			else
				System.out.println("Last-Modified: " + new Date(date));
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return date;
	}
	
	
	public String downloadDocument(){
		File documentOnLocal=new File(this.root,this.documentName);
		boolean baglanti=new BaglantiKontrolu(this.context).kontrolEt();
		if(documentOnLocal.exists()){
			long lastMofiedDateOnServer=getLastModifiedDate(this.url);
			
			if(lastMofiedDateOnServer<documentOnLocal.lastModified() || !baglanti){
				System.out.println("Document is allready exist! Document is not changed.");
				return this.root+"/"+this.documentName;
			}
		}
		else{
			if(baglanti){
				try {
					System.out.println("Document is downloading!");
					new DefaultHttpClient().execute(new HttpGet(url))
					.getEntity().writeTo(
					        new FileOutputStream(new File(this.root,this.documentName)));
				} catch (ClientProtocolException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				return null;
			}
		}
		
		return this.root+"/"+this.documentName;
	}
	
}
