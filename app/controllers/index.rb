get '/' do
  # Look in app/views/index.
  @url = Url.all
  erb :index

end


post '/' do
	url = Url.create(orginal_url: params[:orginal_url])
	
  if url.new_record?
    @error = url.errors.messages[:orginal_url][0]
  end
  # byebug

  @url = Url.all
	erb :index
end

get '/show' do
	@url = Url.all
	erb :show_url
end

get '/:short_url' do
	url_obj = Url.find_by(shorten_url: params[:short_url])
	url_obj.count_the_visit
	# puts "------> count the visit"
	redirect "#{url_obj.orginal_url}"
	# redirect "/"

	#redirect to appropriate long url
end