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
	return %orig;
}
%end

%hook UIStatusBar_Modern
-(void)layoutSubviews {
	if(setStatusBarColour)
	{
		self.backgroundColor = [UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:1.0];
	}
	return %orig;
}
%end

%hook SBFloatingDockPlatterView
-(void)layoutSubviews {
	if(setFloatingDockColour)
	{
		self.backgroundColor = [UIColor colorWithRed:0.29 green:0.21 blue:0.42 alpha:1.0];
	}
	return %orig;
}
%end