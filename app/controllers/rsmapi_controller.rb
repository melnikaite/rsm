class RsmapiController < ApplicationController
  def index
    require 'hpricot'
    require 'open-uri'
    @clips = Array.new
    [1,2].each{ |page_id|
      doc = open("http://redstarmusic.ru/ClipList_New_" + page_id.to_s + ".aspx?item=link_all") { |f| Hpricot(f) }
      elements = doc.search("//a[@class='clip']")
      elements.each do |element|
        clip = ClipObject.new
        clip.href = element.attributes['href']
        clip.href = clip.href[5..-6]
        clip.name = element.search("//i[@class='helpme']").inner_html
        clip.author = element.search("//b[@class='helpme']").inner_html
        clip.exists = File.exist?('public/video/' + clip.href + '.avi')
        @clips.push(clip)
      end
    }
  end
end

class ClipObject
  attr_accessor :href, :name, :author, :exists
end
