class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def clone_reddit
    require "open-uri"
    doc = Nokogiri::HTML(open("https://www.reddit.com"))
    entries = doc.css('.entry')
    @entriesArray = []
    entries.each do |entry|
      title = entry.css('p.title>a').text
      link = entry.css('p.title>a')[0]['href']
      @entriesArray << Entry.new(title, link)
    end
    render template: "clone_reddit"
  end

end
