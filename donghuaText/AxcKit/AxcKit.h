


/* AxcKik */
/* 需要SDWebImage POP 框架 */















#pragma mark - AxcSegmentedView
/*
 ---------------------------------AxcSegmentedView----------------------------使用说明：
 初始化：
 可以在代码中通过alloc-init的方法初始化；
 例如：
 //初始化
 self.segmentedView = [[AxcSegmentedView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
 //设置标题
 [self.segmentedView setTitles:@[@"消息",@"电话",@"视频",@"空间",@"圈子"]];
 //    或者：
 //初始化并设置标题
 self.segmentedView = [[AxcSegmentedView alloc]initWithFrame:CGRectMake(0, 0, 200, 44) titles:@[@"消息",@"电话",@"视频",@"空间",@"游戏"]];
 
 //    或者在Xib（Storyboard）中拖拽View，设置继承自 XSSegmentedView 类。
 //    在Xib（Storyboard）中可设置TintColor，改变主体颜色。
 
 //    设置代理：
 //    代码与Xib（Storyboard）均使用
 self.segmentedView.delegate = self;
 //    设置代理
 
 代理方法：
 提供
 - (void)axcSegmentedView:(AxcSegmentedView *)XSSegmentedView selectTitleInteger:(NSInteger)integer{
 
 }
 - (BOOL)axcSegmentedView:(AxcSegmentedView *)XSSegmentedView didSelectTitleInteger:(NSInteger)integer{
 return YES;
 }
 代理方法，
 具体功能见代码注释
 */


#pragma mark - AxcDisperseBtn
/*
 ---------------------------------AxcDisperseBtn----------------------------使用说明：
 // 初始化及创建
 DisperseBtn *disView = [[DisperseBtn alloc]init];
 disView.frame = CGRectMake(100, 100, 50, 50);
 disView.borderRect = self.view.frame;
 disView.closeImage = [UIImage imageNamed:@"icon2"];
 disView.openImage = [UIImage imageNamed:@"icon3"];
 
 [self.view addSubview:disView];
 
 // 添加子按钮
 [_disView recoverBotton];
 
 for (UIView *btn in _disView.btns) {
 [btn removeFromSuperview];
 }
 
 NSMutableArray *marr = [NSMutableArray array];
 for (int i = 0; i< num; i++) {
 UIButton *btn = [UIButton new];
 NSString *name = [NSString stringWithFormat:@"SC%d",i];
 [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
 [marr addObject:btn];
 btn.tag = i;
 [btn addTarget:self action:@selector(buttonTagget:) forControlEvents:UIControlEventTouchUpInside];
 }
 _disView.btns = [marr copy];
 
 */


#pragma mark - AxcGaugeView
/*
 ---------------------------------AxcGaugeView----------------------------使用说明：
 // 初始化
 gauV = [[GaugeView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-300)/2, 50, 300, 300)];
 //开始角度
 gauV.startAngle = 60;
 //结束角度
 gauV.endAngle = 300;
 //刻度线数目
 gauV.count = 20;
 
 gauV.maxValue = 100;
 gauV.minValue = 0;
 
 // 更改此处可改变圆弧角度
 gauV.value = 60;
 [self.view addSubview:gauV];
 
 */


#pragma mark - AxcChooseCityController
/*
 ---------------------------------AxcChooseCityController----------------------------使用说明：
 
 // 正常初始化 经过高度封装后的一个成型界面 直接模态退出或者push即可
 // 调用代理方法可以获取选择的城市
 [self presentViewController:[[AxcChooseCityController alloc] init] animated:YES completion:nil];
 
 
 */


#pragma mark - AxcPickerView
/*
 ---------------------------------AxcPickerView----------------------------使用说明：
 
 // 初始化
 pickerView = [[AxcPickerView alloc] initWithFrame:self.view.bounds];
 pickerView.delegate = self;
 [self.view addSubview:pickerView];
 
 // 代理方法
 // 设置按钮个数
 - (NSUInteger)numberOfItemsInPickerView:(AxcPickerView *)pickerView
 {
 return [self.titles count];
 }
 // 设置按钮文字
 - (NSString *)pickerView:(AxcPickerView *)pickerView titleForItem:(NSInteger)item
 {
 return self.titles[item];
 }
 // 点击事件
 - (void)pickerView:(AxcPickerView *)pickerView didSelectItem:(NSInteger)item
 {
 NSLog(@"%@", self.titles[item]);
 }
 
 */



