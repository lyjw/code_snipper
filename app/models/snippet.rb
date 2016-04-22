class Snippet < ActiveRecord::Base
  belongs_to :kind

  validates_presence_of :title, :work

  def language
    kind_id ? Kind.find(kind_id).name : "Text"
  end

  def content
    MarkdownService.new.render(work).html_safe
  end

end
