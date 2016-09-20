class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      4.times { cup << :stone } unless i == 6 || i == 13
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if (start_pos < 1) || (start_pos > 13)
  end

  def make_move(start_pos, current_player)
    render

    shift = 1
    until @cups[start_pos].empty?
      new_idx = (start_pos + shift) % 14

      if @name1 == current_player
        @cups[new_idx] << @cups[start_pos].pop unless new_idx == 13
        shift += 1
      else @name2 == current_player
        @cups[new_idx] << @cups[start_pos].pop unless new_idx == 6
        shift += 1
      end
    end

    next_turn(new_idx)
  end


  def next_turn(last_idx)
    # helper method to determine what #make_move returns
    return :prompt if last_idx == 6 || last_idx == 13
    return :switch if @cups[last_idx].count == 1
    return last_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
        @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case @cups[6] <=> cups[13]
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end
  end
end
