def printboard
  board = 
	    [ "  a ", " b ", " c ", " d ", " e ", " f ", " g ", " h ", "\n",
	     "8",@a8[:piece],@b8[:piece],@c8[:piece],@d8[:piece],@e8[:piece],@f8[:piece],@g8[:piece],@h8[:piece], "\n",
	     "7",@a7[:piece],@b7[:piece],@c7[:piece],@d7[:piece],@e7[:piece],@f7[:piece],@g7[:piece],@h7[:piece], "\n",
	     "6",@a6[:piece],@b6[:piece],@c6[:piece],@d6[:piece],@e6[:piece],@f6[:piece],@g6[:piece],@h6[:piece], "\n",
	     "5",@a5[:piece],@b5[:piece],@c5[:piece],@d5[:piece],@e5[:piece],@f5[:piece],@g5[:piece],@h5[:piece], "\n",
	     "4",@a4[:piece],@b4[:piece],@c4[:piece],@d4[:piece],@e4[:piece],@f4[:piece],@g4[:piece],@h4[:piece], "\n",
	     "3",@a3[:piece],@b3[:piece],@c3[:piece],@d3[:piece],@e3[:piece],@f3[:piece],@g3[:piece],@h3[:piece], "\n",
	     "2",@a2[:piece],@b2[:piece],@c2[:piece],@d2[:piece],@e2[:piece],@f2[:piece],@g2[:piece],@h2[:piece], "\n",
	     "1",@a1[:piece],@b1[:piece],@c1[:piece],@d1[:piece],@e1[:piece],@f1[:piece],@g1[:piece],@h1[:piece], "\n"]
  board.map { |x| 
    if x == "\n" || x =~ /[\d]/ || x =~ /.[a-h]/ || x =~ /..[a-h]/
	  print x
	  else 
	  print "[" + x + "]"
	  end
	  }
    "\n"
end