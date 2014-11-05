CXX=g++
CXXFLAGS=-g -fPIC -DPIC -I/usr/include/python3.4m

OBJ=mm_wrap.o

all: _mm.so

.SECONDARY: mm_wrap.cxx

_mm.so: $(OBJ)
	$(CXX) -g -shared -Wl,-soname,_mm.so -o $@ $^ $(LIB)

clean:
	rm -f $(OBJ) _mm.so

%_wrap.cxx: %.i
	swig -c++ -python -py3 $<

%.o: %.cxx
	$(CXX) -c $(CXXFLAGS) $<
