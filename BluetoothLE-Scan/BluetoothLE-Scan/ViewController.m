//
//  ViewController.m
//  BluetoothLE-Scan
//
//  Created by danny on 2014/1/21.
//  Copyright (c) 2014年 danny. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end


@implementation ViewController

@synthesize CM;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CM= [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)centralManagerDidUpdateState:(CBCentralManager*)cManager
{
    NSMutableString* nsmstring=[NSMutableString stringWithString:@"UpdateState:"];
    BOOL isWork=FALSE;
    switch (cManager.state) {
        case CBCentralManagerStateUnknown:
            [nsmstring appendString:@"Unknown\n"];
            break;
        case CBCentralManagerStateUnsupported:
            [nsmstring appendString:@"Unsupported\n"];
            break;
        case CBCentralManagerStateUnauthorized:
            [nsmstring appendString:@"Unauthorized\n"];
            break;
        case CBCentralManagerStateResetting:
            [nsmstring appendString:@"Resetting\n"];
            break;
        case CBCentralManagerStatePoweredOff:
            [nsmstring appendString:@"PoweredOff\n"];
            break;
        case CBCentralManagerStatePoweredOn:
            [nsmstring appendString:@"PoweredOn\n"];
            isWork=TRUE;
            break;
        default:
            [nsmstring appendString:@"none\n"];
            break;
    }
    NSLog(@"%@",nsmstring);
}



- (IBAction)buttonScan:(id)sender {
    
    [CM scanForPeripheralsWithServices:nil options:nil];
    NSLog(@"Scan");
    
}

- (IBAction)buttonStop:(id)sender {
    
    [CM stopScan];
    NSLog(@"stopScan");
}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {

    NSLog(@"%@\n",peripheral);
    NSLog(@"%@\n",advertisementData);
    NSLog(@"%@\n",RSSI);
}

@end
