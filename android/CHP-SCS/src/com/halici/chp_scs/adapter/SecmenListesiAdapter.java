package com.halici.chp_scs.adapter;


import java.util.ArrayList;
import java.util.HashMap;

import com.halici.chp_scs.R;
import com.halici.chp_scs.common.Document;
import com.halici.chp_scs.common.DocumentList;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Util;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class SecmenListesiAdapter extends BaseAdapter {
	
	private ArrayList<Boolean> isEnabled;
	
	private ArrayList<HashMap<String, Object>> list;
	
	private LayoutInflater mInflater;
	
	public SecmenListesiAdapter(Context context, SandikSecmenListesi secmenListesi) {
        this.list=secmenListesi.getSecmenler();
        
        
        mInflater= (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        
        this.isEnabled=new ArrayList<Boolean>();
    }

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return this.list.size();
	}

	@Override
	public HashMap<String, Object> getItem(int position) {
		return this.list.get(position);
	}

	@Override
	public long getItemId(int arg0) {
		
		return arg0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		System.out.println("SecmenListesi Adapter getView is runned");
        View view = convertView;

        Object item = getItem(position);

        if (item!= null) {
        	view = this.mInflater.inflate(R.layout.secmen_listesi_list_item, parent, false);
            TextView itemView = (TextView) view.findViewById(R.id.secmenListesiName);
            TextView numberView = (TextView) view.findViewById(R.id.secmenListesiNumber);
            System.out.println("İtem is PDF");
            	
            String name=(String) getItem(position).get(Util.AdSoyad);
            int number=(Integer) getItem(position).get(Util.SiraNo);
            
            itemView.setText(name);
            numberView.setText(String.valueOf(number));
            
            isEnabled.add(true);
    	}

        return view;
    }
	
	@Override
	public boolean isEnabled(int position) {
		return isEnabled.get(position);
	}
	
}
