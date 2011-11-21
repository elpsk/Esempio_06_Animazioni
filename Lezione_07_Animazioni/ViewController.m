//
//  ViewController.m
//  Lezione_07_Animazioni
//
//  Created by Alberto Pasca on 15/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	[placeholder addSubview:view1];
	view1OnTop = YES;
}

- (IBAction) transitionFade {
  
	if ( view1OnTop ) 
  {
		[placeholder addSubview:view2];
		view2.alpha = 0;
    
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:1.5];
    
		view1.alpha = 0;
		view2.alpha = 1;
    
		[UIView commitAnimations];
    
	} else {
		[placeholder addSubview:view1];
		view1.alpha = 0;
    
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:1.5];
    
		view2.alpha = 0;
		view1.alpha = 1;
    
		[UIView commitAnimations];
	}
  
	[NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(removeView) userInfo:nil repeats:NO];
	
  view1OnTop = !view1OnTop;
}

- (IBAction) transitionCurl:(id)sender {
  
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];
  
	if ( [sender tag] == 1 ) {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:placeholder cache:YES];
	} else {
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:placeholder cache:YES];
	}
  
	if ( view1OnTop ) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	} else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"%s", __FUNCTION__);
}

- (IBAction) transitionFlip:(id)sender {
  
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];
  
	if ([sender tag] == 1) {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:placeholder cache:YES];
	} else {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
	}
  
	if ( view1OnTop ) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	} else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
}

- (IBAction) transitionFlip2 {
  
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.5];	
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
  
	if ( view1OnTop ) {
		[view1 removeFromSuperview];
		[placeholder addSubview:view2];
	} else {
		[view2 removeFromSuperview];
		[placeholder addSubview:view1];
	}
	[UIView commitAnimations];
	
	view1OnTop = !view1OnTop;
	
}

- (void) removeView {
	if ( view1OnTop ) 
  {
		view2.alpha = 1;
		[view2 removeFromSuperview];
	} else 
  {
		view1.alpha = 1;
		[view1 removeFromSuperview];
	}
}

- (void)dealloc {
	[placeholder release];
	[view1 release];
	[view2 release];
  
  [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
