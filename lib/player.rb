require 'pry'

class Player
  attr_accessor :name, :life_points #accès à une variable d'instance en lecture ET en écriture
  @@all_players = [] # on initialise la variable de classe Player dans un tableau vide

  def initialize(name) #on définit un initialize
    @name = name # nom du player // string
    @life_points = 10 #Points de vie debut de la partie // integer
    @@all_players << self #les joueurs sont stockés dans une array joueurs
  end

  def show_state #afficher l'etat du player
    puts "Le joueur #{name} a #{@life_points} points de vie !"
  end

  def gets_damage(damage_received) #baisse du niveau de vie du joueur(dommage reçu)
    @life_points = @life_points - damage_received #les dommages reçus

    if @life_points <=0 #si les points sont inferieurs ou égale à 0 alors tu puts :
      puts "Le joueur #{name} a été tué Mouhahahha"
    else # sinon tu montres l'état du joueur
      return show_state
    end

  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}" #récuperation des joueurs du tableaux
     number = compute_damage
    puts "Il lui inflige #{number} points de dommages"
    player.gets_damage(number)
  end

  def compute_damage #calcul aléatoire de l'attaque
     return rand(1..6)
  end

end


class HumanPlayer < Player #la classe HumanPlayer(fille) hérite de la classe Player(mère), les autres methodes se transmettent aussi
  attr_accessor :weapon_level #je rajoute weapon_level(lecture&ecriture) car le reste est dans l'héritage de la mère

  def initialize(name) #on définit un initialize
    super(name) #permet de dire "execute le même code que cette methode de la classe mere"
    @life_points = 100 #on redéfini les Points de vie debut de la partie // integer
    @weapon_level = 1 #Integer qui definit le niveau de l'arme du HumanPlayer
  end

  def show_state #afficher l'etat du player
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}!" #ne pas oublier de rajourter HumanPlayer dans le app pour le test
  end

  def compute_damage
      rand(1..6) * @weapon_level
  end

  def search_weapon
      new_weapon = rand(1..6) #niveau de la nouvelle arme compris entre 1 et 6
      puts "Tu as trouvé une arme de niveau #{new_weapon}"

      if new_weapon > @weapon_level # si la nouvelle arme est superieur à l'arme actuelle alors
         new_weapon = @weapon_level #
        puts " Gardes la !!!!!!!"
      else puts "L'arme trouvée est naze... sorry bro"
      end
  end

  def search_health_pack
      health_pack = rand(1..6)
      if health_pack == 1 # méthode if pour definir les conditions pour les packs de points de vie en fonction du rand

      elsif health_pack > 1 && health_pack < 6
      if @life_points >=50 # si le niveau de vie est déjà supérieur ou égal à 50, charger les 100 points
          @life_points = 100
      else
        @life_points = @life_points + 50 # sinon, + 50 points au life points
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"

    elsif health_pack == 6
      if @life_points >=20 # si la vie est déjà supérieur ou égal à 20, + 100 points
          @life_points = 100
      else
      @life_points = @life_points + 80 # sinon, + 80 points au niveau de vie actuel
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end

end


end
#binding.pry
