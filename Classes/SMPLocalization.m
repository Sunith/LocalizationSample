//
//  SMPLocalization.m
//  LocalizationSample
//
//  Created by Sunith Muralidharan Pillai on 4/12/14.
//  Copyright (c) 2014 Sunith Muralidharan Pillai. All rights reserved.
//

#import "SMPLocalization.h"

@implementation SMPLocalization
//Singleton instance
static SMPLocalization *_sharedLocalSystem = nil;

//Current application bungle to get the languages.
static NSBundle *bundle = nil;

+ (SMPLocalization *)sharedLocalSystem
{
	@synchronized([SMPLocalization class])
	{
		if (!_sharedLocalSystem){
            
            _sharedLocalSystem=[[self alloc] init];
		}
        
		return _sharedLocalSystem;
	}
	// to avoid compiler warning
	return nil;
}

+(id)alloc
{
	@synchronized([SMPLocalization class])
	{
		NSAssert(_sharedLocalSystem == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedLocalSystem = [super alloc];
		return _sharedLocalSystem;
	}
	// to avoid compiler warning
	return nil;
}


- (id)init
{
    if ((self = [super init]))
    {
		//empty.
		bundle = [NSBundle mainBundle];
	}
    return self;
}

// Gets the current localized string as in AMLocalizedString.
//
// example calls:
// AMLocalizedString(@"Text to localize",@"Alternative text, in case hte other is not find");
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
	return [bundle localizedStringForKey:key value:comment table:nil];
}


// Sets the desired language of the ones you have.
// example calls:
// LocalizationSetLanguage(@"Italian");
// LocalizationSetLanguage(@"German");
// LocalizationSetLanguage(@"Spanish");
//
// If this function is not called it will use the default OS language.
// If the language does not exists y returns the default OS language.
- (void) setLanguage:(NSString*) l{
	NSLog(@"preferredLang: %@", l);
	
	NSString *path = [[ NSBundle mainBundle ] pathForResource:l ofType:@"lproj" ];
	
    
	if (path == nil)
		//in case the language does not exists
		[self resetLocalization];
	else
		//bundle = [[NSBundle bundleWithPath:path] retain];
        bundle = [NSBundle bundleWithPath:path];
}

// Just gets the current setted up language.
// returns "es","fr",...
//
// example call:
// NSString * currentL = LocalizationGetLanguage;
- (NSString*) getLanguage{
    
	NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    
	NSString *preferredLang = [languages objectAtIndex:0];
    
	return preferredLang;
}

// Resets the localization system, so it uses the OS default language.
//
// example call:
// LocalizationReset;
- (void) resetLocalization
{
	bundle = [NSBundle mainBundle];
}


@end
