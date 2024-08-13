class Api::V1::TestsController < ApplicationController

    def index
        msg = "Hello World"
        render json: msg
    end
end
