class FeverRenderer < WillPaginate::ActionView::LinkRenderer

# contains overriden methods to make will_paginate produce output that matches what
# the crisp theme expects

protected

	def html_container(html)
		tag(:div, tag(:ul, html), container_attributes)
	end	
    
	def page_number(page)
		unless page == current_page
		  link(page, page, :rel => rel_value(page))
		else
		  tag(:li, tag(:span, page), :class => 'active')
		  
		end
	end

	def previous_or_next_page(page, text, classname)
    if page
      link(text, page, :class => classname)
    else
      link(text, '#', :class => classname + ' disabled')
    end
  end

private
 
 	def link(text, target, attributes = {})
        if target.is_a? Fixnum
          attributes[:rel] = rel_value(target)
          target = url(target)
        end
        attributes[:href] = target
        tag(:li, tag(:a, text, attributes))
        
      end

end