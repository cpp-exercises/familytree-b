#!make -f

CPP=clang++-9 -std=c++2a

run: test
	./$^

test: TestRunner.o Test1.o Test2.o FamilyTree.o
	$(CPP) $^ -o test

%.o: %.cpp FamilyTree.hpp
	$(CPP) --compile $< -o $@

clean:
	rm -f *.o test
