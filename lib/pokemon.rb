require "sqlite3"

class Pokemon
  attr_accessor :id,:name,:type,:db,:hp

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (id,name,type) VALUES (NULL,'#{name}','#{type}');")
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = '#{id}';").flatten
    self.new({:id => new_pokemon[0], :name => new_pokemon[1], :type => new_pokemon[2], :hp => new_pokemon[3], :db => db})
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = '#{new_hp}' where id = '#{self.id}'; ")
  end

end
