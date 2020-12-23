class Stack
    def initialize
      # create ivar to store stack here!
      @ivar = []
    end

    def push(el)
      # adds an element to the stack
      @ivar << el
    end

    def pop
      # removes one element from the stack
      popped = @ivar[-1]
      @ivar.delete_at(-1)
      popped
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar[-1]
    end
  end