CXX       = g++
CXXFLAGS  = --std=c++17 
LIBS      = /usr/lib/libgtest.a /usr/lib/libgtest_main.a -lpthread -lboost_program_options
SRCS      = $(wildcard *.cpp) 
OBJS      = $(filter %.o,$(SRCS:.cpp=.o) $(SRCS:.cc=.o))

matrix_calc: $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LIBS)  

%.o: %.cc 
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@rm -f *.o
	@rm -f matrix_calc

#valgrind:
#	valgrind --tool=memcheck --leak-check=full --verbose ./$(v_arg) 

.PHONY: clean valgrind