PROBLEM_DATA = File.read("../data/problem1.dat").split("\n").map(&:to_i)

class Sonar
  attr_reader :readings

  def initialize(depth_readings)
    @readings = depth_readings
  end

  def depth_differentials
    @readings.each_cons(2).map do |closer, farther|
      closer < farther ? :increased : :decreased
    end
  end
end

class Window
  def initialize(list, width:)
    @list = list
    @window_size = width
  end

  def elements
    @list.each_cons(@window_size)
  end
end

def problem_1_part_1
  sonar = Sonar.new(PROBLEM_DATA)
  increasing = sonar.depth_differentials.filter { |d| d == :increased }
  increasing.length
end

def problem_1_part_2
  window = Window.new(PROBLEM_DATA, width: 3)
  sonar = Sonar.new(window.elements.map(&:sum))

  increasing = sonar.depth_differentials.filter { |d| d == :increased }
  increasing.length
end
