#!make -f

CXX=clang++-9 
CXXFLAGS=-std=c++2a

run: test
	./$^

test: TestRunner.o Test1.o Test2.o FamilyTree.o
	$(CXX) $(CXXFLAGS) $^ -o test

%.o: %.cpp FamilyTree.hpp
	$(CXX) $(CXXFLAGS) --compile $< -o $@

clean:
	rm -f *.o test
