pragma solidity ^0.4.15;

/**
 * @title Queue
 * @dev Data structure contract used in `Crowdsale.sol`
 * Allows buyers to line up on a first-in-first-out basis
 * See this example: http://interactivepython.org/courselib/static/pythonds/BasicDS/ImplementingaQueueinPython.html
 */

contract Queue {
	/* State variables */
	uint8 size = 5;
	// YOUR CODE HERE
	address[] data;
	uint8 front;
	uint8 back;

	/* Add events */
	// YOUR CODE HERE

	/* Add constructor */
	// YOUR CODE HERE
	function Queue(uint8 s) public {
		size = s;
		front = 0;
		back = 0;
		for (uint8 i = 0; i < size; i++) {
			data[i] = address(0);
		}
	}

	/* Returns the number of people waiting in line */
	function qsize() constant returns(uint8) {
		// YOUR CODE HERE
		return back - front;
	}

	/* Returns whether the queue is empty or not */
	function empty() constant returns(bool) {
		// YOUR CODE HERE
		return front == back;
	}
	
	/* Returns the address of the person in the front of the queue */
	function getFirst() constant returns(address) {
		// YOUR CODE HERE
		return data[front];
	}
	
	/* Allows `msg.sender` to check their position in the queue */
	function checkPlace() constant returns(uint8) {
		// YOUR CODE HERE
		return data.indexOf(msg.sender);
	}
	
	/* Allows anyone to expel the first person in line if their time
	 * limit is up
	 */
	function checkTime() {
		// YOUR CODE HERE
		dequeue();
	}
	
	/* Removes the first person in line; either when their time is up or when
	 * they are done with their purchase
	 */
	function dequeue() {
		// YOUR CODE HERE
		if (front == size) {
			front = 0;
		}
		data[front] = address(0);
		front ++;
	}

	/* Places `addr` in the first empty position in the queue */
	function enqueue(address addr) {
		// YOUR CODE HERE
		for (uint8 i = front; i < size; i++) {
			if (data[i] == address(0)) {
				data[i] = addr;
				return;
			}
		}

		for (uint8 i = 0; i < front; i++) {
			if (data[i] == address(0)) {
				data[i] = addr;
				return;
			}
		}
		assert 1 == 0;
	}
}
