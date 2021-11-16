class Types::CoordinatesType < Types::BaseObject
    field :lattitude, Float, null: true
    field :longitude, Float, null: true

    def lattitude
        object.first
    end

    def longitude
        object.last
    end
end