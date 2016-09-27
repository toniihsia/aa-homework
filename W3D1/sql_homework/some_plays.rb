require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('sum_plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL name)
      SELECT
        *
      FROM
        plays
      WHERE
        name = ?
    SQL

    return nil unless play.length > 0
    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    raise "#{name} not found in database" unless playwright

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL

    plays.nap { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in the database!" if @id

    PlayDBConnection.instance.execute( <<-SQL, @title, @year, @playrwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

    # heredoc: embeds a bunch of code that will be read as a string
    # <<-'insert whatever you want, but traditionally SQL'
    # if you do SQL it will also offer SQL syntax highlighting in Atom
    # after heredoc, you can also have bind arguments
    # the three question marks after values not corresponds to @title, @ year,
    # and @playwright_id
    # you want to do this becase you want to PREVENT SQL Injection Attacks
    # an Injection Attack is
    # any time you have external input, use the question marks

  def update
    raise "#{self} is not in the database!" unless @id

    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year
  attr_reader :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, @name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    return nil unless playwright.length > 0
    Playwright.new(person.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} is already in the database!" if @id
    PlayDBConnection.instance.execute( <<-SQL @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in the database!" unless @id

    PlayDBCOnnection.instance.execute(<<-SQL, @id, @name, @birth_year)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    PlayerDBConnection.instance.execute(<<-SQL @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL

    plays.map { |play| Play.new(play) }
  end
end
