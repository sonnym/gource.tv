SitemapGenerator::Sitemap.default_host = "http://gource.tv/"

SitemapGenerator::Sitemap.create do
  Repository.all.each do |repository|
    add repository_path(repository), lastmod: repository.updated_at, changefreq: :daily
  end
end