#pragma mark - AxcCircleView
/*
 ---------------------------------AxcCircleView----------------------------使用说明：
 // 添加子视图方法
 imageviewBi = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi.backgroundColor = [UIColor redColor];
 
 imageviewBi1 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi1.backgroundColor = [UIColor redColor];
 
 imageviewBi2 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi2.backgroundColor = [UIColor redColor];
 
 imageviewBi3 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi3.backgroundColor = [UIColor redColor];
 
 imageviewBi4 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi4.backgroundColor = [UIColor redColor];
 
 imageviewBi5 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi5.backgroundColor = [UIColor redColor];
 
 imageviewBi6 = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewBi6.backgroundColor = [UIColor redColor];
 
 imageviewCustomerInfo = [[AxcImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
 imageviewCustomerInfo.backgroundColor = [UIColor yellowColor];
 
 arrImage = [[NSMutableArray alloc] initWithObjects:imageviewBi,imageviewBi1,imageviewBi2,imageviewBi3,imageviewBi4,imageviewBi5,imageviewBi6, imageviewCustomerInfo, nil];
 
 // 初始化
 AxcCircleView *circleView = [[AxcCircleView alloc] initWithFrame:CGRectMake(0, 70, 300, 300)];
 
 circleView.delegate = self;
 [self.view addSubview:circleView];
 
 circleView.arrImages = arrImage;
 
 [circleView loadView];
 
 }
 // 点击事件代理方法
 - (void)didSelectItemAtSuperView:(NSInteger)index {
 
 }
 
 
 */



#pragma mark - AxcHightLightFadeView、AxcFadeStringView
/*
 ------------------------AxcHightLightFadeView、AxcFadeStringView------------------使用说明：
 
 AxcFadeStringView *fadeStringView = [[AxcFadeStringView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
 fadeStringView.text = @"532432133654";
 fadeStringView.foreColor = [UIColor whiteColor];
 fadeStringView.backColor = [UIColor redColor];
 fadeStringView.font = [UIFont systemFontOfSize:30];
 fadeStringView.alignment = NSTextAlignmentCenter;
 fadeStringView.center = self.view.center;
 [self.view addSubview:fadeStringView];
 // 动画时间
 [fadeStringView fadeRightWithDuration:1];
 
 
 AxcHightLightFadeView *iphoneFade = [[AxcHightLightFadeView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
 iphoneFade.text = @"Axc532432339";
 iphoneFade.foreColor = [UIColor whiteColor];
 iphoneFade.backColor = [UIColor redColor];
 iphoneFade.font = [UIFont systemFontOfSize:30];
 iphoneFade.alignment = NSTextAlignmentCenter;
 iphoneFade.center = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0+50);
 [self.view addSubview:iphoneFade];
 // 动画时间
 [iphoneFade iPhoneFadeWithDuration:2];
 
 
 */



#pragma mark - AxcAlterButton
/*
 ---------------------------------AxcAlterButton----------------------------使用说明：
 
 // 初始化按钮添加图片
 AxcAlterButton *button = [[AxcAlterButton alloc]initWithImage:[UIImage imageNamed:@"axc"]highLightImage:[UIImage imageNamed:@"axc"] Direction:DirectionTypeDown];
 
 
 AxcAlterItemButton *item1 = [[AxcAlterItemButton alloc]initWithImage:[UIImage imageNamed:@"item1"]];
 item1.backgroundColor = [UIColor lightGrayColor];
 
 AxcAlterItemButton *item2 = [[AxcAlterItemButton alloc]initWithImage:[UIImage imageNamed:@"item2"]];
 item2.backgroundColor = [UIColor lightGrayColor];
 
 AxcAlterItemButton *item3 = [[AxcAlterItemButton alloc]initWithImage:[UIImage imageNamed:@"item3"]];
 item3.backgroundColor = [UIColor lightGrayColor];
 
 [button addButtonItems:@[item1, item2, item3]];
 
 button.buttonCenter = CGPointMake(100, 100);
 button.buttonSize = CGSizeMake(40, 40);
 button.animationDuration = 0.5;
 button.delegate = self;
 [self.view addSubview:button];
 
 // 代理方法
 - (void)AlterButton:(AxcAlterButton *)button clickItemButtonAtIndex:(NSUInteger)index
 {
 NSLog(@"you clicked  %ld button", index);
 }
 
 
 */



