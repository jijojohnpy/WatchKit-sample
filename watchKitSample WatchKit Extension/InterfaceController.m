//
//  InterfaceController.m
//  watchKitSample WatchKit Extension
//
//  Created by User on 8/13/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)buttonAction:(id)sender
{
  NSLog(@"clicked-->>>");
  NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"google.com", @"url", nil];
  [WKInterfaceController openParentApplication:dict reply:^(NSDictionary *replyInfo, NSError *error){
    NSLog(@"recieved reply-->>>%@", replyInfo);
  }];
  

  NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                           NSUserDomainMask,YES);
  NSString *path = [[filePaths firstObject] stringByAppendingPathComponent:@"rec.m4a"];
  NSURL *fileUrl = [NSURL fileURLWithPath:path];
  
  
 [self presentMediaPlayerControllerWithURL(fileUrl, options:WKMediaPlayerControllerOptionsAutoplayKey)
  {
    (didPlayToEnd, endTime, error) -> Void in
    
    print("didPlayToEnd:\(didPlayToEnd), endTime:\(endTime), error:\(error)")
  }];
}

@end



