$db = SQLite3::Database.open 'user.db'

class User

  attr_reader :first_name, :last_name, :email, :password, :phone, :created_at

  def initialize(*args)
    args = args[0]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @email = args[:email]
    @phone = args[:phone]
    @created_at = args[:created_at]
  end

  def self.where(attribute, value)
  	query = "select * from users where #{attribute}"
  	id = $db.execute(query,value).flatten
  end

  def self.count 
  	count = $db.execute("select count(*) from users").flatten[0]
  end

 def self.save(*args)
     insert =  <<-SQL
      INSERT INTO users
      values (NULL,?,?,?,?,?,DATETIME('now'))
      SQL
      $db.execute( insert,
                   person.first_name,
                   person.last_name,
                   person.email,
                   person.phone,
                   person.created_at,
                  )
  end

end
