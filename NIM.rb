$player = true
def PlayerSwitch
  $player = !$player
end

def Init
  $sticks = []
  3.times {$sticks.append(rand(1...10))}
  print "What is the name of the First Player?: "
  $p1 = gets().chomp
  print "And player 2?: "
  $p2 = gets().chomp
  Display()
  MovePart1()
end

def Display
  x = 1
  $sticks.each do |i|
    print "Pile ", x ,": ", i, "\n"
    x += 1
  end
  MovePart1()
end

def MovePart1
  pile = 0
  until pile.between?(1,3)
     print "What PIle do you want to choose ", $player == true ? ($p1) : ($p2), ": "
     pile = gets().to_i
  end
  choice = 0
  until choice.between?(1,$sticks[pile - 1])
    print "How many do you want to take out, ", $player == true ? ($p1) : ($p2), ": "
    choice = gets().to_i
  end
  $sticks[pile - 1] = $sticks[pile - 1] - choice
  if $sticks.sum() == 0
    End()
  end
  PlayerSwitch()
  Display()
end

def End()
  if $player == true
    print $p1, " Wins! \n"
  else
    print $p2, " Wins! \n"
  end
  abort "INTENTIONAL GAME DESIGN"
end


puts "The objective of the game is to take the last stick out of the pile."
puts "You may take as many sticks out as you want, but only one pile at a time"
puts
Init()
