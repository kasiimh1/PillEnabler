#import "tweak.h"

static BOOL DNDEnabled;
static BOOL setStatusBarColour;
static BOOL setFloatingDockColour;

%hook DNDState
-(BOOL)isActive {
	DNDEnabled = %orig;
	if (DNDEnabled) {
			setStatusBarColour = YES;
			setFloatingDockColour = YES;
	}
	else {
		setStatusBarColour = NO;
		setFloatingDockColour = NO;
	}
	return %orig;
}
%end

%hook _UIStatusBar
-(void)layoutSubviews {
	if(setStatusBarColour)
	{
		self.backgroundColor = [UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:1.0];
	}
	if(!setStatusBarColour) 
	{
		self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
	}
	return %orig;
}
%end
