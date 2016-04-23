module ApplicationHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'


  class MarkdownService

    class Renderer < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end

    attr_reader :markdown

    def self.call(markdown)
      new(markdown).call
    end

    def initialize(markdown)
      @markdown = markdown
    end

    def call
      render
    end

    private

    def markdown_renderer
      render_options = {
        filter_html:  true,
        hard_wrap:    true
      }

      renderer = Renderer.new(render_options)

      extensions = {
        fenced_code_blocks: true,
        lax_spacing:        true,
        strikethrough:      true,
        superscript:        true,
        highlight:          true
      }

      Redcarpet::Markdown.new(renderer, extensions)
    end

    def render
      markdown_renderer.render(markdown).html_safe
    end

  end

end
