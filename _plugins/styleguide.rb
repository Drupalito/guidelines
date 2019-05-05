
module Jekyll
  class Styleguide < Page
    def initialize(site, base, dir, filename, title, category, file)
      @site = site
      @base = base
      @dir = dir
      @name = "styleguide/" + category + "-#{ filename }.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "asidestyleguide.html")
      self.data['title'] = title
      self.data['description'] = file
      self.data['layout'] = "asidestyleguide"
      self.data['group'] = "styleguide"
      self.data['category'] = category
      self.data['weight'] = 0
    end
  end

  class StyleguideGenerator < Generator
    priority :low

    REGEX_HEADER    = /^\s*---\s(.*?)\s---[\r]?$/m
    REGEX_CODE      = /(```[a-z ](.*?)\n[\s\S]*?\n```)/
    REGEX_INTERCODE = /\*\/((.*?)\n[\s\S]*?)\/\*?(doc|end)/m

    def read_file(file_name)
      file = File.open(file_name, "r")
      data = file.read
      file.close
      return data
    end

    def get_scss(source)
      output = []
      Dir.glob(source + "/**/*.scss") do |file|
        output.push(file)
      end
      output
    end

    def comment_metadata(comment)
      comment_match = REGEX_HEADER.match(comment)
      # return if !comment_match
      markdown = comment.sub(comment_match[0], '')

      demo     = ""
      language = ""
      snippet  = ""

      if REGEX_CODE.match(markdown)
        extract_demo = REGEX_CODE.match(markdown)

        extract_language = extract_demo[0].lines.first.split("```")
        language = extract_language[1].strip

        demo = extract_demo[0].sub("```#{language}", '').sub("```", '')

        # extract_snippet = Pygments.highlight(extract_demo[0].strip.gsub(/^[ \t]{2}/m,''), :lexer => language)
        extract_snippet = (extract_demo[0].strip.gsub(/^[ \t]{2}/m,''))
        snippet = extract_snippet.sub("```#{language}", '').sub("```", '').strip

        markdown = markdown.sub(extract_demo[0], '')
      end

      data = YAML::load(comment_match[1])

      output = []
      output.push(
        :metadata    => data,
        :show        => data.has_key?('show'),
        :markdown    => markdown,
        :markdowncode=> comment,
        :syntax_lang => language,
        :snippet     => snippet,
        :demo        => demo
      )

      return output;
    end

    def generate(site)

      config = site.config

      dirfiles = "#{ config['ROOT'] }/#{ config['OWNER_NAME'] }/#{ config['DIR'] }"
      cssFiles =  "#{ config['PATH_TO_THEME'] }/css"
      sourceFiles = "#{ config['PATH_TO_SOURCE'] }/scss"

      filesTree = []

      getFilesScss = get_scss(sourceFiles)
      # puts getAllScss.inspect
      getFilesScss.each_with_index do |file, index|

        basename = File.basename(file)
        basenameWithoutExt = File.basename(file, ".*" )

        folder = file.gsub(sourceFiles, '').gsub(File.basename(file), '').split('/')
        folderBrick = folder[1]

        brick = folderBrick != nil ? folderBrick : "screen"

        content = read_file(file)

        if basename.include? "-rtl"
        else
          if folderBrick != nil && folderBrick != ""

            decorated_snippet = {}
            decorated_snippet_snippet = []

            hologram_comments = content.scan(/\s*\/\*doc(.*?)\*\//m)
            # holog/ram_comments_css = content.scan(REGEX_INTERCODE)

            hologram_comments.each_with_index do |comment_block, index|

              # styleCss = hologram_comments_css[index]
              # styleCsssqd = styleCss[0].to_s.empty? ? hologram_comments_css[index][0].to_s : ""

              metadata = self.comment_metadata(comment_block[0])

              # if metadata[0][:css]
                # puts styleCss
              # end

              if metadata[0][:metadata]['show'] == false
              else
                decorated_snippet_snippet.push(
                  :title       => metadata[0][:metadata]['title'],
                  :show        => metadata[0][:metadata]['show'],
                  :category    => metadata[0][:metadata]['category'],
                  :metadata    => metadata[0][:metadata],
                  :description => metadata[0][:markdown],
                  :syntax_lang => metadata[0][:syntax_lang],
                  :demo        => metadata[0][:demo],
                  :snippet     => metadata[0][:snippet],
                  :original    => metadata[0][:markdowncode],
                  # :csscode => styleCss
                )
              end
            end

            decorated_snippet = decorated_snippet_snippet

            if %w(_grid.scss book.scss contextual.scss date_api.scss field_collection.scss forum.scss system.base.scss vertical-tabs.scss).any? { |s| basename.include? s }
            else

              # Converter
              output = html(site, folderBrick, decorated_snippet, file)

              index = Styleguide.new(site, site.source, '/', basename, basename, brick, file.gsub(sourceFiles, 'source/scss'))
              index.content = output.to_liquid
              index.render(site.layouts, site.site_payload)
              index.write(site.dest)
              site.pages << index
            end
          end
        end

        # filesTree.push(
        #   :basename => File.basename(file),
        #   :folder   => brick,
        #   :dirname  => File.dirname(file),
        #   :extname  => File.extname(file),
        #   :updated  => File.mtime(file),
        #   # :content  => content
        # )

      end
    end

    def html(site, brick, data, file)

      config = site.config

      dirfiles = "#{ config['ROOT'] }/#{ config['OWNER_NAME'] }/#{ config['DIR'] }"
      cssFiles =  "#{ config['PATH_TO_THEME'] }/css"

      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      output = ""
      data.each do |block|
        extract_body = REGEX_HEADER.match(block[:original])
        fi = block[:original].sub(extract_body[0], '')

        if brick == 'modules'
          scssSrc = config['PATH_TO_SOURCE'] + '/scss'
          output += "<link href='../assets/corecss#{file.gsub(scssSrc, '').gsub('.scss', '.css')}' rel='stylesheet' />"
        end

        output += ""
        output += "<div class='styleguide'>"
        output += "<div class='styleguide__header'>"
        output += "<h2 class='styleguide__title'>" + converter.convert(block[:title]).gsub('<p>', '').gsub('</p>', '').strip + "</h2>"
        output += "</div>"
        output += "<div class='styleguide__content'>"
        output += converter.convert(fi)
        output += "</div>"
        # output += block[:syntax_lang]
        if block[:demo]
          output += "<div class='styleguide__demo'>"
          output += converter.convert(block[:demo])
          output += "</div>"
        end
        if block[:csscode]
          output += "<div class='copy--snippet'>"
          output += converter.convert(block[:csscode])
          output += "</div>"
        end
        if block[:metadata]['notes']
          output += "<div class='copy--notes'><ol class=''>"
          block[:metadata]['notes'].each do |note|
            output += "<li>" + converter.convert(note).gsub('(', '').gsub(')', '') + "</li>"
          end
          output += "</ol></div>"
        end
        if block[:metadata]['versionning']
          output += "<div class='copy--versionning'><ul class='list-inline list-separate'>"
          output += "<li>Version: " + block[:metadata]['versionning'][0]['version'].to_s + "</li>"
          output += "<li>" + block[:metadata]['versionning'][0]['update'].to_s + "</li>"
          output += "<li>Auteur: " + block[:metadata]['versionning'][0]['owner'].to_s + "</li>"
          output += "</ul></div>"
        end
        output += ""
        output += "</div>"
        # puts block[:csscode]
      end
      return output
    end
  end
end
