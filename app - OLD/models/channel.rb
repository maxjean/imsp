class Channel < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :category_of_playlists_channels
  belongs_to :user

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  class << self

    def custom_search(query)
      __elasticsearch__.search(query: multi_match_query(query))
    end

    def multi_match_query(query)
      {
          multi_match: {
              query: query,
              fields: ['title^10', 'presentation_text','pseudo']
          }
      }
    end


  end
end
