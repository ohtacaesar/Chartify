require 'bundler'
Bundler.require

task :initdb do
  dbname = ENV['DB_DBNAME']

  sql = open('config/schema.sql') do |f|
    f.read
  end

  con = PG::connect(
      host: ENV['DB_HOST'],
      user: ENV['DB_USER'],
      password: ENV['DB_PASSWORD'],
  )
  begin
    con.exec('create database ' + dbname)
  rescue
    con.finish
  end

  con = PG::connect(
      host: ENV['DB_HOST'],
      user: ENV['DB_USER'],
      password: ENV['DB_PASSWORD'],
      dbname: ENV['DB_DBNAME']
  )
  begin
    con.exec(sql)
  ensure
    con.finish
  end
end
