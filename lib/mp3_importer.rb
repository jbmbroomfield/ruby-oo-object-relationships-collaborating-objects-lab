class MP3Importer
    attr_accessor :path
    def initialize(path)
        self.path = path
    end

    def files
        Dir.children(self.path).filter do |filename|
            filename[-4..-1] == ".mp3"
        end
    end

    def import
        self.files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
end