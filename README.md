DHConsoleLog
============

Bridge to allow console.log/warn/error calls from a UIWebView and log it in XCodes console

## Register NSURLProtocol

    [NSURLProtocol registerClass:[DHConsoleLogUrlProtocol class]];

## Include JavaScript file

Include the javascript in your html page as early as possible

    <script src="DHObjcConsoleLog.js"></script>

Use console.log as usual.
