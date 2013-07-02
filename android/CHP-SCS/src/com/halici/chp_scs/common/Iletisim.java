package com.halici.chp_scs.common;

import org.json.JSONException;
import org.json.JSONObject;

public class Iletisim {

	private static final String SandikNo="SandikNo";
	private static final String IlceBaskani="IlceBaskani";
	private static final String IlceBaskaniTel="IlceBaskaniTelefonu";
	private static final String IlceBaskanligiTel="IlceBaskanligiTelefonu";
	private static final String IlceBilisimSorumlusu="IlceBilisimSorumlusu";
	private static final String IlceBilisimSorumlusuTel="IlceBilisimSorumlusuTelefonu";
	private static final String BitemEPosta="CHPBitemEposta";
	private static final String BitemTel="CHPBitemTelefon";
	
	private String sandikNo, ilceBaskani, ilceBaskaniTel, ilceBaskanligiTel, 
	ilceBilisimSorumlusu, ilceBilisimSorumlusuTel, bitemEPosta, bitemTel; 
	
	
	public Iletisim(String json) {
		
		try {
			JSONObject jsonObject=new JSONObject(json);
			this.sandikNo=jsonObject.getString(SandikNo);
			this.ilceBaskani=jsonObject.getString(IlceBaskani);
			this.ilceBaskaniTel=jsonObject.getString(IlceBaskaniTel);
			this.ilceBaskanligiTel=jsonObject.getString(IlceBaskanligiTel);
			this.ilceBilisimSorumlusu=jsonObject.getString(IlceBilisimSorumlusu);
			this.ilceBilisimSorumlusuTel=jsonObject.getString(IlceBilisimSorumlusuTel);
			this.bitemEPosta=jsonObject.getString(BitemEPosta);
			this.bitemTel=jsonObject.getString(BitemTel);
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public String getSandikNo() {
		return sandikNo;
	}


	public String getIlceBaskani() {
		return ilceBaskani;
	}


	public String getIlceBaskaniTel() {
		return ilceBaskaniTel;
	}


	public String getIlceBaskanligiTel() {
		return ilceBaskanligiTel;
	}


	public String getIlceBilisimSorumlusu() {
		return ilceBilisimSorumlusu;
	}


	public String getIlceBilisimSorumlusuTel() {
		return ilceBilisimSorumlusuTel;
	}


	public String getBitemEPosta() {
		return bitemEPosta;
	}


	public String getBitemTel() {
		return bitemTel;
	}
	
	
}
