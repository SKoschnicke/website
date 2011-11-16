require 'rubygems'

require 'toto'
require 'rack/rewrite'

#DOMAIN = 'www.gfxpro.com'
DOMAIN = 'localhost'

# Rack config
use Rack::Static, :urls => ['/css', '/javascript', '/images', '/fonts', '/favicon.ico', '/downloads'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

if ENV['RACK_ENV'] == 'production'
#  use Rack::Auth::Basic, "GFXpro Relaunch private beta" do |username, password|
#    'newsite' == password
#  end
  use Rack::Rewrite do
    r301 %r{.*}, "http://#{DOMAIN}$&", :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != DOMAIN
    }
  end
end

use Rack::Rewrite do
  r301 '/competence', '/kompetenz'
  r301 '/contact', '/kontakt'
  r301 '/network', '/netzwerk'
end

Rack::Mime::MIME_TYPES.merge!({
  ".ogg"     => "application/ogg",
  ".ogx"     => "application/ogg",
  ".ogv"     => "video/ogg",
  ".oga"     => "audio/ogg",
  ".mp4"     => "video/mp4",
  ".m4v"     => "video/mp4",
  ".mp3"     => "audio/mpeg",
  ".m4a"     => "audio/mpeg",
  ".htc"     => "text/x-component"
})

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  # set :author,    ENV['USER']                               # blog author
  set :title,     "GFXpro - Design & Entwicklung"                   # site title
  set :root,      "start"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  set :summary,   :max => 150, :delim => /---/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

  set :date, lambda {|now| now.strftime("%d.%m.%Y") }

end


run toto


