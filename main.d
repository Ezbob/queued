
import std.stdio;
import queue;

void main()
in {
	writeln("test started");
}
out {
	writeln("test complete");
}
body {

	Queue!int q;

	int[5] array = [ -2, 24, 12, 10, 50 ];

	foreach ( element; array ) {
		q.offer(element);
	}

	assert ( array.length == q.length );

	foreach ( element; array ) {
		auto poll = q.poll; 
		assert( poll == element );
		writeln(poll);
	}

	assert( q.peek.isNull );

	q.offer(42);

	assert( !q.peek.isNull && q.peek.get() == 42 );

}