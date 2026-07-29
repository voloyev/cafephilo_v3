# frozen_string_literal: true

class ApplicationController < ActionController::Base

  layout :layout

  private

  def layout
    is_a?(Devise::SessionsController) ? 'admin' : 'application'
  end
end
