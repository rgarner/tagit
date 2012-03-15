module Tagit
  VERSION = "0.0.1"

  class Version
    include Comparable
    attr_reader :major, :minor, :patch

    VERSION_REGEX = /^v([0-9]+)\.([0-9]+)(?:\.([0-9]+))?$/

    def initialize(major, minor, patch = nil)
      @major, @minor= major.to_i, minor.to_i
      @patch = patch.to_i if patch
    end

    def self.from_s(str)
      raise ArgumentError, "Not a conventional version string - '#{str}'" unless VERSION_REGEX.match(str)
      Version.new($1, $2, $3)
    end

    def self.current
      all.sort.last
    end

    def self.all
      lines = git_tags.split("\n")
      lines.inject([]) do |results, line|
        results << Version.new($1, $2, $3) if VERSION_REGEX.match(line)
        results
      end
    end

    def <=> other
      return 1 if other.nil?

      [:major, :minor, :patch].each do |sym|
        compare = ((self.send(sym) || 0) <=> (other.send(sym) || 0))
        return compare unless compare == 0 && sym != :patch
      end
    end

    def to_s
      "v#{major}.#{minor}#{".#{patch}" if patch}"
    end

    private

    def self.run(command)
      raise RuntimeError, "#{Rails.root} is not a git root" unless File.exists?(File.join(Rails.root, ('.git/HEAD')))
      `cd #{Rails.root} && #{command}`
    end

    def self.git_tags
      run('git tag')
    end
  end
end

