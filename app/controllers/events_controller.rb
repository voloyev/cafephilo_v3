# frozen_string_literal: true

class EventsController < ApplicationController
  def index

    @events ||= Events::IndexPageRepository.new(Event).paginate(params[:page])

    require 'pry'; binding.pry # FIXME remove debugger
    respond_to do |format|
      format.html
      format.json do
        render json: {
          entries: render_to_string(partial: 'events', formats: [:html]),
          pagination: view_context.paginate(@events)
        }
      end
    end
  end
end
