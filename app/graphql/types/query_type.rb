# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'The query root of this schema'

    field :node, Types::NodeType, null: true, description: 'Fetches an object given its ID' do
      argument :id, ID, required: true, description: 'ID of the object'
    end

    field :nodes,
      [Types::NodeType, { null: true }],
      null: true,
      description: 'Fetches a list of objects given a list of IDs' do
      argument :ids, [ID], required: true, description: 'IDs of the objects'
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field,
      String,
      null: false,
      description: 'An example field added by the generator'

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    def test_field
      'Hello World!' # rubocop:disable I18n/RailsI18n/DecorateString
    end
  end
end
