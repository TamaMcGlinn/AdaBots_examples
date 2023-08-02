MAIN_SOURCES=$(shell echo src/*.adb src/construction/*.adb src/api/*.adb src/small/*.adb | xargs -n 1 basename | tr '\n' ,)

all:
	alr build -- -Xexecutables=$(MAIN_SOURCES)

.DEFAULT:
	./build "$@"
