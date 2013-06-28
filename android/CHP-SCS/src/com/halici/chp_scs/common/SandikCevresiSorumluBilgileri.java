package com.halici.chp_scs.common;

import java.io.Serializable;

import com.halici.chp_scs.common.Util;
import org.json.JSONObject;

public class SandikCevresiSorumluBilgileri implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long tckn;
	private String adSoyad;
	private String sandikNo;
	private String sandikIli;
	private String sandikIlcesi;
	private String mahalleMuhtarligi;
	private String sandikAlani;
	private String digerGorevliAdi;
	private String digerGoervliTel;
	private String gorecliFotoUrl;
	
	public SandikCevresiSorumluBilgileri(String json) {
		try {
			JSONObject jsonObject=new JSONObject(json);
			this.tckn=jsonObject.getLong(Util.TCKN);
			this.adSoyad=jsonObject.getString(Util.AdSoyad);
			this.sandikNo=jsonObject.getString(Util.SandikNo);
			this.sandikIli=jsonObject.getString(Util.SandikIli);
			this.sandikIlcesi=jsonObject.getString(Util.SandikIlcesi);
			this.sandikAlani=jsonObject.getString(Util.SandikAlani);
			this.mahalleMuhtarligi=jsonObject.getString(Util.MahalleMuhtarligi);
			this.digerGorevliAdi=jsonObject.getString(Util.DigerGorevliAdi);
			this.digerGoervliTel=jsonObject.getString(Util.DigerGorevliTelefonu);
			
		} catch (Exception e) {
			System.out.println("SandikCevresiSorumluBilgileri: "+e.toString());
		}
		
	}

	public long getTckn() {
		return tckn;
	}

	public void setTckn(long tckn) {
		this.tckn = tckn;
	}

	public String getAdSoyad() {
		return adSoyad;
	}

	public void setAdSoyad(String adSoyad) {
		this.adSoyad = adSoyad;
	}

	public String getSandikNo() {
		return sandikNo;
	}

	public void setSandikNo(String sandikNo) {
		this.sandikNo = sandikNo;
	}

	public String getSandikIli() {
		return sandikIli;
	}

	public void setSandikIli(String sandikIli) {
		this.sandikIli = sandikIli;
	}

	public String getSandikIlcesi() {
		return sandikIlcesi;
	}

	public void setSandikIlcesi(String sandikIlcesi) {
		this.sandikIlcesi = sandikIlcesi;
	}

	public String getMahalleMuhtarligi() {
		return mahalleMuhtarligi;
	}

	public void setMahalleMuhtarligi(String mahalleMuhtarligi) {
		this.mahalleMuhtarligi = mahalleMuhtarligi;
	}

	public String getSandikAlani() {
		return sandikAlani;
	}

	public void setSandikAlani(String sandikAlani) {
		this.sandikAlani = sandikAlani;
	}

	public String getDigerGorevliAdi() {
		return digerGorevliAdi;
	}

	public void setDigerGorevliAdi(String digerGorevliAdi) {
		this.digerGorevliAdi = digerGorevliAdi;
	}

	public String getDigerGoervliTel() {
		return digerGoervliTel;
	}

	public void setDigerGoervliTel(String digerGoervliTel) {
		this.digerGoervliTel = digerGoervliTel;
	}

	public String getGorecliFotoUrl() {
		return gorecliFotoUrl;
	}

	public void setGorecliFotoUrl(String gorecliFotoUrl) {
		this.gorecliFotoUrl = gorecliFotoUrl;
	}
	
}
