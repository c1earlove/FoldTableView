//
//  Cell.h
//  FoldTableView
//
//  Created by clearlove on 16/6/15.
//  Copyright © 2016年 belink. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MyTapAction)(NSInteger tag);

@interface Cell : UITableViewCell

@property (nonatomic,copy) MyTapAction block;
@property(nonatomic,strong)UIButton *mySelectbnt;
@property(nonatomic,strong)UIImageView *selectImageView;
@property(nonatomic,strong)UILabel *myfriendName;

-(void)upDataWithHead:(NSString *)headImage andWithFriendName:(NSString *)friendName andIsselected:(BOOL) isSelect;
//点击更新button的选中与否
-(void)updateWithSelectSatic;

@end
