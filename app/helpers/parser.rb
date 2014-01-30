module Parser
  def self.parser(file, object)
    people = []
    CSV.foreach(file, :headers => true, header_converters: :symbol) do |csv_obj|
     people << object.new(csv_obj)
    end
     people
  end
end