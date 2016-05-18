class TowerOfHanoi
  attr_reader :towers, :height
  def initialize(height = 3)
    @height = height
    @towers = [ [], [], [] ]
    (1..height).each do |disc|
      @towers[0] << disc
    end
    @towers[0] = @towers[0].reverse
  end

  def play
    until won?
      render
      puts "What tower do you want to take a disk from?"
      initial_tower = gets.chomp.to_i
      puts "What tower do you want to place a disk?"
      target_tower = gets.chomp.to_i
      if valid_move?(initial_tower, target_tower)
        move(initial_tower, target_tower)
      else 
        puts "invalid move"
      end  
      puts "You won!" if won?
    end
  end

  def render
    p towers
  end
  
  def move(initial_tower, target_tower)
    disk = towers[initial_tower].pop
    towers[target_tower].push(disk)
  end

  def valid_move?(initial_tower, target_tower)
    if towers[initial_tower].empty? == false && towers[target_tower].empty? == true
      return true
    elsif towers[initial_tower].empty? == false && towers[initial_tower].last < towers[target_tower].last
      return true
    else
      return false
    end
  end

  def won?
    if towers[1].count == height || towers[2].count == height
      return true
    else 
      return false
    end
  end
end

TowerOfHanoi.new.play
