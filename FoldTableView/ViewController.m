//
//  ViewController.m
//  FoldTableView
//
//  Created by clearlove on 16/6/15.
//  Copyright © 2016年 belink. All rights reserved.
//

#import "ViewController.h"
#import "HeadModel.h"
#import "HeaderView.h"
#import "Model.h"
#import "Cell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myTabeleView;
@property(nonatomic,strong)NSMutableArray *myDataArr;
@property(nonatomic,strong)HeaderView *myAllheadVIew;
@property(nonatomic,strong)HeaderView  *mySomeHeadVIew;
@property(nonatomic,strong)NSMutableArray *mySelectDataArr;

@end

@implementation ViewController

- (NSMutableArray *)mySelectDataArr{
    if (_mySelectDataArr == nil) {
        _mySelectDataArr = [NSMutableArray array];
    }
    return _mySelectDataArr;
}

- (NSMutableArray *)myDataArr{
    if (_myDataArr == nil) {
        _myDataArr = [NSMutableArray array];
    }
    return _myDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
    [self initData];
}
-(void)initView
{
    [self initHeadView ];
    [self initSomeheadView:CGRectMake(0, CGRectGetMaxY(self.myAllheadVIew.frame) + 10, self.view.frame.size.width, 30)];
}
-(void)initHeadView
{
    self.myAllheadVIew = [[HeaderView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 30)];
    [self.myAllheadVIew upDataWithAll];
    [self.myAllheadVIew setBackgroundColor:[UIColor grayColor]];
    __weak ViewController *weakSelf = self;
    self.myAllheadVIew.myTapAction = ^(NSInteger tag){
        NSLog(@"点击所有好友");
        [weakSelf.mySelectDataArr removeAllObjects];
        for (int i =0; i< self.myDataArr.count; i++) {
            GroupModel *groupModel = weakSelf.myDataArr[i];
            for (int i=0; i<groupModel.myDataArr.count; i++) {
                Model *tempModel = groupModel.myDataArr[i];
                tempModel.isSelect = YES;
                [weakSelf.mySelectDataArr addObject:tempModel];
            }
            [weakSelf.mySomeHeadVIew upDateSelectNum:[NSString stringWithFormat:@"%ld",weakSelf.mySelectDataArr.count]];
            [weakSelf.myTabeleView reloadData];
        }
    };
    [self.view addSubview:self.myAllheadVIew];
    
}
-(void)initSomeheadView:(CGRect)frame
{
    self.mySomeHeadVIew = [[HeaderView alloc]initWithFrame:frame];
    [self.mySomeHeadVIew upDateSelectNum:@"" andWithGroupName:@"部分好友"];
    [self.mySomeHeadVIew setBackgroundColor:[UIColor grayColor]];
    ViewController *tempView = self;
    self.mySomeHeadVIew.myTapAction = ^(NSInteger tag)
    {
        tempView.myTabeleView.hidden = NO;
        [tempView.myTabeleView reloadData];
    };
    [self.view addSubview:self.mySomeHeadVIew];
    
    self.myTabeleView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.mySomeHeadVIew.frame), self.mySomeHeadVIew.frame.size.width, self.view.frame.size.height -CGRectGetMaxY(self.mySomeHeadVIew.frame))];
    self.myTabeleView.hidden = NO;
    self.myTabeleView.delegate = self;
    self.myTabeleView.dataSource = self;
    [self.view addSubview:self.myTabeleView];
}
-(void)initData
{
    NSMutableArray *data1 =[[NSMutableArray alloc]init];
    
    GroupModel *group1 = [[GroupModel alloc]init];
    group1.myTitle = @"同事";
    group1.mySelectNum = @"0";
    
    Model *model11= [[Model alloc]init];
    model11.headImage =@"sss11";
    model11.nameStr = @"strsdasdfa";
    [data1 addObject:model11];
    Model *model12= [[Model alloc]init];
    model12.headImage =@"sss12";
    model12.nameStr = @"strsdasdfa";
    [data1 addObject:model12];
    Model *model13= [[Model alloc]init];
    model13.headImage =@"sss13";
    model13.nameStr = @"strsdasdfa";
    [data1 addObject:model13];
    Model *model14= [[Model alloc]init];
    model14.headImage =@"sss14";
    model14.nameStr = @"strsdasdfa";
    [data1 addObject:model14];
    [group1.myDataArr addObjectsFromArray:data1];
    [self.myDataArr addObject:group1];
    
    
    GroupModel *group2 = [[GroupModel alloc]init];
    group2.myTitle = @"同学";
    group2.mySelectNum = @"0";
    NSMutableArray *data2 =[[NSMutableArray alloc]init];
    Model *model21= [[Model alloc]init];
    model21.headImage =@"sss21";
    model21.nameStr = @"strsdasdfa";
    [data2 addObject:model21];
    Model *model22= [[Model alloc]init];
    model22.headImage =@"sss22";
    model22.nameStr = @"strsdasdfa";
    [data2 addObject:model22];
    Model *model23= [[Model alloc]init];
    model23.headImage =@"sss23";
    model23.nameStr = @"strsdasdfa";
    [data2 addObject:model23];
    Model *model24= [[Model alloc]init];
    model24.headImage =@"sss24";
    model24.nameStr = @"strsdasdfa";
    [data2 addObject:model24];
    [group2.myDataArr addObjectsFromArray:data2];
    [self.myDataArr addObject:group2];
}
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.myDataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GroupModel *groupModel = self.myDataArr[section];
    if (groupModel.isExpand == YES) {
        return groupModel.myDataArr.count;
    }
    else
    {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupModel *groupModel = self.myDataArr[indexPath.section];
    Model *tempModel = groupModel.myDataArr[indexPath.row];
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
  
    cell.block =^(NSInteger tag){
        if (tag == 0) {
            NSLog(@"取消选中");
            NSInteger tempTag = [groupModel.mySelectNum integerValue];
            tempModel.isSelect = tag;
            groupModel.mySelectNum = [NSString stringWithFormat:@"%ld",tempTag-1];
            for (int i=0; i<self.mySelectDataArr.count; i++) {
                Model *tempModel1 = [self.mySelectDataArr objectAtIndex:i];
                if ([tempModel.headImage isEqualToString:tempModel1.headImage]) {
                    [self.mySelectDataArr removeObject:tempModel1];
                }
            }
        }
        if (tag == 1) {
            NSLog(@"选中");
            NSInteger tempTag = [groupModel.mySelectNum integerValue];
            tempModel.isSelect = tag;
            groupModel.mySelectNum = [NSString stringWithFormat:@"%ld",tempTag+1];
            [self.mySelectDataArr addObject:tempModel];
        }
        
        [self.myTabeleView reloadData];
        [self.mySomeHeadVIew upDateSelectNum:[NSString stringWithFormat:@"%ld",self.mySelectDataArr.count]];
    };
    [cell upDataWithHead:tempModel.headImage andWithFriendName:tempModel.headImage andIsselected:tempModel.isSelect];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderView *view = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    view.backgroundColor= [UIColor whiteColor];
    GroupModel *groupModel = [self.myDataArr objectAtIndex:section];
    [view upDateSelectNum:groupModel.mySelectNum andWithGroupName:groupModel.myTitle];
    view .myTapAction = ^(NSInteger tag)
    {
        groupModel.isExpand = !groupModel.isExpand;
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"关闭或打开分组");
    };
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
