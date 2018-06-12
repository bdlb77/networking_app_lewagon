require 'json'
require 'open-uri'


class UpdateContactJob < ApplicationJob
  queue_as :default

  def perform(contact_email)
    url = 'https://api.lusha.co/person?property=#{contact_email}'
    user_info = open(url).read
    contact = JSON.parse(user_info)
  end
end
