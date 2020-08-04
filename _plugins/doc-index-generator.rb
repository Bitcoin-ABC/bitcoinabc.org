module Jekyll
  class RpcIndexPageGenerator < Generator
    safe true

    def generate(site)
      site.collections['doc'].docs.each do |doc|
        version = doc['version']
        if version
          if version != 'dev'
            site.pages << RpcIndexPage.new(site, site.source, File.join('doc', version, 'rpc'), version)
          end
        end
      end
    end
  end

  class RpcIndexPage < Page
    def initialize(site, base, dir, version)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'rpcindex.html')
      self.data['version'] = version
    end
  end
end

