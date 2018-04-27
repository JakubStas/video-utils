# Project directory setup

## Script setup

To use this script in a convenient way, I suggest creating an alias and using it that way.

```bash
alias videoProjectSetup="bash /path/to/script/project_setup.sh"
```

## How to use it?

Once the alias is set up, just use the script as follows:

```bash
videoProjectSetup -n=2018-04-21-dutch-road-trip -d=4
```

![sample directory structure][sample-directory]


```bash
videoProjectSetup -h
```

```
Script used to setup a folder structure for your everyday vlogging needs!

Usage: /Users/stasj/Documents/scripts/project_setup.sh -n=PROJECT_NAME -d=NUMBER_OF_DAYS
	-h, --help             display this help and exit
	-n, --project-name     name of the project folder (e.g. 2018-03-25-slieve_foye)
	-d, --number-of-days   number of days the shooting took (defaults to 5)
```

[sample-directory]: https://github.com/JakubStas/video-utils/raw/master/project-setup/media/sample-project-directory.png "Sample directory structure"