#pragma mark - AxcCircleProgressView
/*
 ---------------------------------AxcCircleProgressView----------------------------使用说明：
 
 ************************************* 第一个进度圆环 ******************************************
 
 AxcCircleProgressView *circleProgress1 = [AxcCircleProgressView viewWithFrame:CGRectMake(80, 80, 100, 100)
 circlesSize:CGRectMake(30, 5, 30, 5)];
 circleProgress1.layer.cornerRadius = 10;
 circleProgress1.progressValue = 0.5;
 [self.view addSubview:circleProgress1];
 
 ************************************* 第一个进度圆环(仿新浪) ******************************************
 
 AxcCircleProgressView *circleProgress2 = [AxcCircleProgressView viewWithFrame:CGRectMake(80, 200, 100, 100)
 circlesSize:CGRectMake(34, 2, 30, 30)];
 circleProgress2.layer.cornerRadius = 10;
 
 //阴影
 circleProgress2.backgroundColor = [UIColor clearColor];
 circleProgress2.backCircle.shadowColor = [UIColor grayColor].CGColor;
 circleProgress2.backCircle.shadowRadius = 3;
 circleProgress2.backCircle.shadowOffset = CGSizeMake(0, 0);
 circleProgress2.backCircle.shadowOpacity = 1;
 circleProgress2.backCircle.fillColor = [UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:0.8].CGColor;
 circleProgress2.backCircle.strokeColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1].CGColor;
 
 circleProgress2.foreCircle.lineCap = @"butt";
 circleProgress2.foreCircle.strokeColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1].CGColor;;
 circleProgress2.progressValue = 0.2;
 
 [self.view addSubview:circleProgress2];
 
 
 */



#pragma mark - AxcRoundStringView
/*
 ---------------------------------AxcRoundStringView----------------------------使用说明：
 
 // 初始化
 AxcRoundStringView * round=[[AxcRoundStringView alloc]initWithFrame:CGRectMake(50, 100, 200, 100)];
 [round setLableFont:[UIFont systemFontOfSize:12]];
 [round setLableColor:[UIColor blackColor]];
 
 
 
 round.delegate=self;
 NSArray* titles=[[NSArray alloc]initWithObjects:@"Zxc.Inc",@"Axc.Inc",@"Inc",@"赵新6666", nil];
 round.titles=titles;
 
 
 [self.view addSubview:round];
 
 // 代理方法
 // 点击某个标题的时候会调用这个方法  并且回调这个title的下标值
 - (void)RoundViewClickTheTitleWithNumber:(NSInteger)number{
 NSLog(@"%ld",number);
 }
 
 */



#pragma mark - AxcScorePlateView
/*
 ---------------------------------AxcScorePlateView----------------------------使用说明：
 
 // 初始化
 
 AxcScorePlateView * myview = [[AxcScorePlateView alloc]initWithFrame:CGRectMake(40, 60, 232, 232)];
 [self.view addSubview:myview];
 
 // 设置指示颜色修改宏
 CONTENT_COLOR
 
 // 具体修改可详参代码内部
 
 */



#pragma mark - AxcCircleAnimationView
/*
 ---------------------------------AxcCircleAnimationView----------------------------使用说明：
 
 // 初始化
 circleAniView = [[AxcCircleAnimationView alloc] initWithFrame:CGRectMake(100,100, 200, 200)];
 circleAniView.center = self.view.center;
 circleAniView.backgroundColor = [UIColor clearColor];
 [self.view addSubview:circleAniView];
 
 // 设置进度数值
 circleAniView.percentStr = @"50";
 
 
 
 */


#pragma mark - AxcAnimationAsUCView
/*
 ---------------------------------AxcAnimationAsUCView----------------------------使用说明：
 
 // 初始化
 AxcAnimationAsUCView * view = [[AxcAnimationAsUCView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
 view.delegate = self;
 [self.view addSubview:view];
 
 // 下拉结束时代理方法
 - (void)touchMoveEndWithView:(UIView *)view{
 NSLog(@"axc5324");
 }
 
 */


#pragma mark - AxcCircularTemperatureIndicator
/*
 ---------------------------------AxcCircularTemperatureIndicator----------------------------使用说明：
 
 // 初始化
 
 AxcCircularTemperatureIndicator * circleView = [[AxcCircularTemperatureIndicator alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
 
 circleView.text = @"axc5324";
 
 circleView.temperInter = 20 ;
 
 circleView.functionImage = FunctionTypeSun;
 
 [self.view addSubview:circleView] ;
 
 */


#pragma mark - AxcCustomModalTransition
/*
 ---------------------------------AxcCustomModalTransition----------------------------使用说明：
 
 //---初始化要弹出跳转的视图控制器
 TwoViewController *modalVC = [TwoViewController new];
 //---必须强引用，否则会被释放，自定义dismiss的转场无效
 self.transition = [[AxcCustomModalTransition alloc]initWithModalViewController:modalVC];
 self.transition.dragable = YES;//---是否可下拉收起
 modalVC.transitioningDelegate = self.transition;
 //---必须添加这句.自定义转场动画
 modalVC.modalPresentationStyle = UIModalPresentationCustom;
 
 [self presentViewController:modalVC animated:YES completion:nil];
 
 
 */


