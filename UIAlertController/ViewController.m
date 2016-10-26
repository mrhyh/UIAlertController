//
//  ViewController.m
//  UIAlertController
//
//  Created by tansun2 on 15/12/8.
//  Copyright © 2015年 tansun2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}
//对话框按钮点击方法，弹出对话框
- (IBAction)btn1:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是UIAlertController的默认样式\r这个是第二行\r这个是第三行" preferredStyle:UIAlertControllerStyleAlert];

      UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

//动作按钮点击方法
- (IBAction)btn2:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题"message:@"这个是UIAlertController的默认样式"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
   
}
//警示按钮点击方法，弹出警示框样式
- (IBAction)btn3:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题"message:@"这个是UIAlertController的默认样式"preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    //添加顺序和显示顺序相同
    [alertController addAction:cancelAction];
    [alertController addAction:resetAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
//文本对话框按钮点击方法，弹出文本对话框
- (IBAction)btn4:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"文本对话框" message:@"登录和密码对话框示例" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        textField.placeholder = @"登录";
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *login = alertController.textFields.firstObject;
        UITextField *password = alertController.textFields.lastObject;
        NSLog(@"%@",login.text);
        NSLog(@"%@",password.text);
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 2;
    }
}
//上拉菜单按钮点击方法，弹出上拉菜单
- (IBAction)btn5:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle: UIAlertControllerStyleActionSheet];
    
    //alertController.view.tintColor = [UIColor blueColor]; 可改变部分字体颜色
    
    // //可以改变字体大小
    //    NSMutableAttributedString *hogan = [[NSMutableAttributedString alloc] initWithString:@"Presenting the great... Hulk Hogan!"];
    //    [hogan addAttribute:NSFontAttributeName
    //                  value:[UIFont systemFontOfSize:50.0]
    //                  range:NSMakeRange(24, 11)];
    //    [alertController setValue:hogan forKey:@"attributedTitle"];

    //改变"style" 就可以改变文字的样式了，只有“UIAlertActionStyleDestructive”样式的字体颜色是红色
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        NSLog(@"点击了取消");
    }];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"点击了删除");
    }];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"点击了保存");
    }];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
