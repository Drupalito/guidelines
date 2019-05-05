
module Jekyll
  class Maquettes < Page
    def initialize(site, base, dir, output, basename, filename)
      @site = site
      @base = base
      @dir = dir
      @name = "project/maquette-" + basename + ".html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'asideleft.html')
      self.data['title'] = "#{ basename }"
      self.data['description'] = filename
      self.data['layout'] = "asideleft"
      self.data['group'] = "Maquettes"
      self.data['category'] = ''
      self.data['weight'] = 99
    end
  end

  class MaquettesGenerator < Generator
    priority :low

    def generate(site)

      config = site.config
      dirfiles = "#{ config['ROOT'] }/#{ config['OWNER_NAME'] }/#{ config['DIR'] }"
      dirMaquettes = "/docs/extract/png"

      listed_dir = File.expand_path(dirfiles+dirMaquettes)

      directory_files = File.join(listed_dir, "*")

      files = Dir.glob(directory_files)

      files.each_with_index do |filename, index|
        basename = File.basename(filename)

        converter = site.find_converter_instance(Jekyll::Converters::Markdown)

        filenameImage = '../assets/images/' + basename

        # Converter
        output  = ""
        output += "<div class='styleguide__content'>"
        output += "<a href='#{ filenameImage }' target='_blank'><img src='#{ filenameImage }' alt=''/></a>"
        output += "</div>"

        index = Maquettes.new(site, site.source, '/', output, basename, filename.gsub(dirfiles+'/', ''))
        index.content = output.to_liquid
        index.render(site.layouts, site.site_payload)
        index.write(site.dest)
        site.pages << index

      end

    end
  end

end