#pragma mark - AxcAlertView
/*
 ---------------------------------AxcAlertView----------------------------使用说明：
 
 AxcAlertView *view = [[AxcAlertView alloc] initWithTitle:@"您确定吗？" target:self style:kAlertViewStyleSuccess buttonsTitle:@[@"了解",@"不了解"]];
 [view showInView:self.view];
 
 // 代理方法
 
 - (void)alertView:(AxcAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 }
 
 */


#pragma mark - AxcGuideView
/*
 ---------------------------------AxcGuideView----------------------------使用说明：
 
 // 初始化
 _markView = [[AxcGuideView alloc]initWithFrame:[UIScreen mainScreen].bounds];
 _markView.model = GuideViewCleanModeOval;
 _markView.markText = @"欢迎使用...";
 [self.view addSubview:_markView];
 
 
 // 出发方法
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 
 NSArray *rectArray = @[
 [NSValue valueWithCGRect:CGRectMake(100,10,100,100)],
 [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2 - 20, 100, 50)],
 [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH - 20, 42, 50, 200)],
 [NSValue valueWithCGRect:CGRectMake(SCREEN_WIDTH/2-150, SCREEN_HEIGHT/2 - 20, 100, 100)]
 ];
 NSArray *messageArray = @[
 @"这是《简书》",
 @"点这里撰写文章",
 @"搜索文章",
 @"这会是Strong"
 ];
 [_markView setMessageArray:messageArray rectArray:rectArray];
 }
 
 */
#pragma mark - AxcJSWebView
/*
 ---------------------------------AxcAvatarBrowser----------------------------使用说明：
 
 
 // 第一种赋值、实例化
 //    AxcJSWebView *axc = [[AxcJSWebView alloc]initWithFrame:self.view.frame Url:[NSURL URLWithString:@"http://world.huanqiu.com/exclusive/2016-04/8795998.html"]];
 
 
 // 第二种赋值、实例化  不设置frame值将默认全屏
 AxcJSWebView *axc = [[AxcJSWebView alloc]init];
 [axc requestDataWithUrl:[NSURL URLWithString:@"http://world.huanqiu.com/exclusive/2016-04/8795998.html"]];
 
 
 axc.delegateAxc = self;
 [self.view addSubview:axc];
 
 
 }
 
 // 点击后会将图片的URL回调到这个方法中  返回一个展示框或View
 - (UIView *)axcShowView:(AxcJSWebView *)axcJSWebView imageUrl:(NSURL *)url{
 
 UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
 [imageView sd_setImageWithURL:url];
 return imageView;
 
 }
 
 
 */

#pragma mark - AxcFloatLabeledTextField
/*
 ---------------------------------AxcFloatLabeledTextField----------------------------使用说明：
 
 
 AxcFloatLabeledTextField *titleField = [[AxcFloatLabeledTextField alloc] initWithFrame:CGRectMake(0, 100, 375, 40)] ;
 titleField.placeholder = NSLocalizedString(@"姓名", @"");
 //    titleField.placeholder = @"title";
 titleField.font = [UIFont systemFontOfSize:17];
 titleField.floatingLabel.font = [UIFont boldSystemFontOfSize:12];
 titleField.floatingLabelTextColor = [UIColor lightGrayColor];
 titleField.floatingLabelActiveTextColor = [UIColor blackColor];
 titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
 [self.view addSubview:titleField];
 
 */


#pragma mark - AxcPieChartViewController
/*
 ---------------------------------AxcPieChartViewController----------------------------使用说明：
 
 
 - (void)viewDidLoad{
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 AxcPieChart * chart = [[AxcPieChart alloc] pieChartWithRadius:100 center:self.view.center colors:@[[UIColor redColor],[UIColor greenColor],[UIColor lightGrayColor],[UIColor blackColor]] ratioes:@[@0.3,@0.4,@0.2,@0.1] offSet:10];
 
 //    chart.tappedHandler = ^(NSInteger index, BOOL status) {
 //        NSLog(@"第%ld个被点击了，状态是%@",(long)index,[NSNumber numberWithBool:status]);
 //    };
 
 chart.delegate = self;
 [self.view addSubview:chart];
 
 
 }
 
 
 - (void)AxcPieChart:(AxcPieChart *)axcPieChart index:(NSInteger)index finished:(BOOL)finished{
 NSLog(@"第%ld个被点击了，状态是%d",index,finished);
 }
 
 */

