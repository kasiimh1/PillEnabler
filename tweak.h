@interface _UIStatusBar: UIColor 
@property (nonatomic,copy,readwrite) UIColor * backgroundColor;
@property(class, nonatomic, readonly) UIColor *clearColor;
@end

@interface _UIStatusBarStringView: UIView
@end

@interface _UIStatusBarTimeItem: _UIStatusBar
@property (nonatomic, retain) _UIStatusBarStringView * shortTimeView;
@property (nonatomic, retain) _UIStatusBarStringView * pillTimeView;
@property (nonatomic, retain) _UIStatusBarStringView * timeView;
@property UIView * pillIconView;
@end