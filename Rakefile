require 'bundler'
Bundler.require

task :initdb do
  dbname = ENV['DB_DATABASE']

  sql = open('config/schema.sql') do |f|
    f.read
  end

  client = Mysql2::Client.new(
      host: ENV['DB_HOST'],
      username: ENV['DB_USERNAME'],
      password: ENV['DB_PASSWORD'],
  )
  client.query('create database if not exists ' + dbname)
  client.query('use ' + dbname)
  client.query(sql)
end