#pragma mark - AxcPhotoKitController
/*
 ---------------------------------AxcPhotoKitController----------------------------使用说明：
 详见demo
 */

#pragma mark - AxcTouchID
/*
 ---------------------------------AxcTouchID----------------------------使用说明：
 详见demo
 */

#pragma mark - AxcCustomShareView
/*
 ---------------------------------AxcCustomShareView----------------------------使用说明：
 
 _customShareView = [[AxcCustomShareView alloc]init];
 _customShareView.delegate = self;
 _customShareView.title.text = @"哈哈分享";
 _customShareView.remind.text = @"这是一个定制分享组件";
 NSArray *titleArray = @[@"QQ",@"WX",@"TX",@"WY"];
 NSArray *buttonImageArray = @[@"iconfont-iconfontweixin",@"iconfont-iconfontremen",@"iconfont-iconfontweibo1 (1)",@"iconfont-iconfontweibo1 (1)"];
 [_customShareView setButtonImageArray:buttonImageArray buttonTitleArray:titleArray];
 [self.view addSubview:_customShareView];
 }
 -(void)AxcCustomShareView:(AxcCustomShareView *)axcCustomShareView didSelectAtIndex:(NSInteger)index{
 NSLog(@"%ld",index);
 }
 
 */

#pragma mark - AxcSphereView
/*
 ---------------------------------AxcSphereView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 CGFloat sphereViewW = self.view.frame.size.width - 30 * 2;
 CGFloat sphereViewH = sphereViewW;
 _sphereView = [[AxcSphereView alloc] initWithFrame:CGRectMake(30, 100, sphereViewW, sphereViewH)];
 NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
 
 for (NSInteger i = 0; i < 40; i ++) {
 UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
 [btn setTitle:[NSString stringWithFormat:@"-%ld-", i] forState:UIControlStateNormal];
 btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1.];
 [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 btn.titleLabel.font = [UIFont systemFontOfSize:24.];
 btn.frame = CGRectMake(0, 0, 60, 30);
 btn.layer.cornerRadius = 3;
 btn.clipsToBounds = YES;
 btn.tag = 100 +i;
 [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
 [array addObject:btn];
 [_sphereView addSubview:btn];
 }
 [_sphereView setItems:array];
 [self.view addSubview:_sphereView];
 
 }
 
 - (void)buttonPressed:(UIButton *)btn
 {
 NSLog(@"%ld",btn.tag - 100);
 [_sphereView timerStop];
 
 [UIView animateWithDuration:0.3 animations:^{
 btn.transform = CGAffineTransformMakeScale(2., 2.);
 } completion:^(BOOL finished) {
 [UIView animateWithDuration:0.3 animations:^{
 btn.transform = CGAffineTransformMakeScale(1., 1.);
 } completion:^(BOOL finished) {
 [_sphereView timerStart];
 }];
 }];
 }
 
 */

#pragma mark - AxcDecimalKeyboard
/*
 ---------------------------------AxcDecimalKeyboard----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 AxcDecimalKeyboard *inputView = [[AxcDecimalKeyboard alloc] init];
 
 
 self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, 300, 50)];
 _textField.backgroundColor = [UIColor lightGrayColor];
 self.textField.delegate = self;
 self.textField.inputView = inputView;
 [self.textField reloadInputViews];
 [self.view addSubview:_textField];
 }
 
 /// 设置自定义键盘后，delegate 不会被调用？
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 NSLog(@"%@", [textField.text stringByReplacingCharactersInRange:range withString:string]);
 
 return YES;
 }
 
 */

#pragma mark - AxcPopView
/*
 ---------------------------------AxcPopView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view, typically from a nib.
 self.view.backgroundColor = [UIColor whiteColor];
 
 _customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
 _customBtn.frame = CGRectMake(0, 0, 40, 40);
 [_customBtn setTitle:@"➕" forState:UIControlStateNormal];
 [_customBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
 UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:_customBtn];
 self.navigationItem.rightBarButtonItem = btn;
 
 }
 
 - (void)btnClick:(UIButton *)btn
 {
 
 
 XTTypeOfUpLeft,     // 上左
 XTTypeOfUpCenter,   // 上中
 XTTypeOfUpRight,    // 上右
 
 XTTypeOfDownLeft,   // 下左
 XTTypeOfDownCenter, // 下中
 XTTypeOfDownRight,  // 下右
 
 XTTypeOfLeftUp,     // 左上
 XTTypeOfLeftCenter, // 左中
 XTTypeOfLeftDown,   // 左下
 
 XTTypeOfRightUp,    // 右上
 XTTypeOfRightCenter,// 右中
 XTTypeOfRightDown,  // 右下
 
 CGPoint point = CGPointMake(_customBtn.center.x,_customBtn.frame.origin.y + 64);
 
 AxcPopView *view1 = [[AxcPopView alloc] initWithOrigin:point Width:130 Height:40 * 4 Type:XTTypeOfRightUp Color:[UIColor colorWithRed:0.2737 green:0.2737 blue:0.2737 alpha:1.0]];
 
 view1.dataArray = @[@"发起群聊",@"添加朋友", @"扫一扫", @"收付款"];
 view1.images = @[@"发起群聊",@"添加朋友", @"扫一扫", @"付款"];
 view1.fontSize = 13;
 view1.row_height = 40;
 view1.titleTextColor = [UIColor whiteColor];
 view1.delegate = self;
 [view1 popView];
 }
 
 
 -(void)AxcPopView:(AxcPopView *)axcPopView didSelectAtIndexPathOfRow:(NSInteger)index{
 NSLog(@"%ld",index);
 }
 */

