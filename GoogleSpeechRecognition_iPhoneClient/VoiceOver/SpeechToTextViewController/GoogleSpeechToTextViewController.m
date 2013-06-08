//
//  GoogleSpeechToTextViewController.m
//  VoiceOver
//
//  Created by Wang Jue on 12/25/12.
//  Copyright (c) 2012 FREELEONS. All rights reserved.
//

#import "GoogleSpeechToTextViewController.h"
#import "SpeechToTextModule.h"


@interface GoogleSpeechToTextViewController ()
{
    SpeechToTextModule* speechToTextModule;
    UIViewController* recordLayerVC;
}

@end

@implementation GoogleSpeechToTextViewController
@synthesize inputTextView;
@synthesize inputContentLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [speechToTextModule stopRecording:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButtonTaped:(id)sender {
    [speechToTextModule stopRecording:YES];
}

- (IBAction)startSpeechToTextButtonTaped:(id)sender {
    speechToTextModule = [[SpeechToTextModule alloc] initWithCustomDisplay:@"SineWaveViewController"];
    speechToTextModule.delegate = self;
    recordLayerVC = speechToTextModule.recordLayerViewController;
    
    
    
    [speechToTextModule beginRecording];
    if (recordLayerVC) {
        [self presentModalViewController:recordLayerVC animated:YES];
    }
}



- (BOOL)didReceiveVoiceResponse:(NSData *)data;
{
    NSError* error = nil;
    NSDictionary* deserializedData = [[CJSONDeserializer alloc] deserialize:data error:&error];
    NSLog(@"data: %@", [deserializedData description]);
    inputTextView.text = [deserializedData description];

    NSLog(@"deserializedData: %@", [deserializedData description]);
    
//    NSLog(@"[deserializedData ]: %@", [deserializedData objectForKey:@"hypotheses"]);
//    
//    NSLog(@"[[deserializedData objectForKey:hypotheses] objectAtIndex:0] %@", [[deserializedData objectForKey:@"hypotheses"] objectAtIndex:0]);
//    
//    NSLog(@"[[deserializedData objectForKey:hypotheses] objectAtIndex:0] %@", [[[deserializedData objectForKey:@"hypotheses"] objectAtIndex:0] objectForKey:@"utterance"]);
    
//    inputContentLabel.text = [[deserializedData objectForKey:@"hypotheses"] objectAtIndex:0];
//    
//    NSLog(@"[deserializedData ]: %@", [deserializedData objectForKey:@"hypotheses"]);
//    [[deserializedData] objectForKey:@"utterance"];
    if ([[deserializedData objectForKey:@"hypotheses"] count] == 0) {
        inputContentLabel.text = @"Empty Content";
    }
    else
    {
        inputContentLabel.text = [[[deserializedData objectForKey:@"hypotheses"] objectAtIndex:0] objectForKey:@"utterance"];
    }
    return YES;
}

-(void)stopRecording
{
    [speechToTextModule stopRecording:YES];
    [self.modalViewController dismissViewControllerAnimated:YES completion:^{}];
    
}


-(void)dealloc
{
    if (recordLayerVC) {
        [recordLayerVC release];
    }
    [inputTextView release];
    [inputContentLabel release];
    [super dealloc];
}


@end
