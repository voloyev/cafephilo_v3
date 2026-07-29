# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events ||= Event.published.page(params[:page])

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
