//
//  add_addressViewController.m
//  田字一号
//
//  Created by 张海禄 on 16/4/25.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "add_addressViewController.h"
#import "UIView+SDAutoLayout.h"
#import "addressModel.h"

#define labelheight  30

@interface add_addressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView *tableview;
    BOOL step1,step2,step3;
    NSString *provincestr;
    NSString *citystr;
    NSString *districtstr;
    NSMutableArray *AddressArray;
}

@property (nonatomic, strong)NSDictionary *dict;//省-市-区
@property (nonatomic, strong)NSArray *provinces;//省
@property (nonatomic, strong)NSArray *citys;//市
@property (nonatomic, strong)NSArray *districts;//区

@end

@implementation add_addressViewController



//数组中大小排序
- (NSArray *)compareKeys:(NSArray *)keys {
    NSArray *array = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *a = (NSString *)obj1;
        NSString *b = (NSString *)obj2;
        int aNum = [a intValue];
        int bNum = [b intValue];
        
        if (aNum > bNum) {
            return NSOrderedDescending;
        }
        else if (aNum < bNum){
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];
    return array;
    
}
//获取本地plist文件
- (NSDictionary *)dict {
    if (!_dict) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"area.plist" ofType:nil];
        _dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    
    return _dict;
}
//获得城市
- (NSArray *)getprovinces {
    if (!_provinces) {
        NSMutableArray *arr1 = [NSMutableArray array];
        NSArray *keys1 = [self.dict allKeys];
        NSArray *sortedKeys1 = [self compareKeys:keys1];
        for (NSString *key2 in sortedKeys1) {
            NSDictionary *dic2 = [self.dict objectForKey:key2];
            NSArray *keys2 = [dic2 allKeys];
            for (NSString *key3 in keys2) {
                [arr1 addObject:key3];
            }
        }
        _provinces = [NSArray arrayWithArray:arr1];
        
    }
    //NSLog(@"%@",_provinces);
    return _provinces;
}
//刷新市
- (void)refrshOfCitysWithProvincsKey:(NSString *)provincesKey {
    int count = 0;
    NSMutableArray *arr1 = [NSMutableArray array];
    NSArray *keys1 = [self.dict allKeys];
    for (NSString *key2 in keys1) {
        NSDictionary *dic2 = [self.dict objectForKey:key2];
        NSDictionary *dic3 = [dic2 objectForKey:provincesKey];
        if (dic3.count > 0) {
            count++;
        }
        NSArray *keys3 = [dic3 allKeys];
        NSArray *sortedKeys3 = [self compareKeys:keys3];
        for (NSString *key4 in sortedKeys3) {
            NSDictionary *dic4 = [dic3 objectForKey:key4];
            NSArray *keys4 = [dic4 allKeys];
            // NSArray *keys4 = [key4 sortedArrayUsingSelector:@selector(compare:)];
            for (NSString *key5 in keys4) {
                [arr1 addObject:key5];
            }
        }
    }
    //NSLog(@"//////%@",arr1);
    if (count > 0) {
        self.citys = [NSArray arrayWithArray:arr1];
    } else {
        self.citys = @[];
    }
    
    
}
//刷新区
- (void)refrshOfDistrictsWithProvincsKey:(NSString *)provincesKey
                                CitysKey:(NSString *)citysKey {
    
    if ([citysKey isEqualToString:@""]) {
        self.districts = @[];
        return;
    }
    int count1 = 0;
    int count2 = 0;
    NSMutableArray *arr1 = [NSMutableArray array];
    NSArray *keys1 = [self.dict allKeys];
    for (NSString *key2 in keys1) {
        NSDictionary *dic2 = [self.dict objectForKey:key2];
        NSDictionary *dic3 = [dic2 objectForKey:provincesKey];
        NSArray *keys3 = [dic3 allKeys];
        if (dic3.count > 0) {
            count1++;
        }
        for (NSString *key4 in keys3) {
            NSDictionary *dic4 = [dic3 objectForKey:key4];
            NSArray *arr5 = [dic4 objectForKey:citysKey];
            if (arr5.count > 0) {
                count2++;
            }
            for (NSString *str in arr5) {
                [arr1 addObject:str];
            }
        }
    }
    if (count1 > 0 && count2 > 0) {
        self.districts = [NSArray arrayWithArray:arr1];
    } else {
        self.districts = @[];
    }
    
}

