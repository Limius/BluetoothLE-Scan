//
//  ViewController.h
//  BluetoothLE-Scan
//
//  Created by danny on 2014/1/21.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBCentralManagerDelegate> {
    
}


@property (nonatomic,strong) CBCentralManager *CM;

- (IBAction)buttonScan:(id)sender;
- (IBAction)buttonStop:(id)sender;



@end
