MAIN_SOURCES=$(shell echo src/examples/construction/*.adb src/examples/mining/*.adb src/examples/movement/*.adb | xargs -n 1 basename | tr '\n' ,)

all:
	alr build -- -Xexecutables=$(MAIN_SOURCES)
