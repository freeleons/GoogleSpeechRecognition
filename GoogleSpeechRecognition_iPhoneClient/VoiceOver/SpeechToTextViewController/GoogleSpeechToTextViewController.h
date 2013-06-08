//
//  GoogleSpeechToTextViewController.h
//  VoiceOver
//
//  Created by Wang Jue on 12/25/12.
//  Copyright (c) 2012 FREELEONS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeechToTextModuleDelegate.h"
#import "CJSONDeserializer.h"

//SpeechToTextModuleDelegate
@interface GoogleSpeechToTextViewController : UIViewController<SpeechToTextModuleDelegate>
@property (retain, nonatomic) IBOutlet UITextView *inputTextView;
@property (retain, nonatomic) IBOutlet UILabel *inputContentLabel;


@end
