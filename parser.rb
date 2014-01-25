module Parser
  def self.parser(file)
    people = []
    CSV.foreach(file, :headers => true, header_converters: :symbol) do |csv_obj|
     people << User.new(csv_obj)
    end
    people
  end
end