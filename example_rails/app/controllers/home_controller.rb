class HomeController < ApplicationController
  def index
    Request.create!
    @request_count = Request.count
  end
end