#pragma mark - AxcPhotoPickerViewController
/*
 ---------------------------------AxcPhotoPickerViewController----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
 btn.frame = CGRectMake(100, 100, 100, 40);
 [btn setTitle:@"打开相册" forState:UIControlStateNormal];
 btn.backgroundColor = [UIColor grayColor];
 [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:btn];
 }
 
 //两种传值方式，实际应用中选择一种即可
 - (void)btnClick{;
 AxcPhotoPickerViewController *pickView = [[AxcPhotoPickerViewController alloc]init];
 //1
 pickView.finishBlock = ^(NSArray *array){
 NSLog(@"block--选中%ld张",(unsigned long)array.count);
 };
 //2
 pickView.delegate = self;
 [self presentViewController:pickView animated:YES completion:nil];
 }
 
 //实现代理
 - (void)axcFinishToSelectPhotoWithPhotoArray:(NSArray *)selectedPhotoArray {
 NSLog(@"delegate--选了%ld张",(unsigned long)selectedPhotoArray.count);
 }
 */


#pragma mark - AxcSuspensionView
/*
 ---------------------------------AxcSuspensionView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor  = [UIColor whiteColor];
 // Do any additional setup after loading the view, typically from a nib.
 AxcSuspensionView * view = [[AxcSuspensionView alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
 view.userInteractionEnabled = YES;
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapLabel)];
 [view addGestureRecognizer:tap];
 view.theAdaptiveNavigationBar = YES;
 [self.view addSubview:view];
 
 }
 
 - (void)TapLabel{
 NSLog(@"axc");
 }
 
 */

#pragma mark - AxcCycleTextView
/*
 ---------------------------------AxcCycleTextView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 AxcCycleTextView *axc = [[AxcCycleTextView alloc]initWithFrame:CGRectMake(20, 100, 300, 50)];
 //    axc.textColor = [UIColor blueColor];
 //    axc.backgroundColor = [UIColor whiteColor];
 axc.text = @"Axc53243233913720049025";
 axc.timeInterval = 2;
 [self.view addSubview:axc];
 
 }
 
 */

#pragma mark - AxcSlimeAirBubblesView
/*
 ---------------------------------AxcSlimeAirBubblesView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 AxcSlimeAirBubblesView *slimeView = [[AxcSlimeAirBubblesView alloc] initWithFrame: self.view.bounds];
 slimeView.delegate = self;
 [self.view addSubview: slimeView];
 
 }
 
 - (void)dragDropBegan{
 NSLog(@"开始");
 }
 
 - (void)dragDropChange{
 NSLog(@"进行");
 }
 
 - (void)dragDropEnding{
 NSLog(@"结束");
 }
 
 - (void)dragDropBreak{
 NSLog(@"破裂");
 }
 
 */

#pragma mark - AxcTagView
/*
 ---------------------------------AxcTagView----------------------------使用说明：
 - (void)viewDidLoad {
 
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 AxcTagView *AxcView = [[AxcTagView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 0)];
 
 AxcView.TagColor = [UIColor greenColor];
 AxcView.AxcbackgroundColor = [UIColor redColor];
 AxcView.delegate = self;
 [AxcView setArrayTagWithLabelArray:@[@"大家",@"你是什么",@"是不是呢",@"想要什么呢",@"吃大餐了哦哦哦",@"技术部的大牛",@"商场部的技术",@"全体人员注意了。开始了"]];
 [self.view addSubview:AxcView];
 
 
 
 }
 
 - (void)axcTagView:(AxcTagView *)axcTagView didSelectAtIndex:(NSInteger)index{
 NSLog(@"%ld",index);
 }
 
 */

