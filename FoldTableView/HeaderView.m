//
//  HeaderView.m
//  FoldTableView
//
//  Created by clearlove on 16/6/16.
//  Copyright © 2016年 belink. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //label
        self.myGroupName = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 300, 20)];
        [self addSubview:self.myGroupName];
        self.myGroupName.textColor = [UIColor blackColor];
        self.myGroupName.font = [UIFont systemFontOfSize:12];
        self.myGroupName.hidden = YES;
        
        self.myHasSlectLable = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-200, 5, 150, 20)];
        [self addSubview:self.myHasSlectLable];
        self.myHasSlectLable.textColor = [UIColor whiteColor];
        self.myHasSlectLable.font = [UIFont systemFontOfSize:12];
        self.myHasSlectLable.hidden = YES;
        self.myHasSlectLable.textAlignment = NSTextAlignmentRight;
        
        
        self.myUpOrdownImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-30, 20, 30, 20)];
        self.myUpOrdownImage.hidden = YES;
        [self addSubview:self.myUpOrdownImage];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myTapAction:)];
        self.tag =1000;
        [self addGestureRecognizer:tap];

        
        
    }
    return self;
}

-(void)myTapAction:(UITapGestureRecognizer *)tap
{
    if (self.myTapAction != nil) {
        self.myTapAction(tap.view.tag);
    }
}

-(void)upDateSelectNum:(NSString *)SelectNum andWithGroupName:(NSString *)groupName
{
    
    self.myHasSlectLable.hidden = NO;
    self.myGroupName.hidden = NO;
    self.myUpOrdownImage.hidden = NO;
    
    self.myHasSlectLable.text = [NSString stringWithFormat:@"已选%@人",SelectNum];
    
    self.myGroupName.text = groupName;
}

-(void)upDataWithAll
{
    self.myGroupName.hidden = NO;
    self.myGroupName.text = @"所有好友";
}
-(void)upDateSelectNum:(NSString *)selectNum
{
    self.myHasSlectLable.hidden = NO;
    self.myHasSlectLable.text = [NSString stringWithFormat:@"已选%@人",selectNum];
}
-(void)upDataSelectedStatic:(BOOL) isSelected
{
    self.mySelectBtn.selected = isSelected;
}
@end
