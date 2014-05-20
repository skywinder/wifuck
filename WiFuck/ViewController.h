//
//  ViewController.h
//  WiFuck
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int isAnalyzing;
    NSMutableArray* resultArray;
    NSMutableString* logString;
}

@property (retain, nonatomic) IBOutlet UITextField *ssidText;
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UIButton *button;

- (IBAction)analyzePressed:(id)sender;
- (void)logText:(NSString*)text;
- (void)logTextFromBackground:(NSString*)text;
- (void)isStopRequested:(NSMutableArray *)parameterArray;

@end
