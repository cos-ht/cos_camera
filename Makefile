CXX=g++
CFLAGS+=`pkg-config --cflags opencv`
LDFLAGS+=`pkg-config --libs opencv`
SOURCES=xiSample.cpp
OBJECTS=$(SOURCES:.cpp=.o)
PROGRAM=xiSample

all: $(PROGRAM)

$(PROGRAM): $(OBJECTS)
	$(CXX) -g  -fopenmp $(OBJECTS) -O3 -o $@ -lm3api $(LDFLAGS)

.cpp.o: $(patsubst %.cpp,%.o,$(wildcard *.cpp))
	$(CXX) -g  -c -O3 $(CFLAGS)  $< -o $@

clean:
	rm -f $(PROGRAM) $(OBJECTS)

install:
	cp $(PROGRAM) ../../bin
