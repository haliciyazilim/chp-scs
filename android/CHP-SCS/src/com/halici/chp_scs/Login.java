package com.halici.chp_scs;



import org.json.JSONException;
import org.json.JSONObject;

import com.halici.chp_scs.common.BaglantiKontrolu;
import com.halici.chp_scs.common.Crypto;
import com.halici.chp_scs.common.DocumentList;
import com.halici.chp_scs.common.Iletisim;
import com.halici.chp_scs.common.SandikCevresiSorumluBilgileri;
import com.halici.chp_scs.common.SandikSecmenListesi;
import com.halici.chp_scs.common.Sorgulama;
import com.halici.chp_scs.common.Util;


import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Login extends Activity {

	EditText eTuserName;
	EditText eTpassword;
	Button btnSign;
	SharedPreferences shPreferences;
	SharedPreferences.Editor shPrefEditor;
	
	
	
	private boolean loginDurumu;
	private String userName;
	private String password;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.login);
		
		new ExternalFont(this);
		Typeface fontM=ExternalFont.getFontM();
		Typeface fontL=ExternalFont.getFontL();
		Typeface fontT=ExternalFont.getFontT();
		
		eTuserName=(EditText)findViewById(R.id.editUserName);
		eTuserName.setTypeface(fontM);

		eTpassword=(EditText)findViewById(R.id.editPassword);
		eTpassword.setTypeface(fontM);
		
		btnSign=(Button)findViewById(R.id.btnSubmit);
		shPreferences=getSharedPreferences("data", MODE_PRIVATE);
		
		
		
		
		
		
		getSavedData();
		
		
		
		
		btnSign.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				girisYap();
				
			}
		});
		
	}
	
	
	private void saveData(String name, String pass){
		
		shPrefEditor=shPreferences.edit();
		
		
		try{
			String nameToSave=Crypto.encrypt(Util.SH_SEED, name);
			String passwordToSave=Crypto.encrypt(Util.SH_SEED, pass);
			
			shPrefEditor.putString(Util.SH_NAME, nameToSave).commit();
			shPrefEditor.putString(Util.SH_PASSWORD, passwordToSave).commit();
		}
		catch(Exception e){
			System.out.println("Saved Data Decrypt: "+e);
		}
		
	}
	
	private void getSavedData(){
		try{
		
		String savedName= Crypto.decrypt(Util.SH_SEED, shPreferences.getString(Util.SH_NAME, ""));
		String savedPassword=Crypto.decrypt(Util.SH_SEED, shPreferences.getString(Util.SH_PASSWORD, ""));
		
		eTuserName.setText(savedName);
		eTpassword.setText(savedPassword);
		
//		System.out.println("Datas was become: "+savedName+", "+shPreferences.getString(NAME, ""));
		}
		catch(Exception e){
			System.out.println("getSavedData Error "+e);
		}
	}
	
	
	public void girisYap(){
		
		this.userName=eTuserName.getText().toString().trim();
		this.password=eTpassword.getText().toString().trim();
		
		if(this.userName.startsWith("0")){
			this.userName=this.userName.substring(1, this.userName.length());
			System.out.println("userName: "+this.userName);
		}
		
		if(this.userName.length()<10){
			Toast.makeText(getApplicationContext(), "Lütfen 10 haneli telefon numaranızı giriniz.",  Toast.LENGTH_LONG).show();
			return;
		}
		else if(this.password.length()==0){
			Toast.makeText(getApplicationContext(), "Lütfen şifrenizi giriniz.",  Toast.LENGTH_LONG).show();
			return;
		}
		
		boolean baglanti=new BaglantiKontrolu(Login.this).kontrolEt();
		
		if(baglanti==true)
			new Servis().execute(userName,password);
		else if(baglanti==false){
			Toast.makeText(getApplicationContext(), "İnternet bağlantınız ile ilgili bir sorun var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
		}
		
		/*
		try{
			String nameToSave=Crypto.encrypt(SEED, eTuserName.getText().toString().trim());
			String passwordToSave=Crypto.encrypt(SEED, eTpassword.getText().toString().trim());
		
			saveData(nameToSave, passwordToSave);
		}
		catch(Exception e){
			Toast.makeText(getApplicationContext(), "Hata oluştu; lütfen bilgileriniz tekrar giriniz.", Toast.LENGTH_LONG).show();
		}
		*/
	}
	
	public class Servis extends AsyncTask<String, Void, String>{
		private ProgressDialog dialog = new ProgressDialog(Login.this);

		@Override
		protected String doInBackground(String... params) {
			Sorgulama sorgu=new Sorgulama(params[0],params[1]);
			String sonuc=sorgu.sifreGonder();
			
			System.out.println("Sonuclar sonuc: "+sonuc);
			return sonuc;
		}

		@Override
		protected void onPostExecute(String sonuc) {
			dialog.dismiss();
			
			try {
				JSONObject json= new JSONObject(sonuc);
				loginDurumu=json.getBoolean("LoginDurumu");
				
				String sandikCevresiSorumluBilgileri=json.getString(Util.SANDIK_CEVRESI_SORUMLU_KARTI); 
				String sandikSecmenListesi=json.getString(Util.SANDIK_SECMEN_LISTESI); 
				String egitimDokumanlari=json.getString(Util.EGITIM_DOKUMANLARI); 
				String genelgeler=json.getString(Util.GENELGELER); 
				String iletisimString=json.getString(Util.ILETISIM); 
				
				JSONObject sandikBilgiKarti=json.getJSONObject(Util.SANDIK_BILGI_KARTI);
				String sandikBilgiKartiLink=sandikBilgiKarti.getString(Util.SANDIK_BILGI_KARTI_LINK);
				
				
				
				if (loginDurumu){
					saveData(userName, password);
					
					SandikCevresiSorumluBilgileri sorumluBilgileri= new SandikCevresiSorumluBilgileri(sandikCevresiSorumluBilgileri);
					SandikSecmenListesi secmenListesi=new SandikSecmenListesi(sandikSecmenListesi);
					DocumentList egitimDoc=new DocumentList(Util.EGITIM_DOKUMANLARI_TYPE, egitimDokumanlari);
					DocumentList genelgeDoc=new DocumentList(Util.GENELGELER_TYPE, genelgeler);
					Iletisim iletisim=new Iletisim(iletisimString);
					
					
					Intent intent=new Intent(Login.this, MainActivity.class);
					intent.putExtra(Util.SANDIK_CEVRESI_SORUMLU_KARTI, sorumluBilgileri);
					intent.putExtra(Util.SANDIK_SECMEN_LISTESI, secmenListesi);
					intent.putExtra(Util.EGITIM_DOKUMANLARI, egitimDoc);
					intent.putExtra(Util.GENELGELER, genelgeDoc);
					intent.putExtra(Util.ILETISIM, iletisim);
					intent.putExtra(Util.SANDIK_BILGI_KARTI, sandikBilgiKartiLink);
					
					startActivity(intent);
					
				}
				else if(!loginDurumu)
					Toast.makeText(getApplicationContext(), "Girdiğiniz bilgilerde hata var; lütfen kontrol ediniz.",  Toast.LENGTH_LONG).show();
				else
					Toast.makeText(getApplicationContext(), "Sistemde bir hata oluştu lütfen daha sonra tekrar deneyiniz.",  Toast.LENGTH_LONG).show();
				
			} catch (JSONException e) {
				Toast.makeText(getApplicationContext(), "Sistemde bir hata oluştu lütfen daha sonra tekrar deneyiniz.",  Toast.LENGTH_LONG).show();
				e.printStackTrace();
			}
		
		}

		@Override
		protected void onPreExecute() {
			 //dialog=ProgressDialog.show(SecmenKunye.this, "Baslik", "Mesaj-Calculating",true);
			
			dialog.setMessage("Lütfen bekleyiniz; Giriş yapılıyor.");
			dialog.show();
		}

		@Override
		protected void onProgressUpdate(Void... values) {
			
		}
		
		
		
	}

	
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		moveTaskToBack(true);
	}
	
}
