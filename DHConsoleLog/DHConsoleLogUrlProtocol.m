#import "DHConsoleLogUrlProtocol.h"

@implementation DHConsoleLogUrlProtocol {

}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSURL *theUrl = [request URL];

    if ([[theUrl path] isEqualToString:@"/!web_log"]) {
        NSString *cmd = [request valueForHTTPHeaderField:@"X-WebView-Command"];

        if ([cmd isEqualToString:@"log"]) {
            NSString *data = [request valueForHTTPHeaderField:@"X-WebView-Data"];

            id json = [NSJSONSerialization JSONObjectWithData:[data dataUsingEncoding:NSUTF8StringEncoding]
                                                      options:NSJSONReadingMutableContainers
                                                        error:nil];
            NSLog(@"UIWebView Log: %@", json);

            return NO;
        }
    }

    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

@end