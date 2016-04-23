class Kind < ActiveRecord::Base
  has_many :snippets, dependent: :destroy

  def name_of(thing)
    find(thing)
  end
end
