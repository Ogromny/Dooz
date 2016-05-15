# Dooz
> A simple colored logger for D, with 2 modes !

## Screenshot
Background_mode = true:
![IMG](https://i.imgur.com/hcdHPV1.png)
Background_mode = false;
![IMG](https://i.imgur.com/UbMNiM6.png)

## Utilisation
```d
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
```
