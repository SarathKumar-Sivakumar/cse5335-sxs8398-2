#!/usr/bin/env ruby

require 'csv'
require 'redis'
require 'json'



begin 
    Connection = Redis.new(:url => "redis://h:pn9nqom98a3ps8tc465jgtvf53@ec2-54-83-59-218.compute-1.amazonaws.com:10319")
   
    puts 'Databse connected'
    CSV.foreach('example.csv', :headers => true) do |obj|
       Connection.set obj['policyID'], [obj['Statecode'], obj['County'], obj['Latitude'], obj['Longtitude'], obj['Line'], obj['Construction'], obj['point_granularity']].to_json
    puts 'Item  inserted'    
	end 
    Connection.quit
        puts "Insertion into Redis db successful"
    
end


