//
//  HealthAnswerDetailsViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthAnswerDetailsViewController.h"
#import "UIColor+Chat.h"
#import "HealthKnowledgeDetailsCell.h"
#import "NavigationBar.h"
#import "HealthAnswerDetailsViewController+Data.h"

@interface HealthAnswerDetailsViewController ()


@end

@implementation HealthAnswerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"问答详情"];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];

    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[HealthKnowledgeDetailsCell class] forCellReuseIdentifier:@"HealthKnowledgeDetailsCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    [self loadData];
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthKnowledgeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthKnowledgeDetailsCell"];
    cell.heaKnoDetModel = _heaKnoDetModel;
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleNone];
    return cell;
}


/**
 * UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HealthKnowledgeDetailsCell cellHeightForModel:_heaKnoDetModel];
}

/**
 *  Getter and Setter
 */
-(HealthAnswerDataViewModel *)heaAnsDatViewModel
{
    if (_heaAnsDatViewModel == nil) {
        _heaAnsDatViewModel = [[HealthAnswerDataViewModel alloc]init];
    }
    return _heaAnsDatViewModel;
}

-(void)backEvent:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
