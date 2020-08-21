require 'bundler'

Bundler.require

class Larves
  def initialize
    # Recuperation des APIs en utilisant le filtre REST
    @url = HTTParty.get('https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Larves')
  end

  # Ecriture dans un fichier JSON
  def saveJSON
    File.open("./db/larves.json", 'w') do |file|
      file.write(@url)
    end
    puts "Ecriture effectuer avec success!"
  end
end

class Monstres_des_cavernes
  def initialize
    @url = HTTParty.get('https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Monstres des cavernes')
  end

  def saveJSON1
    File.open("./db/Monstres_des_cavernes.json", 'w') do |file|
      file.write(@url)
    end
    puts "Ecriture effectuer avec success!"
  end
end

class Monstres_des_plaines
  def initialize
    @url = HTTParty.get('https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Monstres des Plaines herbeuses')
  end

  def saveJSON2
    File.open("./db/Monstres_des_plaines_herbeuses.json", 'w') do |file|
      file.write(@url)
    end
    puts "Ecriture effectuer avec success!"
  end
end

class Lancement
	def lancement
		# Execution du class Larves
		larves = Larves.new
		larves.saveJSON

		# Execution du class Monstres_des_cavernes
		monstres1 = Monstres_des_cavernes.new
		monstres1.saveJSON1

		# Execution du class Monstres_des_plaines
		monstre2 = Monstres_des_plaines.new
		monstre2.saveJSON2
	end
end
