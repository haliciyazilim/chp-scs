package com.halici.chp_scs.common;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

public class DocumentList {

	private static final String GENELGE_LIST="GenelgeList";
	
	private int docType;
	private ArrayList<Document> documents;
	
	public DocumentList(int docType, String json) {
	
		this.docType=docType;
		this.documents=new ArrayList<Document>();
		try{
			
			JSONObject jsonObject=new JSONObject(json);
			JSONArray jsonArray=jsonObject.getJSONArray(GENELGE_LIST);
			for(int i=0; i<jsonArray.length();i++){
				JSONObject obj=jsonArray.getJSONObject(i);
				Document doc=new Document(obj);
				documents.add(doc);
			}
			
			
		}
		catch(Exception e){
			
		}
		
		
	}

	public int getDocType() {
		return docType;
	}


	public ArrayList<Document> getDocuments() {
		return documents;
	}

	
	
}
