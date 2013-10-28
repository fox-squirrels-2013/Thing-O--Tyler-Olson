require 'sinatra'

get '/' do
  # "<h1>Hi this is not a map.</h1>
  # <p>But later, this page will be about maps.</p>
  # <ul><li>It will be cool - you will be able to see states, and cities and other places you might want to go...</li>
  # <li>...but right now it is definitely not a map.</li></ul>"

  erb :maps
end
