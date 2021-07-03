CFLG=-g -O3 -std=c++11
LIBS=
SFLG=
GLIB=

CLEAN=rm -f run sim vis *.o; $(MAKE) -C NN/ clean


headless:run sim

all:headless vis

sim:sim.cpp game.o engine.o agent.o NN/neuralnet.o
	g++ $(CFLG) $^ -o $@ $(LIBS)

vis:vis.cpp game.o
	g++ $(CFLG) $(SFLG) $^ -o $@ $(GLIB) $(LIBS)

game.o:game.cpp game.h engine.h agent.h
	g++ $(CFLG) $< -o $@

agent.o:agent.cpp agent.h NN/neuralnet.h
	g++ $(CFLG) $< -o $@

engine.o:engine.cpp engine.h
	g++ $(CFLG) $< -o $@

NN/neuralnet.o:NN/neuralnet.h
	$(MAKE) -C NN/ neuralnet.o

clean:
	$(CLEAN)