#pragma mark - AxcCycleView
/*
 ---------------------------------AxcCycleView----------------------------使用说明：
 - (void)viewDidLoad {
 self.view.backgroundColor = [UIColor whiteColor];
 
 cycleView = [[AxcCycleView alloc] initWithFrame:CGRectMake(10, 160,300,200) Content:9 addTaget:self];
 
 NSMutableArray * colors = [[NSMutableArray alloc] init];
 NSMutableArray * contents = [[NSMutableArray alloc] init];
 
 for (NSInteger i=0; i<5; ++i) {
 
 CGFloat rand1 = ((arc4random()%256)/256.0);
 CGFloat rand2 = ((arc4random()%256)/256.0);
 CGFloat rand3 = ((arc4random()%256)/256.0);
 
 [colors addObject:[UIColor colorWithRed:rand1 green:rand2 blue:rand3 alpha:1]];
 [contents addObject:[NSString stringWithFormat:@"这是视图%ld",i+1]];
 }
 
 cycleView.backgroundColor = [UIColor clearColor];
 
 [self.view addSubview: cycleView];
 
 
 [cycleView startAnimationWithTimerInterval:2 repeat:YES];
 
 }
 
 
 - (void)viewDidDisappear:(BOOL)animated {
 [cycleView stopAnimation];
 }
 
 
 - (UIView *)AxcCycleView:(AxcCycleView *)axcCycleView atIndex:(NSInteger)index{
 
 UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
 label.text = [NSString stringWithFormat:@"%ld",index];
 label.backgroundColor = [UIColor redColor];
 
 return label;
 }
 
 - (void)AxcCycleView:(AxcCycleView *)axcCycleView didSelectAtIndex:(NSInteger)index{
 NSLog(@"%ld",index);
 }
 
 */


#pragma mark - AxcFilterControl
/*
 ---------------------------------AxcFilterControl----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 // Do any additional setup after loading the view, typically from a nib.
 AxcFilterControl *_filter = [[AxcFilterControl alloc]initWithFrame:CGRectMake(25, 100, self.view.frame.size.width-50, 15) Titles:[NSArray arrayWithObjects:@"人民轿车", @"高级轿车", @"豪华轿车", @"优步专车",@"axc", nil]];
 [_filter addTarget:self action:@selector(filterValueChanged:) forControlEvents:UIControlEventTouchUpInside];
 [_filter setProgressColor:[UIColor groupTableViewBackgroundColor]];//设置滑杆的颜色
 [_filter setTopTitlesColor:[UIColor orangeColor]];//设置滑块上方字体颜色
 [_filter setSelectedIndex:0];//设置当前选中
 //    [_Button_UIView addSubview:_filter];
 [self.view addSubview:_filter];
 }
 
 #pragma mark -- 点击底部按钮响应事件
 -(void)filterValueChanged:(AxcFilterControl *)sender
 {
 NSLog(@"当前滑块位置%d",sender.SelectedIndex);
 
 }
 
 */
#pragma mark - AxcLockView
/*
 ---------------------------------AxcLockView----------------------------使用说明：
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 self.view.backgroundColor = [UIColor whiteColor];
 
 
 AxcLockView *a = [[AxcLockView alloc]initWithFrame:CGRectMake(10, 200, 375, 400)];
 a.delegate = self;
 [a awakeFromNib];
 a.backgroundColor = [UIColor lightGrayColor];
 [self.view addSubview:a];
 
 }
 
 - (void)axcReturnsTheGesturesPassword:(NSString *)password{
 NSLog(@"%@",password);
 }
 
 */

#pragma mark - UIView+AxcTouchs
/*
 ---------------------------------AxcTouchTap----------------------------使用说明：
 _myView.tap = [AxcTouchTap tapWithTouchBlock:^(id sender) {
 NSLog(@"[%@]:view的点击事件",[sender class]);
 }];
 
 */

#pragma mark - AxcUtilNotif
/*
 ---------------------------------AxcUtilNotif----------------------------使用说明：
 [AxcUtilNotif registAction];
 
 }
 
 -(void)buttonAction
 {
 [AxcUtilNotif sendMess:5 body:@"大家好axc" noticeStr:@"前台"];
 }

 
 */



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// 可直接修改frame值的扩展工具
#import "UIView+Extension.h"
// 给文本框添加左右晃动（shake）效果扩展工具
#import "UITextField+Shake.h"
// 可以使View自行按比例增减
#import "UIView+AutoresizingMask.h"
// 可以扩展View的点击、长摁、左右滑动事件
#import "UIView+AxcTouchs.h"
// 扩展一行代码打开照片
#import "UIViewController+XHPhoto.h"
// 扩展Present转场动画
#import "UIViewController+AxcPopupViewController.h"
// 一行代码搞定下拉头图放大
#import "UIScrollView+AxcScalableCover.h"
// 一行代码推出View（仿淘宝推出购物车）
#import "UIViewController+AxcSemiModal.h"
// 颜色辅助工具
#import "UIColor+AxcColor.h"
// 动画扩展类
#import "CAAnimation+AxcAnimation.h"
// 基于POP引擎的动画类
#import "UIView+FlAnimation.h"


