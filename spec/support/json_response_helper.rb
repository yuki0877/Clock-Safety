# spec/support/json_response_helper.rb
module JsonResponseHelper
  def json_response
    JSON.parse(response.body)
  end
end
