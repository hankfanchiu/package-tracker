class PackagesController < ApplicationController
  def new
    @phone_number = Package.new
  end

  def create
    @phone_number = Package.find_or_create_by(phone_number: params[:package][:phone_number])
    @phone_number.generate_pin
    @phone_number.send_pin
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end

  def verify
    @phone_number = Package.find_by(phone_number: params[:hidden_phone_number])
    @phone_number.verify(params[:pin])
    respond_to do |format|
      format.js
    end
  end

  def index
    tracking_id = params[:tracking_id]
    carrier = params[:carrier]

    url = URI.parse("https://api.goshippo.com/v1/tracks/#{carrier}/#{tracking_id}/")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    http.start do |http|
      request = Net::HTTP::Get.new(url.path)
      response = http.request(request)
    end
    render json: response.body
  end
end
