require 'net/http'
require 'json'
require 'jenkins-remote-api'

search_term = URI::encode('#todayilearned')




SCHEDULER.every '10m', :first_in => 0 do |job|
  #http = Net::HTTP.new('search.twitter.com')
  #response = http.request(Net::HTTP::Get.new("/search.json?q=#{search_term}"))
  #tweets = JSON.parse(response.body)["results"]
  jenkins = Ci::Jenkins.new("http://10.10.5.125:8080/")
  p jenkins.list_all_job_names
  send_event('ci', jobs:jenkins.list_all_job_names)


  #if tweets
  #  tweets.map! do |tweet|
  #    { name: tweet['from_user']}
  #  end
  #  send_event('ci', jobs: tweets)
  #end
end