xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  
  basename = root_url.chomp("/")

  xml.url do
      xml.loc root_url
      xml.changefreq("monthly")
  end

  @static_paths.each do |path|
    xml.url do
      xml.loc "#{basename}#{path}"
      xml.changefreq("monthly")
    end
  end

  @blogs.each do |post|
    xml.url do
      xml.loc "#{basename}#{url_for(post)}"
      xml.lastmod post.updated_at.strftime("%F")
      xml.changefreq("weekly")
    end
  end

end