-(void)firstinitview{
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"地区：";
    label1.font=[UIFont systemFontOfSize:13];
    label1.textAlignment=NSTextAlignmentRight;
    label1.textColor=[UIColor greenColor];
    [self.view addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"详细地址：";
    label2.font=[UIFont systemFontOfSize:13];
    label2.textAlignment=NSTextAlignmentRight;
    label2.textColor=[UIColor greenColor];
    [self.view addSubview:label2];
    
    UILabel *label3=[[UILabel alloc]init];
    label3.text=@"联系人：";
    label3.font=[UIFont systemFontOfSize:13];
    label3.textAlignment=NSTextAlignmentRight;
    label3.textColor=[UIColor greenColor];
    [self.view addSubview:label3];
    
    UILabel *label4=[[UILabel alloc]init];
    label4.text=@"联系电话：";
    label4.font=[UIFont systemFontOfSize:13];
    label4.textAlignment=NSTextAlignmentRight;
    label4.textColor=[UIColor greenColor];
    [self.view addSubview:label4];
    
    UILabel *label5=[[UILabel alloc]init];
    label5.text=@"邮编：";
    label5.font=[UIFont systemFontOfSize:13];
    label5.textAlignment=NSTextAlignmentRight;
    label5.textColor=[UIColor greenColor];
    [self.view addSubview:label5];
    
    
    
    
    self.setaddress=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.setaddress setTitle:@"请选择地区" forState:UIControlStateNormal];
    [self.setaddress  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.setaddress.layer.borderColor=[UIColor grayColor].CGColor;
    self.setaddress.layer.borderWidth=1;
    [self.setaddress addTarget:self action:@selector(setaddressClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.setaddress];
    
    
    
    UIView *view2=[[UIView alloc]init];
    view2.backgroundColor=[UIColor clearColor];
    view2.frame=CGRectMake(0, 0, 10, 10);
    self.textfield2=[[UITextField alloc]init];
    self.textfield2.layer.borderColor=[UIColor grayColor].CGColor;
    self.textfield2.layer.borderWidth=1;
    self.textfield2.leftView=view2;
    self.textfield2.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:self.textfield2];
    
    
    UIView *view3=[[UIView alloc]init];
    view3.backgroundColor=[UIColor clearColor];
    view3.frame=CGRectMake(0, 0, 10, 10);
    self.textfield3=[[UITextField alloc]init];
    self.textfield3.layer.borderColor=[UIColor grayColor].CGColor;
    self.textfield3.layer.borderWidth=1;
    self.textfield3.leftView=view3;
    self.textfield3.leftViewMode=UITextFieldViewModeAlways;
    [self.view addSubview:self.textfield3];
    
    
    
    UIView *view4=[[UIView alloc]init];
    view4.backgroundColor=[UIColor clearColor];
    view4.frame=CGRectMake(0, 0, 10, 10);
    self.textfield4=[[UITextField alloc]init];
    self.textfield4.layer.borderColor=[UIColor grayColor].CGColor;
    self.textfield4.layer.borderWidth=1;
    self.textfield4.leftView=view4;
    self.textfield4.leftViewMode=UITextFieldViewModeAlways;
    self.textfield4.delegate=self;
    [self.view addSubview:self.textfield4];
    
    
    
    UIView *view5=[[UIView alloc]init];
    view5.backgroundColor=[UIColor clearColor];
    view5.frame=CGRectMake(0, 0, 10, 10);
    self.textfield5=[[UITextField alloc]init];
    self.textfield5.layer.borderColor=[UIColor grayColor].CGColor;
    self.textfield5.layer.borderWidth=1;
    self.textfield5.leftView=view5;
    self.textfield5.leftViewMode=UITextFieldViewModeAlways;
    self.textfield5.delegate=self;
    [self.view addSubview:self.textfield5];
    
    
    
    UILabel *labelline=[[UILabel alloc]init];
    labelline.backgroundColor=[UIColor grayColor];
    [self.view addSubview:labelline];
    
    UIButton *deletebutton=[UIButton buttonWithType:UIButtonTypeSystem];
    deletebutton.backgroundColor=[UIColor redColor];
    deletebutton.layer.cornerRadius=8;
    deletebutton.layer.masksToBounds=YES;
    [deletebutton setTitle:@"删除" forState:UIControlStateNormal];
    [deletebutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deletebutton addTarget:self action:@selector(deletebuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deletebutton];
    
    
    UIButton *addbutton=[UIButton buttonWithType:UIButtonTypeSystem];
    addbutton.backgroundColor=[UIColor orangeColor];
    addbutton.layer.cornerRadius=8;
    addbutton.layer.masksToBounds=YES;
    [addbutton setTitle:@"保存" forState:UIControlStateNormal];
    [addbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addbutton addTarget:self action:@selector(addbuttonClikc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addbutton];
    
    
    //设为默认按键
    self.addresstofirst=[UIButton buttonWithType:UIButtonTypeSystem];
    [self.addresstofirst setTitle:@"设为默认" forState:UIControlStateNormal];
    [self.addresstofirst setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.addresstofirst.backgroundColor=[UIColor orangeColor];
    self.addresstofirst.layer.cornerRadius=5;
    self.addresstofirst.layer.masksToBounds=YES;
    [self.addresstofirst addTarget:self action:@selector(addresstofirstClick) forControlEvents:UIControlEventTouchUpInside];
    self.addresstofirst.hidden=YES;
    [self.view addSubview:self.addresstofirst];
    
    
    tableview=[[UITableView alloc]init];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.hidden=YES;
    
    //解决默认cell下划线偏移问题
    if ([tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableview   setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([tableview  respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [tableview  setLayoutMargins:UIEdgeInsetsZero];
    }
    
    [self.view addSubview:tableview];
    
   #pragma 控件约束
    
    
    label1.sd_layout
    .topSpaceToView(self.view,10)
    .leftSpaceToView(self.view,0)
    .heightIs(labelheight)
    .widthIs(95);
    
    self.setaddress.sd_layout
    .topEqualToView(label1)
    .leftSpaceToView(label1,0)
    .rightSpaceToView(self.view,20)
    .heightIs(labelheight);
    
    label2.sd_layout
    .topSpaceToView(label1,20)
    .leftEqualToView(label1)
    .heightIs(labelheight)
    .widthIs(95);
    
    self.textfield2.sd_layout
    .topSpaceToView(self.setaddress,20)
    .leftSpaceToView(label2,0)
    .rightEqualToView(self.setaddress)
    .heightIs(labelheight);
    
    
    label3.sd_layout
    .topSpaceToView(label2,20)
    .leftEqualToView(label1)
    .heightIs(labelheight)
    .widthIs(95);
    
    
    self.textfield3.sd_layout
    .topSpaceToView(self.textfield2,20)
    .leftSpaceToView(label3,0)
    .rightEqualToView(self.setaddress)
    .heightIs(labelheight);
    
    
    label4.sd_layout
    .topSpaceToView(label3,20)
    .leftEqualToView(label1)
    .heightIs(labelheight)
    .widthIs(95);
    
    
    self.textfield4.sd_layout
    .topSpaceToView(self.textfield3,20)
    .leftSpaceToView(label4,0)
    .rightEqualToView(self.setaddress)
    .heightIs(labelheight);
    
    label5.sd_layout
    .topSpaceToView(label4,20)
    .leftEqualToView(label1)
    .heightIs(labelheight)
    .widthIs(95);
    
    
    self.textfield5.sd_layout
    .topSpaceToView(self.textfield4,20)
    .leftSpaceToView(label5,0)
    .rightEqualToView(self.setaddress)
    .heightIs(labelheight);
    
    
    self.addresstofirst.sd_layout
    .topSpaceToView(self.textfield5,25)
    .rightEqualToView(self.textfield5)
    .heightIs(30)
    .widthIs(85);
    
    labelline.sd_layout
    .bottomSpaceToView(self.view,65)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .heightIs(1);
    
    
    deletebutton.sd_layout
    .topSpaceToView(labelline,7)
    .leftSpaceToView(self.view,20)
    .heightIs(50)
    .widthIs(80);
    
    
    addbutton.sd_layout
    .topSpaceToView(labelline,7)
    .rightSpaceToView(self.view,20)
    .heightIs(50)
    .widthIs(80);
    
    
    tableview.sd_layout
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0);

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"收货地址管理";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
   
    self.completion=NO;
    
    AddressArray=[[NSMutableArray alloc]init];
    
    self.provinces=[self getprovinces];
    
     [self firstinitview];
    
    
   
    
}

//设为默认按键
-(void)addresstofirstClick{
    
    if(self.completion&&self.textfield2.text.length>0&&self.textfield3.text.length>0&&self.textfield4.text.length>0&&self.textfield5.text.length>0){
       
        NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
        
        NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        AddressArray = [[NSMutableArray alloc]initWithArray:array];
        
        addressModel *model=[[addressModel alloc]init];
        model.address=self.setaddress.titleLabel.text;
        model.addressmore=self.textfield2.text;
        model.name=self.textfield3.text;
        model.phonenumber=self.textfield4.text;
        model.postcode=self.textfield5.text;
        
        
        for(addressModel *model1 in array){
            if([model1 isEqualToaddress:model]){
                
                [AddressArray removeObject:model1];
            }
        }
        [AddressArray insertObject:model atIndex:0];
        data = [NSKeyedArchiver archivedDataWithRootObject:AddressArray];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"address"];
        
        [self showMessage:@"已设置为默认地址"];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        [self showMessage:@"保存失败，请完善地址"];
    }
 
    
}



//地区选择按键
-(void)setaddressClick{
    step1=YES;
    step2=NO;
    step3=NO;
    [tableview reloadData];
    tableview.hidden=NO;
}

//删除按键
-(void)deletebuttonClick{
    
    
    
    if(self.completion&&self.textfield2.text.length>0&&self.textfield3.text.length>0&&self.textfield4.text.length>0&&self.textfield5.text.length>0){
         NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
         AddressArray=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        
    addressModel *model=[[addressModel alloc]init];
    model.address=self.setaddress.titleLabel.text;
    model.addressmore=self.textfield2.text;
    model.name=self.textfield3.text;
    model.phonenumber=self.textfield4.text;
    model.postcode=self.textfield5.text;
        
        NSArray *array=[NSArray arrayWithArray:AddressArray];
        for(addressModel *model1 in array){
            if([model1 isEqualToaddress:model]){
                [AddressArray removeObject:model1];
                
            }
        }
       
        
        [AddressArray removeObject:model];
        
      data = [NSKeyedArchiver archivedDataWithRootObject:AddressArray];
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"address"];
         [self.navigationController popViewControllerAnimated:YES];
        [self showMessage:@"删除成功"];
    }else{
       
        [self showMessage:@"操作失败"];

    }
    
    
    
}


//保存按键
-(void)addbuttonClikc{
    
    
    if(self.completion&&self.textfield2.text.length>0&&self.textfield3.text.length>0&&self.textfield4.text.length>0&&self.textfield5.text.length>0){
        
        BOOL success=YES;
        NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
        
        NSArray *array=[NSKeyedUnarchiver unarchiveObjectWithData:data];
            AddressArray = [[NSMutableArray alloc]initWithArray:array];
            
            addressModel *model=[[addressModel alloc]init];
            model.address=self.setaddress.titleLabel.text;
            model.addressmore=self.textfield2.text;
            model.name=self.textfield3.text;
            model.phonenumber=self.textfield4.text;
            model.postcode=self.textfield5.text;
        
        
            for(addressModel *model1 in array){
                if([model1 isEqualToaddress:model]){
                    
                   [AddressArray removeObject:model1];
                    [self showMessage:@"地址重复，该地址未被保存"];
                    success=NO;
            
                }
            }
            if(success){
             [self showMessage:@"地址保存成功"];
            }
         [AddressArray addObject:model];
        data = [NSKeyedArchiver archivedDataWithRootObject:AddressArray];
        
        
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"address"];
    
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        [self showMessage:@"保存失败，请完善地址"];
    }
    
    
}


#pragma tableview datasoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(step1){
        return self.provinces.count;
    }else if(step2){
        return self.citys.count;
    }else if(step3){
        return self.districts.count;
    }else{
        return 0;}
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 49;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"celladdaddress";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //解决默认cell下划线偏移问题
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    if(step1){
        cell.textLabel.text=self.provinces[indexPath.row];
    }else if(step2){
        cell.textLabel.text=self.citys[indexPath.row];
    }else if(step3){
        cell.textLabel.text=self.districts[indexPath.row];
    }
    
    return cell;
    
    
}

#pragma mark tableviewdelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(step1){
        provincestr=self.provinces[indexPath.row];
        step2=YES;
        step3=NO;
        step1=NO;
        [self refrshOfCitysWithProvincsKey:provincestr];
    }else if(step2){
        
        citystr=self.citys[indexPath.row];
        step1=NO;
        step2=NO;
        step3=YES;
        [self refrshOfDistrictsWithProvincsKey:provincestr CitysKey:citystr];
        
    }else if(step3){
        
        districtstr=self.districts[indexPath.row];
        NSString *string=[NSString stringWithFormat:@"%@%@%@",provincestr,citystr,districtstr];
        [self.setaddress setTitle:string forState:UIControlStateNormal];
        step1=YES;
        step2=NO;
        step3=NO;
        self.completion=YES;
        tableview.hidden=YES;
    }
    
    
    [tableview reloadData];
    
    
}

//防止键盘挡住textfield
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 64 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
    {self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);}
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.40f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];

       self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}



//按键提醒显示
-(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.alpha = 0.8f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize=[message boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 999) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} context:nil].size;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    
    showview.frame = CGRectMake(20, ([UIScreen mainScreen].bounds.size.height)/2,[UIScreen mainScreen].bounds.size.width-40, LabelSize.height+10);
    label.frame = CGRectMake((CGRectGetMaxX(showview.frame)-LabelSize.width)/2, 5, LabelSize.width, LabelSize.height);
    
    [showview addSubview:label];
    [UIView animateWithDuration:2 animations:^{showview.alpha=0.0f;}    completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view  endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
