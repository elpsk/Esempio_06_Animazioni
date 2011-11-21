//
//  ViewController.h
//  Lezione_07_Animazioni
//
//  Created by Alberto Pasca on 15/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
  
  IBOutlet UIView *placeholder;
  IBOutlet UIView *view1;
  IBOutlet UIView *view2;
  
	bool view1OnTop;
  
}

- (IBAction) transitionCurl:(id)sender;
- (IBAction) transitionFlip:(id)sender;
- (IBAction) transitionFade;
- (IBAction) transitionFlip2;

@end
