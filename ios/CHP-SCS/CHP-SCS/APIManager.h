//
//  APIManager.h
//  e-Sandik
//
//  Created by Eren Halici on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
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
#define DOCUMENTS_DOCUMENT_CONTENT        @"DosyaIcerik"
#define DOCUMENTS_FILE_NAME               @"DosyaAdi"
#define DOCUMENTS_FILE_URL                @"DosyaLink"

// communication dictionary macros
#define COMMUNICATION_INFOS_CHP_BITEM_EMAIL                             @"CHPBitemEposta"
#define COMMUNICATION_INFOS_CHP_BITEM_PHONE                             @"CHPBitemTelefon"
#define COMMUNICATION_INFOS_DISTRICT_MANAGER_NAME_SURNAME               @"IlceBaskani"
#define COMMUNICATION_INFOS_DISTRICT_MANAGER_PHONE                      @"IlceBaskaniTelefonu"
#define COMMUNICATION_INFOS_DISTRICT_HEADSHIP_PHONE                     @"IlceBaskanligiTelefonu"
#define COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_NAME_SURNAME   @"IlceBilisimSorumlusu"
#define COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_PHONE          @"IlceBilisimSorumlusuTelefonu"
#define COMMUNICATION_INFOS_CHEST_NO                                    @"SandikNo"

#import <Foundation/Foundation.h>

#import "MKNetworkKit/MKNetworkEngine.h"

@class SCSManager;

typedef void (^CompletionBlock) (NSDictionary *responseDictionary);
typedef void (^ErrorBlock) (NSError *error);
typedef void (^SCSCardBlock) (SCSManager* manager);
typedef void (^ImageBlock) (UIImage *resultImage);
typedef void (^DocumentsCompletionBlock) (NSArray *responseArray);

//typedef void (^SCSCardBlock) (NSDictionary* card);

@interface APIManager : MKNetworkEngine

+ (APIManager *)sharedInstance;

- (MKNetworkOperation *)loginWithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(SCSCardBlock)cardBlock
                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)loginV2WithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(CompletionBlock)completionBlock
                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getImageWithURLString:(NSString *)urlString
                                 onCompletion:(ImageBlock)completionBlock
                                      onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getCommunicationInfosWithUsername:(NSString *)username
                                              andPassword:(NSString *)password
                                             onCompletion:(CompletionBlock)completionBlock
                                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getDocumentsWithDocumentType:(int)docType
                                  andCompletionBlock:(DocumentsCompletionBlock)completionBlock
                                             onError:(ErrorBlock)errorBlock;


@end
