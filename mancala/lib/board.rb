class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        @cups[i] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 14
      raise ArgumentError.new ("Invalid starting cup")
    elsif start_pos == 0
      raise ArgumentError.new ("Starting cup is empty")
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].count
    @cups[start_pos] = []
    pos = start_pos
    if current_player_name == @name1
      opposing_cup = 13
    else
      opposing_cup = 6
    end
    while stones > 0 do
      pos = (pos + 1) % 14
      # If pos is not the opposing player's cup
      if pos != opposing_cup
        @cups[pos] << :stone
        stones -= 1
      end
    end
    self.render
    return self.next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 13 || ending_cup_idx == 6
      return :prompt
    elsif @cups[ending_cup_idx].count == 1 
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_1 = @cups[0..5]
    side_2 = @cups[7..12]
    side_1.all? { |cup| cup == [] } || side_2.all? { |cup| cup == [] }
  end

  def winner
    player_2 = @cups[13].count
    player_1 = @cups[6].count
    if player_1 == player_2
      return :draw
    elsif player_1 > player_2
      return @name1
    else
      return @name2
    end
  end
end
