require 'bundler'
Bundler.require
require 'csv'
require 'json'
require 'fileutils'
require './lib/highcharts'

class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    also_reload File.expand_path('lib/**/*.rb', __dir__)
  end

  configure do
    set :connection_hash, {
        host: ENV['DB_HOST'],
        user: ENV['DB_USER'],
        password: ENV['DB_PASSWORD'],
        dbname: ENV['DB_DBNAME']
    }
  end

  def db
    con = PG::connect(settings.connection_hash)
    begin
      yield con if block_given?
    ensure
      con.finish
    end
  end

  get '/' do
    @charts = db do |con|
      result = con.exec('select id, title from charts order by created_at desc limit 10;')
      result.values
    end

    slim :home
  end

  get '/charts/:chart_id' do
    chart_id = params[:chart_id]

    result = db do |con|
      result = con.exec_params(
          'select id, title, highcharts, created_at from charts where id = $1;',
          [chart_id]
      )
      result.values
    end

    pass if result.size == 0
    @chart = JSON.parse(result[0][2])

    slim :chart
  end

  get '/charts/new' do
    redirect '/'
  end

  post '/charts/new' do
    csv = CSV.new(params['data'])

    builder = Highcharts::Builder.new
    @chart = builder.build(csv).to_hash

    slim :form
  end

  post '/charts/create' do
    title = params.fetch('title', '').strip
    # TODO: chart_jsonから、元の状態を構築する必要がある
    chart_json = params.fetch('json', '').strip

    # validation
    begin
      raise 'json is empty.' if chart_json.empty?
      ## ちゃんとjsonになっているか
      @chart = JSON.parse(chart_json) # parseに失敗すると例外飛ぶ
      raise 'title is empty.' if title.empty?
      raise 'title is long.' if title.size > 30
    rescue => e
      p e
      return slim :form
    end

    # save
    chart_id = SecureRandom.urlsafe_base64
    db do |con|
      con.exec_params(
          'insert into charts (id, title, highcharts) values($1, $2, $3);',
          [chart_id, title, chart_json]
      )
    end

    redirect '/charts/' + chart_id
  end

  not_found do
    slim :'404'
  end

end


