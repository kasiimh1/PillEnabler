#import "tweak.h"

static BOOL DNDEnabled;
static BOOL setStatusBarColour;
static BOOL setFloatingDockColour;
static BOOL setpillIcon; 

%hook DNDState
-(BOOL)isActive {
	DNDEnabled = %orig;
	if (DNDEnabled) {
			setStatusBarColour = YES;
			setFloatingDockColour = YES;
			setpillIcon = YES;
	}
	else {
		setStatusBarColour = NO;
		setFloatingDockColour = NO;
		setpillIcon = NO;
	}
	return %orig;
}
%end

%hook _UIStatusBar
-(void)layoutSubviews {
	if (!setpillIcon)
	{
		return %orig;
	}
}
%end

%hook _UIStatusBarTimeItem
-(_UIStatusBarStringView *)timeView {
	if (setpillIcon) {
		_UIStatusBarStringView *orig = %orig;
			UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-3.5,0.5,52.5,14.5)];
			[view setBackgroundColor:[UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:1.0]];
			view.layer.cornerRadius = 8.0;
			view.layer.zPosition = 0;
			[orig addSubview:view];
			return orig;
	}
		return %orig;
}
%end
