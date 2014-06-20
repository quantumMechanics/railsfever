module BlogsHelper
	def markdown(text)
		options = [:hard_wrap, :filter_html, :autolink,
					:no_intraemphasis, :fenced_code, :gh_blockcode]
		renderer = Redcarpet::Render::HTML.new(hard_wrap:true, prettify:true)
		markdown = Redcarpet::Markdown.new(renderer, no_intraemphasis:true, fenced_code_blocks:true, 
				disable_indented_code_blocks:true, underline:true, tables:true, strikethrough:true, autolink:true,
				lax_spacing:true, superscript:true, highlight:true, quote:true, footnotes:true)
		markdown.render(text).html_safe
	end

	def increment_view_count
		@blog.views += 1
		@blog.save
	end
end
