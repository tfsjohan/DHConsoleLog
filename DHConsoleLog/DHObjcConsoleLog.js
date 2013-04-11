;
(function () {
    function log() {
        var args = Array.prototype.slice.call(arguments);

        var data = JSON.stringify(args);
        var cmd = "log";

        var xhr = new XMLHttpRequest();
        xhr.open('HEAD', '/!web_log?r=' + new Date().valueOf(), true);
        xhr.setRequestHeader('X-WebView-Command', cmd);
        xhr.setRequestHeader('X-WebView-Data', data);
        xhr.send(null);

        return data;
    }

    window.console = {
        log: log,
        warn: log,
        error: log
    };
})();

