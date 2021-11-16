class Types::AuthorInputType < GraphQL::Schema::InputObject
    graphql_name "AuthorInputType" #name by which it is seen in FE
    description "all attrributes for creating an author"

    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Integer, required: false
    argument :is_alive, Boolean, required: false
end

class Types::AuthorType < Types::BaseObject
    description "an author"

    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :yob, Integer, null: false
    field :is_alive, Boolean, null: true
    field :full_name, String, null: true

    def full_name
        ([object.first_name, object.last_name].compact).join" "
    end

    field :coordinates, Types::CoordinatesType, null: false
    field :publication_years, [Int], null: false

end