//
//  SpeechToTextModuleDelegate.h
//  VoiceOver
//
//  Created by Wang Jue on 12/25/12.
//  Copyright (c) 2012 FREELEONS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SineWaveViewController;

@protocol SpeechToTextModuleDelegate <NSObject>

// Delegate will need to parse JSON and dismiss loading view if presented
// returns true on success, false on failure
- (BOOL)didReceiveVoiceResponse:(NSData *)data;

@optional
- (void)showSineWaveView:(SineWaveViewController *)view;
- (void)dismissSineWaveView:(SineWaveViewController *)view cancelled:(BOOL)wasCancelled;
- (void)showLoadingView;

//After the Done button taped, notify the delegate to stop recording
-(void)stopRecording;

@end
