class Account
  attr_reader :xml_data

  XML_DIRECTORY = Rails.root.join("app", "assets", "xml")
  def initialize(xml_file_name)
    @xml_data = File.open(XML_DIRECTORY.join(xml_file_name)) do |file|
      Nokogiri::XML(file)
    end
  end

  # Searches the initalized xml file and returns an array
  # with each element found associated with a unique
  # clientID
  def find_attributes(*attributes)
    # Find all nodes with the nodename "clientID"
    client_data = @xml_data.xpath("//ClientId")

    # For each client datum create an element in an array that contains...
    return client_data.map do |client|
      # An array of all the attributes searched for
      attributes.map do |attribute|
        # Every attribute is assumed to be the nodename of a following-sibling
        # of every clientID
        [
          attribute.to_sym,
          client.xpath("following-sibling::#{attribute}")[0].content
      ]
      end.to_h
    end
  end
end
