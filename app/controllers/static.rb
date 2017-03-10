#let user create new short URL
get "/" do

  @urls = Url.all
  erb :"static/index"
end

# create a new Url
post '/urls' do
  @x = Url.new(params)

  if @x.save
    redirect to '/'
  else

    @urls = Url.all
    @error = @x.errors.full_messages.join(" ")
    erb :"static/index"
  end

end

#redirect to appropriate "long" url.
get '/:short_url' do

  @url = Url.find_by(short_url: params[:short_url])
  @url.click_count +=1
  @url.save
  # @url.update(click_count: @url.click_count+1)
  redirect @url.long_url
end
