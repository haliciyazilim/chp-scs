package com.halici.chp_scs;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class Splash extends Activity{

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.splash);
		
	    new Thread() {
            public void run() {
                try{
                   
                    sleep(1500);
                } catch (Exception e) {
                }
              
                new Thread() {
                    public void run() {
                   
                   Intent sorguyaGec=new Intent(Splash.this, Login.class);
                   startActivity(sorguyaGec);
                   
                    }
                }.start();
            }
        }.start();  
	    
	   
	}

}
