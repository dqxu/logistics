//
//  LogisticsViewController.m
//  Created by dqxu

#import "LogisticsViewController.h"
#import "AppMacro.h"
#import "UIView+DQExtension.h"
#import "CommonView.h"
#import "CommonDef.h"

#define kMargin 6


@interface LogisticsViewController ()
{
    UIView *_topDockView;
    UIScrollView *_scrollView;
    
    UIView *_sortLineView;
    
    UIButton *_selectBtn;
    
    UISegmentedControl *_segmentControl;
    NSMutableArray *_pathArray;
    
    UILabel *_kuaidiName;
    UILabel *_kuaidiNo;

}
@end

@implementation LogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = GlobalBG;
    self.navigationItem.title = @"物流查询";
    
    
    
    _pathArray = [NSMutableArray array];
    
     NSArray *tarray = @[@[@"感谢您在商城购物，欢迎您再次光临!",@"2015-03-28 12:48"],
                   @[@"配送员小李已出发，联系电话15001055144，投诉建议17603851615，休息日请下单家中",@"2015-03-28 08:09"],
                   @[@"您的订单在[管城站]验货完成，正在分配配送员",@"2015-03-28 07:44"],
                   @[@"您的订单在[郑州分拨中心]发货完成,准备送往[管城站]",@"2015-03-27 22:29"],
                   @[@"您的订单在[郑州分拨中心]分拣完成",@"2015-03-27 20:05"],
                   @[@"打包成功",@"2015-03-27 19:58"],
                   @[@"扫描员已经扫描",@"2015-03-27 19:55"],
                   @[@"您的订单已经打印完毕",@"2015-03-27 19:35"]
                   ];
    [_pathArray  addObjectsFromArray:tarray];
    [self setUI];
    [self setContentView];
    

    
}



- (void)setUI
{
    CGRect bounds = [[UIScreen mainScreen] bounds];


    
    CGRect contentviewRect,topviewRect;
    CGFloat tViewH = 54;
    CGFloat tempY = kNavgationH + tViewH;
    topviewRect = CGRectMake(0, kNavgationH,bounds.size.width,tViewH);
    contentviewRect = CGRectMake(0,kNavgationH + tViewH,bounds.size.width, bounds.size.height  - tempY);

    _scrollView = [[UIScrollView alloc]initWithFrame:contentviewRect];
    
    _scrollView.bounces = YES;
    
    _scrollView.backgroundColor = Gray81Color;
    

    
    _scrollView.showsVerticalScrollIndicator = NO;
    
    
    
    
    _topDockView = [[UIView alloc]initWithFrame:topviewRect];
    _topDockView.backgroundColor = GlobalBG;
    [self.view addSubview:_topDockView];
    
    CGFloat margin = 10;
    CGFloat width = (_topDockView.ddWidth - 2 * margin) * 0.5;
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(margin + margin, 0, width - margin, _topDockView.ddHeight)];
    label1.textColor = [UIColor blackColor];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.font = [UIFont systemFontOfSize:15];
    label1.text = @"快递号:";
    [_topDockView addSubview:label1];
    _kuaidiName = label1;
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(width + margin, 0, width - 5, _topDockView.ddHeight)];
    label2.textColor = [UIColor blackColor];
    label2.textAlignment = NSTextAlignmentRight;
    label2.font = [UIFont systemFontOfSize:15];
    label2.text = @"67782399173323";
    [_topDockView addSubview:label2];
    _kuaidiNo = label2;
    
    
    [self.view addSubview:_scrollView];
}


//[self setContentView];
- (void)setContentView
{
    

    
    NSInteger count = _pathArray.count;
    CGFloat hMargin = 10;
    CGFloat vMargin = 5;
    CGFloat pathLineW = 7;
    
    CGFloat startY = vMargin;
    CGFloat width = _scrollView.frame.size.width;
    
    CGFloat labelW = width - 2 * hMargin -2 * hMargin - pathLineW;
    
    
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(hMargin, 0, width - 2*hMargin, 0)];
    baseView.backgroundColor = Gray91Color;
    [_scrollView addSubview:baseView];
    
    baseView.layer.borderColor = [Gray71Color CGColor];
    
    baseView.layer.borderWidth = 1;
    baseView.layer.cornerRadius = 4;
    baseView.clipsToBounds = YES;
    
    
    UIFont *labelFont = [UIFont systemFontOfSize:14];
    
    UIView *firstBackGroundView = nil;
    
    for (int i = 0; i < count; ++i)
    {
        
        NSString *str = _pathArray[i][0];

        CGSize labelSize =  [str sizeWithFont:labelFont constrainedToSize:CGSizeMake(labelW,MAXFLOAT)];
        if(i == 0)
        {
            firstBackGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, baseView.frame.size.width, 0)];
            firstBackGroundView.backgroundColor = [UIColor whiteColor];
            [baseView addSubview:firstBackGroundView];
        }
        
        
        //事件label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2 *hMargin + pathLineW, startY,labelW ,labelSize.height)];
        label.font = labelFont;
//        label.text = _pathArray[i][0];
        label.text = str;
        label.numberOfLines = 0;
        [baseView addSubview:label];
        
        
        
        
        CGFloat pathBeginY = startY + vMargin;
        
        startY += labelSize.height + vMargin;
        
        //时间label
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 *hMargin + pathLineW, startY,labelW ,20)];
        timeLabel.font = labelFont;
        timeLabel.text = _pathArray[i][1];
        [baseView addSubview:timeLabel];
        if (i != (count -1)) {
            [CommonView addBottomLineWithColor:nil baseView:timeLabel];
        }
        
        
        if (i == 0) {
            setFrameHeight(firstBackGroundView, CGRectGetMaxY(timeLabel.frame));
        }
        startY += 20 + vMargin;
        
        CGFloat pathEndY = startY + vMargin;
        
       
        
        
       
        
        if (i != (count - 1))
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(hMargin + pathLineW /2.0 - 0.5, pathBeginY, 1, pathEndY - pathBeginY)];
            
            view.backgroundColor = [UIColor lightGrayColor];
            
            
            UIView *beginCirCle = [[UIView alloc]initWithFrame:CGRectMake(hMargin, pathBeginY, pathLineW, pathLineW)];
            beginCirCle.backgroundColor = [UIColor lightGrayColor];
            beginCirCle.layer.cornerRadius = pathLineW/2.0;
            
            [baseView addSubview:view];
            
            [baseView addSubview:beginCirCle];
        }
        else  //最后一行线，只有个起点
        {
            UIView *beginCirCle = [[UIView alloc]initWithFrame:CGRectMake(hMargin, pathBeginY, pathLineW, pathLineW)];
            beginCirCle.backgroundColor = [UIColor lightGrayColor];
            beginCirCle.layer.cornerRadius = pathLineW/2.0;
            [baseView addSubview:beginCirCle];
        }
        
    }
    
    setFrameHeight(baseView, startY);
    
    if (startY < _scrollView.ddHeight) {
        setFrameHeight(_scrollView, startY); //scrollView上添加baseView
    }
    
    
    _scrollView.contentSize = CGSizeMake(width, startY *1.2);
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"list view:");
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
