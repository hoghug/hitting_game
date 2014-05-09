class HittingGame
  attr_reader :spaces, :pitch_location, :swing_location, :rows, :cols

  def initialize
    @spaces = Array(0...(9))
    @rows = [[0,1,2],[3,4,5],[6,7,8]]
    @cols = [[0,3,6],[1,4,7],[2,5,8]]
  end

  def make_pitch
    @pitch_location = @spaces.sample
  end


  def make_swing(input)
    @swing_location = input
  end

  def hit_or_miss

  end


end
