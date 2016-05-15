/**
 * Copyright © 2016, ogromny
 */

module dooz;

private import std.experimental.logger;
private import std.stdio: stdout;
private import std.concurrency: Tid;
private import std.datetime: SysTime;

class Dooz: FileLogger
{
	public:
		this (bool background_mode)
		{
			setClrMap (background_mode);
			super (stdout, LogLevel.all);
		}

	private:
		string[LogLevel] clrMap;

		override protected void
		beginLogMsg (string file, int line, string funcName, string prettyFuncName, string moduleName, LogLevel logLevel, Tid threadId, SysTime timestamp, Logger logger)
		{
			this.file.lockingTextWriter.put (clrMap [logLevel]);
			super.beginLogMsg (file, line, funcName, prettyFuncName, moduleName, logLevel, threadId, timestamp, logger);
		}

		override protected void
		finishLogMsg ()
		{
			this.file.lockingTextWriter.put ("\033[0m\n");
			file.flush ();
		}

		void
		setClrMap (bool background_mode)
		{
			if (background_mode)
			{
				clrMap[LogLevel.trace]    = "\033[106;37m";
				clrMap[LogLevel.info]     = "\033[44;37m";
				clrMap[LogLevel.warning]  = "\033[103;37m";
				clrMap[LogLevel.error]    = "\033[101;37m";
				clrMap[LogLevel.critical] = "\033[105;37m";
				clrMap[LogLevel.fatal]    = "\033[107;91m";
			}
			else
			{
				clrMap[LogLevel.trace]    = "\033[96m";
				clrMap[LogLevel.info]     = "\033[34m";
				clrMap[LogLevel.warning]  = "\033[93m";
				clrMap[LogLevel.error]    = "\033[91m";
				clrMap[LogLevel.critical] = "\033[95m";
				clrMap[LogLevel.fatal]    = "\033[97m";

			}
		}
}
