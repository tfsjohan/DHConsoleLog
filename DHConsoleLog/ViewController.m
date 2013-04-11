#import "ViewController.h"
#import "DHConsoleLogUrlProtocol.h"

@interface ViewController () <UIWebViewDelegate>

@property(nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Register the custom UrlProtocol
    [NSURLProtocol registerClass:[DHConsoleLogUrlProtocol class]];

    // Create the web view
    _webView = [[UIWebView alloc] init];
    _webView.delegate = self;
    _webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_webView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_webView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_webView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_webView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_webView)]];


    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    // Handle your request if needed

    return YES;
}


@end