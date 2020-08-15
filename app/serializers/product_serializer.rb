class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :available
end