// 滑动选择分栏控制器
#import "AxcSegmentedView.h"
// 可展开带子类的Button
#import "AxcDisperseBtn.h"
// 指针圆弧进度指示器
#import "AxcGaugeView.h"
// 城市选择器（Controller样式）
#import "AxcChooseCityController.h"
// 横向滚轴选择器
#import "AxcPickerView.h"
// 圆环转动选择器
#import "AxcCircleView.h"
// 渐亮效果文字
#import "AxcHightLightFadeView.h"
// 类歌词渐亮/衰退效果
#import "AxcFadeStringView.h"
// 按钮下拉扩展Button
#import "AxcAlterButton.h"
#import "AxcAlterItemButton.h"
// 图片下载/上载进度指示器
#import "AxcCircleProgressView.h"
// 文字轮播器
#import "AxcRoundStringView.h"
// 评分器/数值指示器/数值估算器
#import "AxcScorePlateView.h"
// 圆形指针进度指示器
#import "AxcCircleAnimationView.h"
// 下拉弹性效果标题View
#import "AxcAnimationAsUCView.h"
// 圆形温度指示器
#import "AxcCircularTemperatureIndicator.h"
// 页面模态推出（仿简书推出）
#import "AxcCustomModalTransition.h"
// 动画效果提示器
#import "AxcAlertView.h"
// 聚光灯引导器
#import "AxcGuideView.h"
// 点击头像放大
#import "AxcAvatarBrowser.h"
// 可以点击图片回调函数的WebView
#import "AxcJSWebView.h"
// 输入文本可将填充文本转移到上方的控件
#import "AxcFloatLabeledTextField.h"
// 可点击的饼图
#import "AxcPieChart.h"
// 从相册读取照片裁切
#import "AxcPhotoKitController.h"
// 验证TouchID
#import "AxcTouchID.h"
// 提示控件
#import "AxcToast.h"
// 定制分享面板控件
#import "AxcCustomShareView.h"
// 3D球型选择器
#import "AxcSphereView.h"
// 自定义支付键盘（适配）
#import "AxcDecimalKeyboard.h"
// 星星评分器
#import "AxcStarScoreView.h"
// 自定义小气泡
#import "AxcPopView.h"
// 打开相册读取照片
#import "AxcPhotoPickerViewController.h"
// 悬浮物体
#import "AxcSuspensionView.h"
// 左右按钮textField
#import "AxcDoubleButtonTextField.h"
// 文字跑马
#import "AxcShufflingView.h"
// 文字轮播展示框
#import "AxcCycleTextView.h"
// 破裂气泡
#import "AxcSlimeAirBubblesView.h"
// 标签View
#import "AxcTagView.h"
// 层叠View 卡片式轮播
#import "AxcCycleView.h"
// 滑杆选择器
#import "AxcFilterControl.h"
// 手势解锁控件
#import "AxcLockView.h"
// 本体推送体
#import "AxcUtilNotif.h"
// 摇杆
#import "AxcRocker.h"
// 卡片式电影预览模块
#import "AxcMovieBrowser.h"
// 本地或网络加载GIF图片View
#import "AxcGifImageView.h"
// 卡片横向翻动布局器
#import "AxcCardViewLayout.h"
// 仿QQ拖动气泡
#import "AxcBubbleView.h"
// 文字抖动Label
#import "AxcLabelAnimation.h"
// 仿U步取消圆形按钮
#import "AxcHandleDemoView.h"
// PDF阅读器
#import "AxcPDFViewController.h"
// 推送栏
#import "AxcPushBarToast.h"
// 大型加载器
#import "AxcSpinnerTenDot.h"
// 流式多选标签
#import "AxcTagListView.h"
// 仿淘宝纵向轮播头条
#import "AxcTopLineView.h"
// 动画轻量级引擎组件
#import "AxcAnimation.h"
// 圆形推出界面
#import "AxcMaterialTransition.h"
// 小型右滑菜单
#import "AxcSlideView.h"
// 基于POP引擎的动画按钮
#import "AxcPopButton.h"



#pragma mark - 自定义方法在下添加

@interface AxcKit : NSObject











@end
