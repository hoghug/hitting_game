require './lib/hitting_game'


def start_game
  puts "Welcome to Baseball"
  new_pitch
end

def new_pitch
  hg = HittingGame.new
  puts "Guess a grid space..."
  hg.spaces.each do |space|
    print " #{space} "
    if space % 3 == 2
      print "\n"
    end
  end
  $pitch_loc = hg.make_pitch
  $swing_loc = hg.make_swing(gets.chomp.to_i)
  if $pitch_loc == $swing_loc
    puts "Homerun!"
  elsif check_rows(hg, $pitch_loc, $swing_loc)
    puts "Contact! (same row)"
  elsif check_cols(hg, $pitch_loc, $swing_loc)
    puts "Contact! (same col)"
  else
    puts "Miss!"
  end
  puts "Try again"
  gets.chomp
  system("clear")
  new_pitch
end

def check_rows(hg, pitch_loc, swing_loc)
  hg.rows.each do |row|
    if row.include?(pitch_loc) && row.include?(swing_loc)
      return true
    end
  end
  return false
end

def check_cols(hg, pitch_loc, swing_loc)
  hg.cols.each do |col|
    if col.include?(pitch_loc) && col.include?(swing_loc)
      return true
    end
  end
  return false
end

start_game
