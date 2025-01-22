require 'json'

module Jekyll
  class SearchIndexGenerator < Generator
    safe true
    priority :low

    def generate(site)
      index = site.posts.docs.map do |post|
        {
          title: post.data['title'],
          url: post.url,
          content: post.content.gsub(/<[^>]*>/, ''),
          excerpt: post.data['excerpt'] || post.content[0..200]
        }
      end

      # Create JSON file directly
      json_path = File.join(site.dest, 'search-index.json')
      File.open(json_path, 'w') do |f|
        f.write(JSON.pretty_generate({
          version: '1.0',
          index: index
        }))
      end
    end
  end

  class SearchIndexPage < Page
    def initialize(site, base, index)
      @site = site
      @base = base
      @dir = '/'
      @name = 'search-index.json'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'empty.json')
      self.data['index'] = index
    end

    def render(layouts, site_payload)
      payload = {
        'page' => self.data,
        'site' => site_payload['site']
      }
      
      payload = Utils.deep_merge_hashes(site_payload, payload)
      do_layout(payload, layouts)
    end
  end
end