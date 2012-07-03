module NavigationHelpers
  def path_to(page_name)
      case page_name
      when /home/
        ENV['CUCUMBER_HOST']
      when /search/
        "special-pages/search/"
      when /sitemap/
        "examples/site-map/"
      when /customer-login/
        "special-pages/customer-login/"
       when /backend-login/
        "typo3/"
       when /install-tool/
        "typo3/install/"
      else
        ENV['CUCUMBER_HOST'] + page_name
      end
    end
end

World(NavigationHelpers)
