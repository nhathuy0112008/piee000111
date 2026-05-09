#import <UIKit/UIKit.h>

@interface NhuyMenu : UIView
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIScrollView *tab1;
@property (nonatomic, strong) UIScrollView *tab2;
@end

@implementation NhuyMenu
- (instancetype)init {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        // Tạo khung menu bo tròn
        self.containerView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 400)];
        self.containerView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.9];
        self.containerView.layer.cornerRadius = 20; // Bo tròn góc
        self.containerView.layer.borderWidth = 2;
        self.containerView.layer.borderColor = [UIColor cyanColor].CGColor;
        [self addSubview:self.containerView];

        // Tiêu đề Menu
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 300, 30)];
        title.text = @"NhuyMAP";
        title.textColor = [UIColor whiteColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont boldSystemFontOfSize:20];
        [self.containerView addSubview:title];

        [self setupTabs];
    }
    return self;
}

- (void)setupTabs {
    // Tab 1: Hack Map & Auto
    self.tab1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 300, 350)];
    [self addSwitch:@"Hack Map" y:20 to:self.tab1];
    [self addSwitch:@"Auto Bộc Phá" y:70 to:self.tab1];
    [self addSwitch:@"Auto Trừng Trị" y:120 to:self.tab1];
    [self.containerView addSubview:self.tab1];

    // Tab 2: Mod (Ẩn mặc định, bạn có thể thêm nút chuyển tab)
    self.tab2 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, 300, 350)];
    self.tab2.hidden = YES;
    [self addSwitch:@"Mod Skin" y:20 to:self.tab2];
    [self addSwitch:@"Mod Nút" y:70 to:self.tab2];
    [self addSwitch:@"Mod Thông Báo" y:120 to:self.tab2];
    [self.containerView addSubview:self.tab2];
}

- (void)addSwitch:(NSString *)title y:(CGFloat)y to:(UIView *)parent {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, y, 150, 30)];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    [parent addSubview:label];

    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(220, y, 50, 30)];
    sw.onTintColor = [UIColor cyanColor];
    [parent addSubview:sw];
}
@end