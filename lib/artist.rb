class Artist
  @@artists = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @genre = attributes.fetch(:genre)
    @time = attributes.fetch(:time)
    @@total_rows += 1
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.all()
    @@artists.values()
  end

  def self.search(input)
    @search_array = []
    @@artists.each_value do |value|
      if value.name.match?(input)
        @search_array.push(value)
      elsif value.time.match?(input)
        @search_array.push(value)
      elsif value.genre.match?(input)
        @search_array.push(value)
      end
    end
    return @search_array
  end

  def self.clear
    @@artists = {}
    @@total_rows = 0
  end

  def self.find(id)
  @@artists[id]
  end

def update(name, time, genre)
  self.name = name
  self.time = time
  self.genre = genre
  @@artists[self.id] = Album.new(self.name, self.id, self.time, self.genre)
end

def delete
  @@artists.delete(self.id)
end

def stages
  Stage.find_by_album(self.id)
end

end
