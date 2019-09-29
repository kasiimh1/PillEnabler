#import "tweak.h"

static BOOL DNDEnabled;
static BOOL setpillIcon; 
static BOOL ran;

%hook DNDState
-(BOOL)isActive {
	DNDEnabled = %orig;
	if (DNDEnabled) {
			setpillIcon = YES;
	}
	if (!DNDEnabled) {
		setpillIcon = NO;
	}
	return %orig;
}
%end

%hook _UIStatusBar
-(void)layoutSubviews {
	%orig;

	UIView *pillView;
	pillView = [[UIView alloc] initWithFrame:CGRectMake(2.5,2.5,54,16)];	
	pillView.layer.cornerRadius = 6.5;
	pillView.layer.zPosition = 0;

	if (setpillIcon) {
		if(!ran) {
		[self addSubview:pillView];
		[self sendSubviewToBack:pillView];
		ran = YES;
		[pillView setBackgroundColor:[UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:1.0]];
		}
	}
	if (!setpillIcon) {
		[pillView setBackgroundColor:[UIColor colorWithRed:0.75 green:0.42 blue:0.52 alpha:1.0]];
		[self setNeedsDisplay];
		ran = NO;
}
	return;
}
%end