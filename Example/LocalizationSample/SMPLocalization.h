//
//  SMPLocalization.h
//  LocalizationSample
//
//  Created by Sunith Muralidharan Pillai on 4/12/14.
//  Copyright (c) 2014 Sunith Muralidharan Pillai. All rights reserved.
//

#import <Foundation/Foundation.h>

#define AMLocalizedString(key, comment) \
[[SMPLocalization sharedLocalSystem] localizedStringForKey:(key) value:(comment)]

#define LocalizationSetLanguage(language) \
[[SMPLocalization sharedLocalSystem] setLanguage:(language)]

#define LocalizationGetLanguage \
[[SMPLocalization sharedLocalSystem] getLanguage]



#define LocalizationReset \
[[SMPLocalization sharedLocalSystem] resetLocalization]

@interface SMPLocalization : NSObject
{
	NSString *language;
}

// you really shouldn't care about this functions and use the MACROS
+ (SMPLocalization *)sharedLocalSystem;

//gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

//sets the language
- (void) setLanguage:(NSString*) language;

//gets the current language
- (NSString*) getLanguage;

//resets this system.
- (void) resetLocalization;

@end
