package com.halici.chp_scs.adapter;


import java.util.ArrayList;
import java.util.HashMap;

import com.halici.chp_scs.R;
import com.halici.chp_scs.common.Document;
import com.halici.chp_scs.common.DocumentList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class PDFListAdapter extends BaseAdapter {
	
	private ArrayList<Boolean> isEnabled;
	
	private ArrayList<Document> list;
	private ArrayList<Object> wholeList;
	
	private LayoutInflater mInflater;
	
	public PDFListAdapter(Context context, DocumentList documentsList) {
        this.list=documentsList.getDocuments();
        this.wholeList = new ArrayList<Object>();
        
        mInflater= (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        
        this.isEnabled=new ArrayList<Boolean>();
        
        for(int i=0; i<list.size();i++){
        	Document doc=list.get(i);
        	wholeList.add(doc);
        	
        	if(doc.getContent().size()>0){
        		ArrayList<HashMap<String, String>> content=doc.getContent();
        		for(int j=0; j<content.size();j++){
        			wholeList.add(content.get(j));
        		}
        		
        	}	

        }  
    }

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return this.wholeList.size();
	}

	@Override
	public Object getItem(int position) {
		return this.wholeList.get(position);
	}

	@Override
	public long getItemId(int arg0) {
		
		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		System.out.println("PDFLİstadapter getView is runned");
        View view = convertView;

        Object item = getItem(position);

        if (item!= null) {

            if(item instanceof Document){
            	view = this.mInflater.inflate(R.layout.pdf_list_category_item, parent, false);
            	System.out.println("İtem is DOC");
            	
            	TextView categoryView = (TextView) view.findViewById(R.id.pdfCategoryItem);
         		TextView subTitleView=(TextView) view.findViewById(R.id.pdfCategorySubtitle);
            	
            	categoryView.setText(((Document)item).getHeader());
            	subTitleView.setText(((Document)item).getComment());
            	
            	isEnabled.add(false);
            }
            else{
            	view = this.mInflater.inflate(R.layout.pdf_list_pdf_item, parent, false);
            	TextView itemView = (TextView) view.findViewById(R.id.pdfItem);
            	System.out.println("İtem is PDF");
            	
            	String pdfName=((HashMap<String, String>)item).get(Document.DOC_NAME);
            	String pdfURL=((HashMap<String, String>)item).get(Document.DOC_LINK);
            	
            	System.out.println("İtem is PDF: "+pdfName+", "+pdfURL);
            	
            	itemView.setText(pdfName);
            	itemView.setTag(pdfURL);
            	
            	isEnabled.add(true);
            	
            }        	
        }

        return view;
    }
	
	@Override
	public boolean isEnabled(int position) {
		return isEnabled.get(position);
	}
	
}
