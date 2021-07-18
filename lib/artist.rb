class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def songs
        Song.all.filter { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each { |song| puts song.name }
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find { |artist| artist.name == name }
        artist ||= self.new(name)
        artist
    end
end