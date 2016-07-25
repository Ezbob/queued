
module queue;

import std.typecons;
import std.stdio;

class NoMoreElementsException : Exception {

	this(string message) {
		super(message);
	}
}

struct Queue(T) {

private:
	T[] queue;

public:
	void offer( T element ) {
		queue.length++;
		queue = element ~ queue[0..$ - 1];
	}

	T poll() @property {

		if ( this.length() > 0 ) {
			T result = queue[ $ - 1 ]; 
			queue.length--;
			return result;
		}
		throw new NoMoreElementsException("No more elements in the queue");
	}

	Nullable!(T) peek() @property {

		if ( this.length() > 0 ) {
			return Nullable!( T )( queue[ $ - 1 ] );
		}

		return Nullable!T.init;
	}

	pure size_t length() @property {
		return queue.length;
	}

}