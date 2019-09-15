#import "tweak.h"

static BOOL DNDEnabled;
static BOOL setpillIcon; 

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
	if (setpillIcon) {
		self.backgroundColor = [UIColor colorWithRed:0.57 green:0.74 blue:0.92 alpha:1.0];
	}
	if (!setpillIcon) {
		self.backgroundColor = [UIColor clearColor];
	}
	return %orig;
}
%end

%hook _UIStatusBarTimeItem
-(_UIStatusBarStringView *)timeView {
	_UIStatusBarStringView *orig = %orig;
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.5,0,52.5,14.5)];
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-3.5,0.5,52.5,14.5)];
	
	[label setText:[NSString stringWithFormat:@"12:34 pm"]];
	[label setFont:[UIFont fontWithName:@".SFUIText-Medium" size:10]];
	label.layer.zPosition = 1;
	
	view.layer.cornerRadius = 8.0;
	view.layer.zPosition = 0;
	
	[view setBackgroundColor:[UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:0.0]];
	[label setTextColor:[UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:0.0]];

	if (setpillIcon) {
		[label setTextColor:[UIColor blackColor]];
		[view setBackgroundColor:[UIColor colorWithRed:0.53 green:0.38 blue:0.76 alpha:1.0]];
	} 
	[orig addSubview:label];
	[orig addSubview:view];
	return %orig;
}
%end
