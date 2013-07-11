package com.halici.chp_scs.common;

import android.content.Context;
import android.net.ConnectivityManager;

public class BaglantiKontrolu{
	
	Context context;
	
	public BaglantiKontrolu(Context context) {
		this.context=context;
	}
	
	public boolean kontrolEt() {
        final ConnectivityManager conMgr = (ConnectivityManager) this.context.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
        if (conMgr.getActiveNetworkInfo() != null && conMgr.getActiveNetworkInfo().isAvailable() &&    conMgr.getActiveNetworkInfo().isConnected()) {
        	System.out.println("İnternet Bağlantısı var");
        	return true;
        } else {
              System.out.println("İnternet Bağlantısı yok");
            return false;
        }
     }
	
}
