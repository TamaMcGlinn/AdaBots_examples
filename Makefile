MAIN_SOURCES=$(shell echo src/*.adb src/construction/*.adb src/mining/*.adb src/movement/*.adb | xargs -n 1 basename | tr '\n' ,)

all:
	alr build -- -Xexecutables=$(MAIN_SOURCES)
