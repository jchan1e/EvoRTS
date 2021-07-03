CFLAG=
SFLAG=
LFLAG=

CLEAN=rm -rf run sim vis *.o; $(MAKE) -C NN/ clean


headless:run sim

all:headless vis

sim:
