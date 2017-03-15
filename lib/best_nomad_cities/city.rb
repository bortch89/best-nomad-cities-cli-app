class BestNomadCities::City
  attr_accessor :name, :global_rank, :country, :nomad_cost_of_living, :internet_speed, :weather, :link, :travel_guide_link

  @@all = []

  def self.new_from_home_page(city)
    self.new(
    city.css("h2").text,
    city.css("h3").text,
    city.css(".rank").text,
    city.css(".bottom-right").text,
    city.css(".top-right").text,
    "#{city.css(".metric").text} / #{city.css(".imperial").text}",
    "https://nomadlist.com#{city.css('a').attribute('href').value}",
    "https://nomadlist.com#{city.css('a').attribute('href').value}/travel-guide"
    )
  end

  def initialize(name = nil, country = nil, global_rank = nil,  nomad_cost_of_living = nil, internet_speed = nil, weather = nil, link = nil, travel_guide_link = nil )
    @name = name
    @country = country
    @global_rank = global_rank
    @nomad_cost_of_living = nomad_cost_of_living
    @internet_speed = internet_speed
    @weather = weather
    @link = link
    @travel_guide_link = travel_guide_link
    @@all << self
  end

  def self.all
    @@all
  end
end
