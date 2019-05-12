CXX       = g++
CXXFLAGS  = --std=c++17 
LIBS      = -lpthread -lboost_program_options
SRCS      = $(wildcard *.cpp) 
OBJS      = $(filter %.o,$(SRCS:.cpp=.o) $(SRCS:.cc=.o))

logger: $(OBJS)
	$(CXX) -g $(OBJS) -o $@ $(LIBS)  

%.o: %.cc 
	$(CXX) $(CXXFLAGS) -c $< -O3 $@

clean:
	@rm -f *.o
	@rm -f logger

.PHONY: clean 
