//
//  MYTestViewController.m
//  MYFM
//
//  Created by CoderXu on 2017/4/23.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYTestViewController.h"
#import "MYTest2ViewController.h"
@interface MYTestViewController ()

@end

@implementation MYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
    
    [self.navigationController pushViewController:[MYTest2ViewController new] animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
