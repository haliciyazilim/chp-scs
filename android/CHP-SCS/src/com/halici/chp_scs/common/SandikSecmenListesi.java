package com.halici.chp_scs.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;

public class SandikSecmenListesi implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String IlAdi="IlAdi";
	private static final String IlceAdi="IlceAdi";
	private static final String Mahalle="Mahalle";
	private static final String SandikAlani="SandikAlani";
	private static final String SandikNo="SandikNo";
	private static final String KayitSayisi="KayitSayisi";
	private static final String Secmenler="Secmenler";

	
	
	private String il, ilce, mahalle, sandikAlani;
	private int sandikNo, kayitSayisi;
	
	private ArrayList<HashMap<String, Object>> secmenler; 
	
	
	public SandikSecmenListesi(String jsonString){
		secmenler=new ArrayList<HashMap<String,Object>>();
		try{
			JSONObject jsonObject=new JSONObject(jsonString);
			this.il=jsonObject.getString(IlAdi);
			this.ilce=jsonObject.getString(IlceAdi);
			this.mahalle=jsonObject.getString(Mahalle);
			this.sandikAlani=jsonObject.getString(SandikAlani);
			this.sandikNo=jsonObject.getInt(SandikNo);
			this.kayitSayisi=jsonObject.getInt(KayitSayisi);
			
			JSONArray jsonArray=jsonObject.getJSONArray(Secmenler);
			
			for(int i=0; i<jsonArray.length();i++){
				JSONObject obj=jsonArray.getJSONObject(i);
				String isim=obj.getString(Util.AdSoyad);
				int siraNo=obj.getInt(Util.SiraNo);
				
				HashMap<String,Object> listItem=new HashMap<String, Object>();
				listItem.put(Util.AdSoyad, isim);
				listItem.put(Util.SiraNo, siraNo);
				secmenler.add(listItem);
			}
		}
		catch(Exception e){
			
		}
	}


	
	public String getIl() {
		return il;
	}


	public String getIlce() {
		return ilce;
	}


	public String getMahalle() {
		return mahalle;
	}


	public String getSandikAlani() {
		return sandikAlani;
	}


	public int getSandikNo() {
		return sandikNo;
	}


	public int getKayitSayisi() {
		return kayitSayisi;
	}


	public ArrayList<HashMap<String, Object>> getSecmenler() {
		return secmenler;
	}


	
	

	
	
	
}
