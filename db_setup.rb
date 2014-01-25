$db = SQLite3::Database.new 'user.db'

module UserDB
  def self.setup
    $db.execute(
      <<-SQL
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name VARCHAR(64) NOT NULL,
        last_name VARCHAR(64) NOT NULL,
        email VARCHAR(64) NOT NULL,
        phone VARCHAR(64) NOT NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL
        );
      SQL
      )
  end

  def self.seed(parser)
     insert =  <<-SQL
      INSERT INTO users
      values (NULL,?,?,?,?,?,DATETIME('now'))
      SQL

    parser.each do |person|
      $db.execute( insert,
                   person.first_name,
                   person.last_name,
                   person.email,
                   person.phone,
                   person.created_at,
                  )
    end
  end
end







