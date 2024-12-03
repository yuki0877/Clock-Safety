module Api
  module V1
    class TestsController < ApplicationController
      def index
        msg = 'Hello World'
        render json: msg
      end
    end
  end
end
