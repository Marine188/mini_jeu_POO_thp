require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = HumanPlayer.new("Jean-François") #Josianne le prenom est stocké dans la variable -- changer Player par HumanPlayer pour tester la classe HumanPlayer
player2 = HumanPlayer.new("João") #José

#______________________ POUR LA CLASSE PLAYER
# while player1.life_points > 0 && player2.life_points > 0 #tant que les vies des players 1 et 2 est superieur à 0 fait la boucle
#
#   puts "Voici l'état de chaque joueur :" #pour afficher les puts suivants mettre en #binding.pry
#    player1.show_state
#    player2.show_state
#
#     puts #saut de ligne
#     puts "Passons à la phase d'attaque :"
#      player1.attacks(player2) #le joueur 1 attaque le joueur deux
#      if player2.life_points <= 0 # si le joueur 2 n'a plus de point de vie il meurt et la phrase de gets_damage sort
#        break # suite : grace a la boucle WHILE break
#      end
#      player2.attacks(player1)
#   puts
#   puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
#   puts
#
#   end
#__________________________________________________________fin de la classe Player

binding.pry
