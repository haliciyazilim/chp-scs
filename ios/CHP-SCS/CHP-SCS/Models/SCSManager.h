//
//  SCSManager.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 28.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

// card dictionary macros
#define CARD_TCK_NO                      @"TCKN"
#define CARD_NAME_SURNAME                @"AdSoyad"
#define CARD_CHEST_NO                    @"SandikNo"
#define CARD_CHEST_PROVINCE              @"SandikIli"
#define CARD_CHEST_DISTRICT              @"SandikIlcesi"
#define CARD_NEIGHBORHOOD                @"MahalleMuhtarligi"
#define CARD_CHEST_AREA                  @"SandikAlani"
#define CARD_OTHER_MANAGER_NAME_SURNAME  @"DigerGorevliAdi"
#define CARD_OTHER_MANAGER_PHONE         @"DigerGorevliTelefonu"
#define CARD_PHOTO_URL                   @"GorevliFotoUrl"

// documents dictionary macros
#define DOCUMENTS_DOCUMENT_TITLE          @"Baslik"
#define DOCUMENTS_DOCUMENT_DESCRIPTION    @"Aciklama"
#define DOCUMENTS_DOCUMENT_FILES          @"DosyaIcerik"
#define DOCUMENTS_FILE_NAME               @"DosyaAdi"
#define DOCUMENTS_FILE_URL                @"DosyaLink"
//Document type
#define DOCUMENTS_TYPE_EGITIM               1
#define DOCUMENTS_TYPE_GENELGE              2

// communication dictionary macros
#define COMMUNICATION_INFOS_CHP_BITEM_EMAIL                             @"CHPBitemEposta"
#define COMMUNICATION_INFOS_CHP_BITEM_PHONE                             @"CHPBitemTelefon"
#define COMMUNICATION_INFOS_DISTRICT_MANAGER_NAME_SURNAME               @"IlceBaskani"
#define COMMUNICATION_INFOS_DISTRICT_MANAGER_PHONE                      @"IlceBaskaniTelefonu"
#define COMMUNICATION_INFOS_DISTRICT_HEADSHIP_PHONE                     @"IlceBaskanligiTelefonu"
#define COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_NAME_SURNAME   @"IlceBilisimSorumlusu"
#define COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_PHONE          @"IlceBilisimSorumlusuTelefonu"
#define COMMUNICATION_INFOS_CHEST_NO                                    @"SandikNo"

// voter list macros
#define VOTER_LIST_PROVINCE @"IlAdi"
#define VOTER_LIST_DISTRICT @"IlceAdi"
#define VOTER_LIST_RECORD_COUNT @"KayitSayisi"
#define VOTER_LIST_NEIGHBORHOOD @"Mahalle"
#define VOTER_LIST_CHEST_AREA @"SandikAlani"
#define VOTER_LIST_CHEST_NUMBER @"SandikNo"
#define VOTER_LIST_VOTERS @"Secmenler"
#define VOTER_LIST_VOTER_NAME @"AdSoyad"
#define VOTER_LIST_VOTER_NUMBER @"SiraNo"

// sub dictionaries macros
#define CARD_DICTIONARY @"SandikCevresiSorumlusuKarti"
#define EGITIM_DOCUMENTS_DICTIONARY @"EgitimDokumanlari"
#define GENELGE_DOCUMENTS_DICTIONARY @"Genelgeler"
#define DOCUMENTS_LIST @"GenelgeList"
#define COMMUNICATION_DICTIONARY @"Iletisim"
#define VOTER_LIST_DICTIONARY @"SandikSecmenListesi"

#import "APIManager.h"

@interface SCSManager : NSObject

@property NSString* tckNo;
@property NSString* nameSurname;
@property NSString* chestNo;
@property NSString* chestProvince;
@property NSString* chestDistrict;
@property NSString* neighborhood;
@property NSString* chestArea;
@property NSString* otherManagerNameSurname;
@property NSString* otherManagerPhone;
@property NSString* photoUrl;

@property NSMutableArray* egitimDocuments;
@property NSMutableArray* genelgeDocuments;
@property NSMutableDictionary* communicationInfos;
@property NSMutableDictionary* voterList;

+ (SCSManager*) SCSManagerWithDictionary:(NSDictionary*)dictionary;

+ (SCSManager*) currentManager;

- (id) initWithDictionary:(NSDictionary*)dictionary;

@end
