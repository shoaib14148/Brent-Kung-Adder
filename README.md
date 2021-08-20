# Brent-Kung-Adder
design of 32-bit Brent Kung Adder
Introduction
Truth table for addition of 3-bits is given in the following table
A	B	C_{in}	Sum	C_{out}
0	0	0	0	0
0	0	1	1	0
0	1	0	1	0
0	1	1	0	1
1	0	0	1	0
1	0	1	0	1
1	1	0	0	1
1	1	1	1	1

The equations for Sum and C_{out} are
Sum\ =\ A\ \oplus\ B\ \oplus\ C
C_{out}\ =\ AB\ +\ BC\ +\ CA
	The worst case of ripple carry adder is linear in number of bits to be added
	Carry propagation is the critical path for a multi-bit adder
	To speed up the adder, an architecture is used where logic term are classified as those dependent on carry and those independent of carry bit

