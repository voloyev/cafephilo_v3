class TogglePublished < Avo::BaseAction
  self.name = 'Toggle published'

  def handle(**args)
    models, fields, current_user, resource = args.values_at(
      :models, :fields, :current_user, :resource
    )

    models.each do |model|
      if model.published?
        model.update(publish: false)
      else
        model.update(publish: true)
      end
    end
  end
end
