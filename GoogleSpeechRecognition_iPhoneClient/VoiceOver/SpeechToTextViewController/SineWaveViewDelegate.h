//
//  SineWaveViewDelegate.h
//  VoiceOver
//
//  Created by Wang Jue on 12/25/12.
//  Copyright (c) 2012 FREELEONS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SineWaveViewDelegate <NSObject>

- (void)sineWaveDoneAction;
- (void)sineWaveCancelAction;

//Tell delegate to stop recording
-(void)stopRecording;

@end