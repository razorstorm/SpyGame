//
//  PlayerWordBackView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordBackView.h"
#import "PlayerWordView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVcaptureSession.h>
#import <AVFoundation/AVCaptureVideoPreviewLayer.h>

#include "TargetConditionals.h"

@interface PlayerWordBackView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation PlayerWordBackView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [[NSBundle mainBundle] loadNibNamed:@"PlayerWordBackView" owner:self options:nil][0];
  if (self) {
    self.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
  }
  return self;
}

- (IBAction)readyButton:(id)sender {
  [self.parentView onReady];
}

- (void)awakeFromNib {
  [super awakeFromNib];

  #if !(TARGET_IPHONE_SIMULATOR)
  //----- SHOW LIVE CAMERA PREVIEW -----
  AVCaptureSession *session = [[AVCaptureSession alloc] init];
  session.sessionPreset = AVCaptureSessionPresetMedium;

  AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];

  captureVideoPreviewLayer.frame = self.imageView.bounds;
  [self.imageView.layer addSublayer:captureVideoPreviewLayer];

  AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

  NSError *error = nil;
  AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
  if (!input) {
    // Handle the error appropriately.
    NSLog(@"ERROR: trying to open camera: %@", error);
  }
  [session addInput:input];

  [session startRunning];
  #endif
}

@end
