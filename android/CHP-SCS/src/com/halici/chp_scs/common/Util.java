package com.halici.chp_scs.common;

public class Util {

	public static final String PDF_TITLE="pdfTitle";
	
	public static final String TITLE_SANDIK_CEVRESI_SORUMLU_KARTI="SÇS Kartı";
	public static final String TITLE_EGITIM_DOKUMANLARI="Eğitim Dokümanları";
	public static final String TITLE_GENELGELER="Genelgeler";
	public static final String TITLE_ILETISIM="İletişim";
	public static final String TITLE_SANDIK_SECMEN_LISTESI="Sandık Seçmen Listesi";
	public static final String TITLE_SANDIK_BILGI_KARTI="Sandık Bilgi Kartı";
	
	public static final String SANDIK_CEVRESI_SORUMLU_KARTI="SandikCevresiSorumlusuKarti";
	public static final String EGITIM_DOKUMANLARI="EgitimDokumanlari";
	public static final String GENELGELER="Genelgeler";
	public static final String ILETISIM="Iletisim";
	public static final String SANDIK_SECMEN_LISTESI="SandikSecmenListesi";
	public static final String SANDIK_BILGI_KARTI="SandikBilgiKarti";
	public static final String SANDIK_BILGI_KARTI_LINK="sandikkartilink";
	
	public static final int EGITIM_DOKUMANLARI_TYPE=1;
	public static final int GENELGELER_TYPE=2;
	
	public static final String TCKN="TCKN";
	public static final String AdSoyad="AdSoyad";
	public static final String SandikNo="SandikNo";
	public static final String SandikIli="SandikIli";
	public static final String SandikIlcesi="SandikIlcesi";
	public static final String MahalleMuhtarligi="MahalleMuhtarligi";
	public static final String SandikAlani="SandikAlani";
	public static final String DigerGorevliAdi="DigerGorevliAdi";
	public static final String DigerGorevliTelefonu="DigerGorevliTelefonu";
	public static final String GorevliFotoUrl="GorevliFotoUrl"; 
	
	
	
	
	// SharedPreferences
	
	public static final String SH_NAME="name";
	public static final String SH_PASSWORD="password";
	public static final String SH_SEED="secure";
	
	// Sandik SecmenListesi
	public static final String SiraNo="SiraNo";
	
	
	public static String convertPhoneNumber(String number){
		String convertedNumber;
		
		convertedNumber=number.replaceAll("[(]", "");
		convertedNumber=convertedNumber.replaceAll("[)]", "");
		convertedNumber=convertedNumber.replaceAll("[ ]", "");
		return convertedNumber;
	}

}
