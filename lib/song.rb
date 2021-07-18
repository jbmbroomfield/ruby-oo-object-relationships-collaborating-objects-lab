class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

    def artist_name
        self.artist ? self.artist.name : nil
    end

    def self.new_by_filename(filename)
        artist_name, name = filename.split(" - ")
        song = self.new(name)
        song.artist_name = artist_name
        song
    end

    def self.all
        @@all
    end

end