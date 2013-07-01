package com.halici.chp_scs.common;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

import android.util.Log;

public class Sorgulama {
	String telNo;
	String sifre;

	int docType;
	
	public Sorgulama(String telNo_TCKN, String sifre) {
		this.telNo=telNo_TCKN;
		this.sifre=sifre;
	}

	public Sorgulama(int docType) {
		this.docType=docType;
	}
	
	
	// webServisin yeri
	final static String NAMESPACE="http://tempuri.org/";
			 
	// kullanılan metot
	final static String METHOD_NAME_LOGIN="SCS_Login";
	final static String METHOD_NAME_DOC_GETIR="SCS_GenelgeEgitimDocGetir";
			 
	// soap_action
	final static String SOAP_ACTION_LOGIN="http://tempuri.org/SCS_login";
	final static String SOAP_ACTION_DOC_GETIR="http://tempuri.org/SCS_GenelgeEgitimDocGetir";
			 
	// webservise ait url tanimlaması
	final static String URL = "http://bilisim.chp.org.tr/MobilService.asmx";
	
	
	public String sifreGonder(){
		String sonuc = null;
		// soap nesnesi
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME_LOGIN);
					
		// requeste bilgi ekleniyor.
		request.addProperty("telNo", this.telNo);
		request.addProperty("Sifre",this.sifre);
					
		//Web servisin versiyonunu bildiriyoruz.
		SoapSerializationEnvelope soapEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER12);
					
		//don.net ile hazırlandığı için
		soapEnvelope.dotNet = true;
					
		//requesti zarfa koyuoyoruz.
		soapEnvelope.setOutputSoapObject(request);
					
		//transfer değeri oluşturuyoruz
		HttpTransportSE aht = new HttpTransportSE(URL);
		aht.debug=true;
					
		try {
			System.out.println("try içindeiym.");
			
			// Ve son olarak isteğimizi gönderiyoruz.
			aht.call(SOAP_ACTION_LOGIN, soapEnvelope);
			aht.setXmlVersionTag("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			aht.debug=true;
					
			System.out.println("try sonu");
		} 
		catch (Exception e) {
			Log.i("hata",e.toString());
				e.printStackTrace();
		} 
		
		try {
			// Cevap olarak basit bir veri tipi beklediğimiz için,
			// cevabı SoapPrimitive nesnesi olarak alıyoruz.
			SoapPrimitive sonucSoap = (SoapPrimitive) soapEnvelope.getResponse();
			sonuc=sonucSoap.toString();
					
				
			System.out.println("Gelen Veri: ");
			System.out.println(sonuc);
		} 
		catch (Exception e) {
			System.out.println("Hata: "+e.toString());
			e.printStackTrace();
		}
		
		return sonuc;
	}
	
	public String docGetir(){
		String sonuc = null;
		// soap nesnesi
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME_DOC_GETIR);
		
		// requeste bilgi ekleniyor.
		request.addProperty("DocType", this.docType);
		
		//Web servisin versiyonunu bildiriyoruz.
		SoapSerializationEnvelope soapEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER12);
					
		//don.net ile hazırlandığı için
		soapEnvelope.dotNet = true;
					
		//requesti zarfa koyuoyoruz.
		soapEnvelope.setOutputSoapObject(request);
					
		//transfer değeri oluşturuyoruz
		HttpTransportSE aht = new HttpTransportSE(URL);
		aht.debug=true;
					
		try {
			// Ve son olarak isteğimizi gönderiyoruz.
			aht.call(SOAP_ACTION_DOC_GETIR, soapEnvelope);
			aht.setXmlVersionTag("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			aht.debug=true;
		
		} 
		catch (Exception e) {
			Log.i("hata",e.toString());
				e.printStackTrace();
		} 
		
		try {
			// Cevap olarak basit bir veri tipi beklediğimiz için,
			// cevabı SoapPrimitive nesnesi olarak alıyoruz.
			SoapPrimitive sonucSoap = (SoapPrimitive) soapEnvelope.getResponse();
			sonuc=sonucSoap.toString();
					
				
			System.out.println("Gelen Veri: ");
			System.out.println(sonuc);
		} 
		catch (Exception e) {
			System.out.println("Hata: "+e.toString());
			e.printStackTrace();
		}
		
		return sonuc;
	}

}
