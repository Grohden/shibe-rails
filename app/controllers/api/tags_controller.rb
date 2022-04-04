# frozen_string_literal: true

module Api
  class TagsController < ApplicationController
    def index
      @tags = Tag.all

      @tags = @tags.where(user_id: params[:user_id]) if params[:user_id]

      render json: @tags
    end

    def show
      @tag = Tag.find(params[:id])

      render json: @tag
    end
  end
end
