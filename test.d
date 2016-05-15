import dooz;

void
main ()
{
	Dooz logger = new Dooz (true); // set background_mode on
	logger.trace    ("trace");
	logger.info     ("info");
	logger.warning  ("warning");
	logger.error    ("error");
	logger.critical ("critical");
	logger.fatal    ("fatal");
}
