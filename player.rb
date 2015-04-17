class Player
attr_accessor :hashListPlayer
  def initialize  #método construtor
      @hashListPlayer = Hash.new # Inicializa o atributo hashListPlayer
  end
  #Monta a lista de jogadores
  def mountListPlayer(fragmentedFile)
  if fragmentedFile.length < 3 || fragmentedFile.length < 5
  else
	fragmentedFile.each do |frag|
	  if frag[2] == "Kill" and frag[4] != "<world>"
	    hashListPlayer = {frag[4] => 0}
      end
	  hashListPlayer.uniq!
	end#End fragmentedFile
  end
  end
  #Acrescenta frag ao player
  def mountListRank(fragmentedFile)
    i=0
	fragmentedFile.each do |frag|
      if frag[5] == hashListPlayer[i]
		hashListPlayer[:frag[5]] += 1
	  elsif frag[5] == "<world>"
	    hashListPlayer[:frag[5]] -= 1
	  i+=1
      end#end IF
    end#fragmentedFile
  end#End def mountListRank
end
n=0
player = Player.new
my_array = IO.readlines('gametest.log')
str = my_array[n]
a = str.scan(/\w+/i)
my_array.each do |ar|
  a.each do |a1|
    if a != "ShutdownGame"
	 player.mountListPlayer("#{a1}")
	else
     player.mountListRank(a1)
    end	 
  end#do a
  n=n+1
  str = my_array[n]
  a = str.scan(/\w+/i)
end
  