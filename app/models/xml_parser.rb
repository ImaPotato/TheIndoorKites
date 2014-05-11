require 'nokogiri'

class XMLParser
  def initialize
    file = File.open('/Users/Potato/Desktop/sample1.xml')
    @doc = Nokogiri::XML(file)
    file.close
  end

  def initialise_mail
    @doc.xpath("//mail").each do |node|
      Mail.create(:day => node.at('day'), :to => node.at('to'), :from => node.at('from'), :weight => node.at(weight), :volume => node.at(volume), :priority => node.at(priority))
    end
  end

  def initialize_mail_history

  end

  def intialise_companies

  end

  def intialise_comapny_history

  end
end