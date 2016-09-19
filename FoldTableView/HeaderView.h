//
//  HeaderView.h
//  FoldTableView
//
//  Created by clearlove on 16/6/16.
//  Copyright © 2016年 belink. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyTapAction)(NSInteger tag);
@interface HeaderView : UIView

@property(nonatomic,strong)MyTapAction myTapAction;
@property(nonatomic,strong)UIButton *mySelectBtn;
@property(nonatomic,strong)UILabel *myGroupName;
@property(nonatomic,strong)UILabel *myHasSlectLable;
@property(nonatomic,strong)UIImageView *myUpOrdownImage;
@property(nonatomic,assign)BOOL isOpen;

-(void)upDataWithAll;
-(void)upDateSelectNum:(NSString *)SelectNum andWithGroupName:(NSString *)groupName;
-(void)upDateSelectNum:(NSString *)selectNum;
-(void)upDataSelectedStatic:(BOOL) isSelected;

@end
