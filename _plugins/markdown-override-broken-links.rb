require 'jekyll'
require 'pathname'
require 'uri'

module Jekyll
  class MarkdownOverrideBrokenLinks < Generator
    attr_accessor :site, :config

    safe true
    priority :highest

    def generate(site)
      @site    = site

      documents = site.pages

      documents.each do |document|
        next unless markdown_extension?(document.extname)
        next if document.is_a?(StaticFile)

        fix_broken_links(document)
      end
    end

    def fix_broken_links(doc)
      if doc.content.nil?()
        return
      end

      # Find all the links
      links = doc.content.scan(/(\[([^\]]+)\]\(([^ ")]+)[^)]*\))/)

      links.each do |link|
        original = link[0].strip()
        text = link[1].strip()
        url = link[2].strip()

        # The external links and local anchors will render valid
        next if is_valid_link?(url)

        # Relative links to markdown files will be converted by the
        # jekyll-relative-links plugin and are considered valid.
        # The plugin won't match the links relative to project root (starting
        # with a '/') if they are located in a subdirectory, so we need to fix
        # the link in this case.
        if is_markdown_link?(url)
          # Relative links don't need to be fixed
          next if !is_project_root_relative_link?(url)

          # Convert first both the link and the source markdown paths to absolute
          absolute_link = Pathname.new(get_doc_root(doc)).join(url[1..])
          absolute_doc_path = Pathname.new(site.source).join(doc.relative_path)

          # Now we can compute the link relative to the source markdown path
          relative_link = absolute_link.relative_path_from(absolute_doc_path.dirname()).to_s()

          doc.content.gsub!(original, "[#{text}](#{relative_link})")
          next
        end

        # Other links are broken, update them with "text (_url_)"
        doc.content.gsub!(original, "#{text} (`#{url}`)")
      end

      return
    end

    def get_doc_root(doc)
      doc_root = File.dirname(doc.relative_path)
      doc_root.slice!(File.dirname(doc.url))
      return File.join(site.source, doc_root)
    end

    def is_project_root_relative_link?(link_url)
      return link_url.start_with?("/")
    end

    def is_valid_link?(url)
      return is_external_link?(url) || is_lone_anchor?(url)
    end

    def is_external_link?(link_url)
      uri = URI.parse(link_url)
      return !uri.scheme.nil?
    end

    def is_lone_anchor?(link_url)
      uri = URI.parse(link_url)
      return (uri.path.nil? || uri.path.empty?) && !uri.fragment.nil?
    end

    def is_markdown_link?(link_url)
      uri = URI.parse(link_url)
      return uri.path.end_with?(".md")
    end

    def markdown_extension?(extension)
      markdown_converter.matches(extension)
    end

    def markdown_converter
      @markdown_converter ||= site.find_converter_instance(Converters::Markdown)
    end
  end
end



