CXX       = g++
CXXFLAGS  = --std=c++14 
LIBS      = /usr/lib/libgtest.a /usr/lib/libgtest_main.a -lpthread
SRCS      = $(wildcard *.cpp) 
OBJS      = $(filter %.o,$(SRCS:.cpp=.o) $(SRCS:.cc=.o))

det_calc: $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LIBS)  

%.o: %.cc 
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@rm -f *.o
	@rm -f det_calc

.PHONY: clean 