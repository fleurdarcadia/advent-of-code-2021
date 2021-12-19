class Submarine
  attr_reader :position, :depth

  def initialize
    @position = 0
    @depth = 0
  end

  def move(direction, amount)
    case direction
    when "forward"
      @position += amount
    when "down"
      @depth += amount
    when "up"
      @depth -= amount
    end
  end
end

class AimingSubmarine < Submarine
  def initialize
    super

    @aim = 0
  end

  def move(direction, amount)
    case direction
    when "forward"
      @position += amount
      @depth += @aim * amount
    when "down"
      @aim += amount
    when "up"
      @aim -= amount
    end
  end
end

class Solution
  def initialize
    @input = inputs
  end

  def part_1
    sub = Submarine.new
    @input.each { |direction, amount| sub.move(direction, amount) }
    sub.position * sub.depth
  end

  def part_2
    sub = AimingSubmarine.new
    @input.each { |direction, amount| sub.move(direction, amount) }
    sub.position * sub.depth
  end

  private

  def inputs
    File.read("../data/problem2.dat").split("\n").map do |line|
      dir, amt = line.split(" ")
      [dir, amt.to_i]
    end
  end
end
