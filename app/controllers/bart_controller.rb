

class BartController < ApplicationController
  def index
    train_info = Bart.get_train_data
    render json: train_info
  end
end
