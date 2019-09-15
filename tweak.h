@interface _UIStatusBar: UIColor 
@property (nonatomic,copy,readwrite) UIColor * backgroundColor;
@end

@interface _UIStatusBarStringView: UIView
@property (copy,readonly) NSString * description; 
@end

@interface _UIStatusBarTimeItem: _UIStatusBar
@property (nonatomic, retain) _UIStatusBarStringView * shortTimeView;
@property (nonatomic, retain) _UIStatusBarStringView * pillTimeView;
@property (nonatomic, retain) _UIStatusBarStringView * timeView;
@property UIView * pillIconView;
@end