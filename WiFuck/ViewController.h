//
//  ViewController.h
//  WiFuck
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    int isAnalyzing;
    NSMutableString* logString;
}

@property (strong, nonatomic) IBOutlet UITextField *ssidText;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property(atomic, strong) NSMutableArray *resultArray;

- (IBAction)analyzePressed:(id)sender;
- (void)logText:(NSString*)text;
- (void)logTextFromBackground:(NSString*)text;
- (void)isStopRequested:(NSMutableArray *)parameterArray;

- (void)networkSelected:(NSString *)string;
@end
