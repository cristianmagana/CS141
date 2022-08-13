#ifndef VECTOR_H
#define VECTOR_H
#include <iostream>
#include <string>
#include <exception>

using namespace std;

class MyException :public std::exception {};


template <typename T> // Assume Vector only takes in int or double for T
class Vector {
private:
	int sz; 	// the number of elements in this Vector
	T* buf; 	// the base of the array of Ts, you must allocate it
public:
	Vector(int n) // Vector v1(10); -- create a 10 element Vector
	{
        	sz = n;
        	buf = new T[sz];
	}
    
	Vector(initializer_list<T> L) // Vector v1{T1, T2, T3};
	{
		buf = new T[L.size()];
		sz = static_cast<int>(L.size());

		copy(L.begin(), L.end(), buf);
	}
	~Vector() // destructor called automatically when a Vector dies 
	{
		delete[] buf; 	
	}

	Vector(const Vector & v) // Vector v2(v1); deep-copy
	{
		sz = v.sz;
		buf = new T[sz];
		for (int i = 0; i < sz; i++)
			buf[i] = v.buf[i];
	}
	int size() const // v1.size() returns 10 for v1 example above
	{
		return this->sz;
	}
	T & operator [] (const int i) // T x = V[i]; 
	{
		return buf[i];
	}
        const T & operator [] ( const int i ) const {
		
		return buf[i];
	}

	T operator * (const Vector & v) const // Access out-of-bound index should throw an error to be caught in outside scope */
	{
		T dot = 0; 		 
		for (int i = 0; i < sz; i++)
			dot += buf[i] * v[i];
		return dot; 
	}

// T x = V1 * V2; dot product
// e.g. [1, 2] * [3, 4, 5] = 1 * 3 + 2 * 4 + 0 = 11
// Assume an empty Vector will cause the product to be 0.
	Vector operator + (const Vector & v) const 
// V3 = V1 + V2; [1, 2, 3] + [4, 5, 6, 7] = [5, 7, 9, 7]
	{
		if(sz != v.sz)
			throw MyException();
		Vector _add = Vector(sz);
		for (int i = 0; i < sz; i++)
			_add[i] = v[i] + buf[i];
		return _add;
	}
	const Vector & operator = (const Vector & v) // V1 = V2;
	{
		buf = v.buf;
		sz = v.sz;
		return *this; 
	}
	bool operator == (const Vector & v) const // if (V1 == V2)...
	{
			if (sz != v.sz)
			return false;
		for (int i = 0; i < sz; i++)
			if (v[i] != buf[i])
				return false;
		return true;
	}
	bool operator != (const Vector & v) const // if (V1 != V2)...
	{
		if (sz != v.sz)
			return true;
		for (int i = 0; i < sz; i++)
			if (v[i] != buf[i])
				return true;
		return false;
	}
	friend Vector operator * (const int n, const Vector & v)
	// V1 = 20 * V2; -- each element of V1 is element of V2 * 20
	{
		for (int i = 0; i < v.sz; i++)
			v[i] *= n;
		return v;
	}
	friend Vector operator + (const int n, const Vector & v)
	// V1 = 20 + V2; -- each element of V1 is element of V2 + 20
	{
		for (int i = 0; i < v.sz; i++)
			v[i] += n;
		return v;
	}
	friend ostream& operator << (ostream & o, const Vector & v)
	// cout << V2; -- prints the vector in this format 
// (v0, v1, v2, ... vn-1);
	{
		o << "(";
		for (int i = 0; i < v.sz - 1; i++)
			o << v[i] << ",";
		o << v[v.sz - 1] << ")";
		return o; 	
	}
};
#endif
