module BasicPagesHelper
  # see if we just use it in basic_page helper
  def markdown(text)
    #options = {:filter_html=> true
    #           :autolink=> true
    #           :no_intraemphasis=> true
    #           :fenced_code=> true
    #           :gh_blockcode=> true
    #}
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    raw renderer.render(text)
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
