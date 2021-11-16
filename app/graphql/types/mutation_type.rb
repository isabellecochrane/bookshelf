class Types::MutationType < Types::BaseObject

  field :create_author, AuthorType, null: true, description: "Create an author" do
    argument :author, Types::AuthorInputType, required: true
  end
  #   argument :first_name, String, required: false
  #   argument :last_name, String, required: false
  #   argument :yob, Int, required: false
  #   argument :is_alive, Boolean, required: false
  # end

  # def create_author(first_name:, last_name:, yob:, is_alive:)
  #   Author.create first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive
  # end
  # input type encompasses all attributes to a type, it has a !

  # field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

  def create_author(author:)
    Author.create author.to_h #to_h to conform with rails conventions
  end

  field :update_author, Boolean, null: false, description: 'Update an author' do
    argument :author, Types::AuthorInputType, required: true
  end

  def update_author(author:)
    existing = Author.where(id: author[:id]).first
    existing&.update author.to_h
  end

  field :delete_author, Boolean, null: false, description: "delete an author" do
    argument :id, ID, required: true
  end

  def delete_author(id:)
    Author.where(id: id).destroy_all
    true
  end
end
