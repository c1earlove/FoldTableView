//
//  Cell.m
//  FoldTableView
//
//  Created by clearlove on 16/6/15.
//  Copyright © 2016年 belink. All rights reserved.
//


#import "Cell.h"

@implementation Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.mySelectbnt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mySelectbnt.frame = CGRectMake(20, 12, 20, 20);
        
        [self.mySelectbnt setImage:[UIImage imageNamed:@"dry_xuanze"] forState:UIControlStateNormal];
         [self.mySelectbnt setImage:[UIImage imageNamed:@"dry_xuanzhong"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.mySelectbnt];
        self.myfriendName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mySelectbnt.frame) + 15, 0, self.contentView.frame.size.width - (CGRectGetMaxX(self.mySelectbnt.frame) + 15), self.contentView.frame.size.height)];
        [self.contentView addSubview:self.myfriendName];
        self.myfriendName.font = [UIFont systemFontOfSize:14];
        self.myfriendName.textColor = [UIColor grayColor];
        [self.mySelectbnt addTarget:self action:@selector(myButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return self;
}

- (void)myButtonClicked:(UIButton *)button{
    
    button.selected = !button.selected;
    if (self.block != nil) {
        self.block(button.selected);
    }

}
-(void)upDataWithHead:(NSString *)headImage andWithFriendName:(NSString *)friendName andIsselected:(BOOL) isSelect
{
    self.myfriendName.text = friendName;
    self.selectImageView.image = [UIImage imageNamed:headImage];
    self.mySelectbnt.selected = isSelect;
}

-(void)updateWithSelectSatic
{
    NSLog(@"更新选中");
}
@end
