package com.halici.chp_scs;

import java.util.HashMap;

public class PDFObject {

	private String title;
	private String subTitle;
	private HashMap<String, String> pdfList;
	
	public PDFObject(String title, String subTitle,HashMap<String, String> pdfList  ) {
		this.title=title;
		this.subTitle=subTitle;
		this.pdfList=pdfList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public HashMap<String, String> getPdfList() {
		return pdfList;
	}

	public void setPdfList(HashMap<String, String> pdfList) {
		this.pdfList = pdfList;
	}
	
	
}
