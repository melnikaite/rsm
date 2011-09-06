class RsmapiAjaxController < ApplicationController
  def get
    id = params[:id]
    id = URI.escape(id, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    url = 'http://redstarmusic.ru/Clip_' + id + '.aspx'
    require 'open-uri'
    open(url) {|src|
      if m = /ID=(.*?)"/.match(src.read)
        id = m[1]
      end
    }
    path = 'public/video/'
    id = URI.escape(id, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    url = 'http://redstarmusic.ru/TrackVideo.ashx?ID=' + id
    open(url) {|src|
      open(path + id + ".flv", "wb") {|dst|
        dst.write(src.read)
      }
    }
    system("ffmpeg -i " + path + id + ".flv " + path + id + ".avi")
    require 'json'
    @result = {'status' => 'success', 'url' => url}.to_json
  end
end
