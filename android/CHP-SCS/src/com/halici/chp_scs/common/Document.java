package com.halici.chp_scs.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;


import org.json.JSONArray;
import org.json.JSONObject;

public class Document  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String HEADER="Baslik";
	public static final String COMMENT="Aciklama";
	public static final String CONTENT="DosyaIcerik";
	
	public static final String DOC_NAME="DosyaAdi";
	public static final String DOC_LINK="DosyaLink";
	
	private String header;
	private String comment;
	private ArrayList<HashMap<String, String>> content;

	public Document(JSONObject json) {
		System.out.println("Dcument: ");
		try{
			this.content=new ArrayList<HashMap<String,String>>();
			this.header=json.getString(HEADER)==null?"":json.getString(HEADER);
			this.comment=json.isNull(COMMENT)==true?"":json.getString(COMMENT);
			System.out.println("Dcument: header: "+this.header+", "+this.comment);
			JSONArray array=json.getJSONArray(CONTENT);
			
			for(int i=0;i<array.length();i++){
				JSONObject obj=array.getJSONObject(i);
				
				String docName=obj.getString(DOC_NAME);
				String donLink=obj.getString(DOC_LINK);
				
				HashMap<String, String> docContent=new HashMap<String, String>();
				docContent.put(DOC_NAME, docName);
				docContent.put(DOC_LINK, donLink);
				
				this.content.add(docContent);
				
			}
			
			System.out.println("Dcument: "+header);
			
		}
		catch(Exception e){
			System.out.println("Document  HATA: "+e.toString());
			e.printStackTrace();
		}
		
		
		
	}

	public String getHeader() {
		return header;
	}

	public String getComment() {
		return comment;
	}

	public ArrayList<HashMap<String, String>> getContent() {
		return content;
	}
	
	
}
