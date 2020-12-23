class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        dequeued = @queue[0]
        @queue.delete_at(0)
        dequeued
    end

    def peek
        @queue[0]
    end
end