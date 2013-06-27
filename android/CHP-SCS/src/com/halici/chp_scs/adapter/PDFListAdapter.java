package com.halici.chp_scs.adapter;


import java.util.ArrayList;
import java.util.HashMap;

import com.halici.chp_scs.PDFObject;
import com.halici.chp_scs.R;

import android.R.bool;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class PDFListAdapter extends BaseAdapter {
	
	private ArrayList<String> keys;
	private ArrayList<Boolean> isEnabled;
	
	private ArrayList<HashMap<String, String>> list;
//	private HashMap<String, ArrayList<HashMap<String, String>>> wholeList;
	private ArrayList<PDFObject> wholeList;
	
	// baslik,Arraylist<pdf başlık,link>
	
	private LayoutInflater mInflater;
	private Context context;
	
	public PDFListAdapter(Context context, ArrayList<PDFObject> wholeList) {
        this.context = context;
        this.wholeList = wholeList;
        mInflater= (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        list=new ArrayList<HashMap<String,String>>();
        keys=new ArrayList<String>();
        
        this.isEnabled=new ArrayList<Boolean>();
        
        for(int i=0;i<this.wholeList.size();i++){
        	
        	HashMap<String, String> item=new HashMap<String, String>();
        	String key=this.wholeList.get(i).getTitle();
        	String value=this.wholeList.get(i).getSubTitle();
        	System.out.println("PDFListAdapter: Key: "+key+", Value: "+value);
        	item.put(key, value);
        	list.add(item);
        	keys.add(key);
        	
        	HashMap<String, String> pdfList=this.wholeList.get(i).getPdfList();
        	String[] keyList=pdfList.keySet().toArray(new String[pdfList.size()]);
        	for(int j=0; j<keyList.length;j++){
        		HashMap<String, String> pdfItem=new HashMap<String, String>();
            	String pdfKey=keyList[j];
            	String pdfValue=pdfList.get(keyList[j]);
            	pdfItem.put(pdfKey, pdfValue);
            	keys.add(pdfKey);
            	System.out.println("PDFListAdapter: Key: "+pdfKey+", Value: "+pdfValue);
            	list.add(pdfItem);
        	}
        	
        }
//        for(int i=0;i<list.size();i++){
//        	keys.add(list.get(i).keySet().toString());
//        	System.out.println("FOR: KEYS: "+list.get(i).keySet()[0]);
//        	 System.out.println("Keys 0: "+keys.get(0));
//    	}
        
        /*
        for(String key:wholeList.keySet()){
        	HashMap<String, String> category=new HashMap<String, String>();
        	category.put(key, null);
        	list.add(category);
        
        	for(int i=0; i<this.wholeList.get(category).size();i++){
        		list.add(wholeList.get(category).get(i));
        	}
        }
        
        keys=new String[list.size()];
        for(int i=0; i<list.size();i++){
        	keys[i]=list.get(i).keySet().toString();
        }
     */   
        
    }
	
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return keys.size();
	}

	@Override
	public HashMap<String, String> getItem(int position) {
		return this.list.get(position);
	}

	@Override
	public long getItemId(int arg0) {
		
		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		System.out.println("PDFLİstadapter getView is runned");
        View view = convertView;
        if(view==null){	
            
        
            view = this.mInflater.inflate(R.layout.pdf_list_category_item, parent, false);
        }

        HashMap<String, String> item = getItem(position);
        
        if (item!= null) {
            System.out.println("PDFLİstAdapter item: "+item.toString());
            System.out.println("PDFLİstAdapter key: "+this.keys.get(position)+", position: "+position);
            if(this.keys.get(position) instanceof String)
            	System.out.println("key is string");
            else
            	System.out.println("key is not string");
            
            System.out.println("PDFLİstAdapter item value: "+item.get(this.keys.get(position).toString())+" POsitipon: "+position);
            System.out.println("PDFListAdapter manuel: "+item.get("Title"));
        	
            if( item.get(this.keys.get(position))!=null && 
            		(!item.get(this.keys.get(position)).startsWith("http://") && 
            		!item.get(this.keys.get(position)).startsWith("ftp://"))){
            	view = this.mInflater.inflate(R.layout.pdf_list_category_item, parent, false);
            	isEnabled.add(false);
        		System.out.println("item http: false");
        		TextView categoryView = (TextView) view.findViewById(R.id.pdfCategoryItem);
        		TextView subTitleView=(TextView) view.findViewById(R.id.pdfCategorySubtitle);
        		System.out.println("this.keys.get(position): "+this.keys.get(position)+": positpm"+position);
	            categoryView.setText(this.keys.get(position));
	            if(!this.list.get(position).get(keys.get(position)).isEmpty())
	            	subTitleView.setText(this.list.get(position).get(keys.get(position)));
	            
        	}
        	else if(item.get(this.keys.get(position))!=null && 
        			(item.get(this.keys.get(position)).startsWith("http://") || 
        			item.get(this.keys.get(position)).startsWith("ftp://"))){
        		view = this.mInflater.inflate(R.layout.pdf_list_pdf_item, parent, false);
        		isEnabled.add(true);
        		System.out.println("item http: true");
        		TextView itemView = (TextView) view.findViewById(R.id.pdfItem);
	            itemView.setText(this.keys.get(position));
	            itemView.setTag(this.list.get(position).get(keys.get(position)));
        	}
        	else
        		System.out.println("item http: esle");
         }
        else{
        	
        }

        return view;
    }
	
	@Override
	public boolean isEnabled(int position) {
		return isEnabled.get(position);
	}
	
}
