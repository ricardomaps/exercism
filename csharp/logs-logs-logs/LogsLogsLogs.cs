using System;

// TODO: define the 'LogLevel' enum
enum LogLevel
{
    Unknown = 0,
    Trace = 1,
    Debug = 2,
    Info = 4,
    Warning = 5,
    Error = 6,
    Fatal = 42,
}

static class LogLine
{
    public static LogLevel ParseLogLevel(string logLine) =>
        logLine.Substring(1, 3) switch
        {
            "INF" => LogLevel.Info,
            "DBG" => LogLevel.Debug,
            "TRC" => LogLevel.Trace,
            "WRN" => LogLevel.Warning,
            "ERR" => LogLevel.Error,
            "FTL" => LogLevel.Fatal,
            _ => LogLevel.Unknown,
        };

    public static string OutputForShortLog(LogLevel logLevel, string message) => $"{(int) logLevel}:{message}";
}
