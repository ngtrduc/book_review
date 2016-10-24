namespace :delete do
  task old_request: :environment do
    puts "delete old requests"
    requests = Request.accepted
    requests.destroy_all
  end
end
