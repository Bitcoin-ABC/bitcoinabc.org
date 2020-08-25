module Jekyll
  class RpcIndexPageGenerator < Generator
    safe true

    def generate(site)
      versions = Set[]

      # Generate an index for RPC commands of each version
      site.collections['doc'].docs.each do |doc|
        version = doc['version']
        if version && version != 'dev'
          versions.add(version)
        end
      end

      # Generate a top-level index listing all of the versions
      site.pages << DocIndexPage.new(site, site.source, File.join('doc'), versions.to_a())
    end
  end

  class DocIndexPage < Page
    def initialize(site, base, dir, versions)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'docindex.html')
      self.data['versions'] = versions
    end
  end
end

