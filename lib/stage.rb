class Stage
  attr_reader :id
  attr_accessor :name, :genre, :location

  @@stages = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @genre = attributes.fetch(:genre)
    @location = attributes.fetch(:location)
    @id = id || @@total_rows += 1
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def save
    @@stages[self.id] = self
  end

  def self.all()
    @@stages.values()
  end

  def self.search(input)
    @search_array = []
    @@stages.each_value do |value|
      if value.name.match?(input)
        @search_array.push(value)
      elsif value.location.match?(input)
        @search_array.push(value)
      elsif value.genre.match?(input)
        @search_array.push(value)
      end
    end
    return @search_array
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
  @@stages[id]
  end

def update(name, location, genre)
  # @name = attributes.fetch(:name) ? attributes.fetch(:name) : @name <-- pontential terniary value for single object being passed in as paramater in event of input fields being populated find -->
  @name = name
  @location = location
  @genre = genre
end

def delete
  @@stages.delete(self.id)
end

end
