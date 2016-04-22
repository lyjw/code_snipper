module ApplicationHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class SyntaxHighlighter < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    render_options = {
      filter_html:  true,
      hard_wrap:    true
    }

    renderer = SyntaxHighlighter.new(render_options)

    extensions = {
      fenced_code_blocks: true,
      lax_spacing:        true,
      strikethrough:      true,
      superscript:        true
    }

    @markdown ||= Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

end
