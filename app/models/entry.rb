class Entry < ApplicationRecord
  attr_reader :title, :link
  
  def initialize(title, link)
     @title = title
     @link = link
   end
end
