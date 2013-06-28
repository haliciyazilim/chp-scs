package com.halici.chp_scs;

import com.artifex.mupdfdemo.MuPDFActivity;
import com.halici.chp_scs.adapter.ActionsAdapter;
import com.halici.chp_scs.common.SandikCevresiSorumluBilgileri;
import com.halici.chp_scs.common.Util;
import com.halici.chp_scs.fragment.DokumanlarFragment;
import com.halici.chp_scs.fragment.IletisimFragment;
import com.halici.chp_scs.fragment.SandikCevresiSorumluKartiFragment;

import shared.ui.actionscontentview.ActionsContentView;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends FragmentActivity {

  private static final String STATE_URI = "state:uri";
  private static final String STATE_FRAGMENT_TAG = "state:fragment_tag";

  private ActionsContentView viewActionsContentView;

  private Uri currentUri = SandikCevresiSorumluKartiFragment.ABOUT_URI;
  private String currentContentFragmentTag = null;

  SandikCevresiSorumluBilgileri sandikCevresiSorumluBilgileri;
  
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    setContentView(R.layout.main);

    sandikCevresiSorumluBilgileri=(SandikCevresiSorumluBilgileri)getIntent().getSerializableExtra(Util.SANDIK_CEVRESI_SORUMLU_BILGILERI);
    
   
    viewActionsContentView = (ActionsContentView) findViewById(R.id.actionsContentView);
    viewActionsContentView.setSwipingType(ActionsContentView.SWIPING_ALL);


    final ListView viewActionsList = (ListView) findViewById(R.id.actions);
    final ActionsAdapter actionsAdapter = new ActionsAdapter(this);
    viewActionsList.setAdapter(actionsAdapter);
    viewActionsList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
      @Override
      public void onItemClick(AdapterView<?> adapter, View v, int position,
          long flags) {
        final Uri uri = actionsAdapter.getItem(position);

        if (EffectsActivity.URI.equals(uri)) {
          startActivity(new Intent(getBaseContext(), EffectsActivity.class));
          return;
        }
        if(position==1){
        	DokumanlarFragment.docType=Util.EGITIM_DOKUMANLARI;
        }
        else if(position==2){
        	DokumanlarFragment.docType=Util.GENELGELER;
        }
        updateContent(uri);
        viewActionsContentView.showContent();
      }
    });

    
//  Typeface headerTypeFace = Typeface.createFromAsset(getAssets(), "fonts/SWZ721M.TTF");
    TextView header=(TextView) findViewById(R.id.topBarHeader);
    
    
    new ExternalFont(this);
	Typeface fontM=ExternalFont.getFontM();
    header.setTypeface(fontM);
    
    if (savedInstanceState != null) {
      currentUri = Uri.parse(savedInstanceState.getString(STATE_URI));
      currentContentFragmentTag = savedInstanceState.getString(STATE_FRAGMENT_TAG);
    }

    updateContent(currentUri);
  }

  @Override
  public void onBackPressed() {

    super.onBackPressed();
  }

  public void onActionsButtonClick(View view) {
    if (viewActionsContentView.isActionsShown())
      viewActionsContentView.showContent();
    else
      viewActionsContentView.showActions();
  }

  @Override
  protected void onSaveInstanceState(Bundle outState) {
    outState.putString(STATE_URI, currentUri.toString());
    outState.putString(STATE_FRAGMENT_TAG, currentContentFragmentTag);

    super.onSaveInstanceState(outState);
  }

  public void updateContent(Uri uri) {
    final Fragment fragment;
    final String tag;

    final FragmentManager fm = getSupportFragmentManager();
    final FragmentTransaction tr = fm.beginTransaction();

    if (currentContentFragmentTag != null) {
      final Fragment currentFragment = fm.findFragmentByTag(currentContentFragmentTag);
      if (currentFragment != null)
        tr.hide(currentFragment);
    }

    if (SandikCevresiSorumluKartiFragment.ABOUT_URI.equals(uri)) {
      tag = SandikCevresiSorumluKartiFragment.TAG;
      final Fragment foundFragment = fm.findFragmentByTag(tag);
      if (foundFragment != null) {
        fragment = foundFragment;
      } else {
        fragment = new SandikCevresiSorumluKartiFragment();
        Bundle bundle=new Bundle();
        bundle.putSerializable(Util.SANDIK_CEVRESI_SORUMLU_BILGILERI, sandikCevresiSorumluBilgileri);
        fragment.setArguments(bundle);
      }
      
      
    }
    else if (IletisimFragment.ABOUT_URI.equals(uri)) {
        tag = IletisimFragment.TAG;
        final Fragment foundFragment = fm.findFragmentByTag(tag);
        if (foundFragment != null) {
          fragment = foundFragment;
        } else {
          fragment = new IletisimFragment();
        }
      }
    else if (DokumanlarFragment.ABOUT_URI.equals(uri)) {
        tag = DokumanlarFragment.TAG;
        final Fragment foundFragment = fm.findFragmentByTag(tag);
//        if (foundFragment != null) {
//          fragment = foundFragment;
//        } else {
          fragment = new DokumanlarFragment();
//        }
      }
    else {
      return;
    }

    if (fragment.isAdded()) {
      tr.show(fragment);
    } else {
      tr.add(R.id.content, fragment, tag);
    }
    tr.commit();

    currentUri = uri;
    currentContentFragmentTag = tag;
  }
  
  public void showPDF(View view){
		Intent intent=new Intent(this, MuPDFActivity.class);
		intent.putExtra("pdfFile", "/mnt/sdcard/Download/matematik_1.pdf");
		startActivity(intent);
		
	}

 }
