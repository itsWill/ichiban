module ApplicationHelper

  def markdown(text)
    extensions = {
      no_intra_emphasis:   true,
      tables:              true,
      fenced_code_blocks:  true,
      space_after_headers: true,
      superscript:         true,
      footnotes:           true,
      strikethrough:       true,
      disabled_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
