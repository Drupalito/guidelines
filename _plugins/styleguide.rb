require 'json'

module Jekyll
  class Styleguide < Page
    def initialize(site, base, dir, filename, title, category, file)
      @site = site
      @base = base
      @dir = dir
      @name = "styleguide/#{category}-#{filename}.html"

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
    REGEX_CODE      = /```([a-z].*?)\n([\s\S]*?)\n```/m
    REGEX_INTERCODE = /\*\/((.*?)\n[\s\S]*?)\/\*?(doc|end)/m

    REGEX_EXEMPLES = /<!-- examples -->([\s\S]*?)<!-- \/examples -->/m
    REGEX_EXEMPLES_SOLO = /<!-- exampleFor: \"([\w\s,+\a-zA-ZéèÉÈ]+?)\" -->([\s\S]*?)<!-- \/exampleFor -->/m

    def read_file(file_name)
      file = File.open(file_name, "r")
      data = file.read
      file.close
      return data
    end

    def generate_code(number)
      charset = Array('A'..'Z') + Array('a'..'z')
      Array.new(number) { charset.sample }.join
    end

    def get_scss(source)
      output = []
      Dir.glob(source + "/**/*.scss") do |file|
        output.push(file)
      end
      output
    end

    def comment_metadata(comment)
      commentMeta = REGEX_HEADER.match(comment)
      commentMarkdown = comment.sub(commentMeta[0], '')

      demo     = ""
      codeLang = ""
      snippet  = ""
      hasDemo  = ""
      hasPalette = ""

      demos = []
      
      if REGEX_EXEMPLES.match(commentMarkdown)
        # commentExamples = REGEX_EXEMPLES.match(commentMarkdown)
        commentExamplesAll = commentMarkdown.scan(REGEX_EXEMPLES)

        commentExamplesAll.each_with_index do |code, index|

          if REGEX_EXEMPLES_SOLO.match(code[0])
            # commentCode = REGEX_EXEMPLES_SOLO.match(code[0])
            commentAllCode = code[0].scan(REGEX_EXEMPLES_SOLO)
           
            commentAllCode.each_with_index do |code2, i|
              title = code2[0]
              splitCodeRender = code2[1].scan(REGEX_CODE)
              language = splitCodeRender[0][0]
              descriptionRender = code2[1].strip.gsub(REGEX_CODE,'')
              demoRender = splitCodeRender[0][1]
              snippetRender = (code2[1].strip.gsub(/^[ \t]{2}/m,''))

              demos.push(
                :title => title ? title : "",
                :description => descriptionRender,
                :syntax_lang => language,
                :snippet => snippetRender,
                :demo => demoRender,
              )

            end 
          end
        end

        commentMarkdown = commentMarkdown.sub(REGEX_EXEMPLES, '')
      end

      data = YAML::load(commentMeta[1])

      output = []
      output.push(
        :metadata => data,
        :show => data.has_key?('show'),
        :markdown => commentMarkdown,
        :commentOriginal=> comment,
        # :syntax_lang => codeLang[0],
        # :snippet => snippetRender,
        :demos => demos,
        # :hasDemo => hasDemo,
        # :hasPalette => hasPalette
      )
      return output;
    end

    def generate(site)
      sourceFiles = "#{site.config['PATH_TO_SOURCE']}/scss"

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
                  :demos        => metadata[0][:demos],
                  :snippet     => metadata[0][:snippet],
                  :original    => metadata[0][:commentOriginal],
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
      cssFiles =  "#{site.config['PATH_TO_THEME']}/css"
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      output = ""
      data.each do |block|
        extract_body = REGEX_HEADER.match(block[:original])
        fi = block[:description].sub(extract_body[0], "").strip!
        
        if brick == "modules"
          scssSrc = "#{site.config['PATH_TO_SOURCE']}/scss"
          output += "<link href='../assets/corecss#{file.gsub(scssSrc, '').gsub('.scss', '.css')}' rel='stylesheet' />"
        end

        output += ""
        output += "<div class='styleguide'>"
        output += "  <div class='styleguide__header'>"
        output += "    <h2 class='styleguide__title'>" + converter.convert(block[:title]).gsub('<p>', '').gsub('</p>', '').strip + "</h2>"
        output += "  </div>"
        if fi != ""
          output += "  <div class='styleguide__content'>"
          output += converter.convert(fi)
          output += "  </div>"
        end

        if block[:demos].count >= 1
          output += "<div class='styleguide__demos'>"
          if block[:demos].count >= 2
            output += "<div class='styleguide__examples'>"
            output += "<ul class='nav nav-tabs'><li class='nav-item dropdown'><a class='nav-link dropdown-toggle active' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>#{block[:demos].count} Exemples</a><div class='dropdown-menu'>"
            randExamples = generate_code(6)
            block[:demos].each_with_index do |demo, index|
              isActive = index == 0 ? 'active show' : nil
              isActiveTrue = index == 0 ? 'true' : 'false'
              output += "<a class='dropdown-item #{isActive}' data-toggle='tab' role='tab' aria-controls='#{randExamples}--#{index}' aria-selected='#{isActiveTrue}' href='##{randExamples}--#{index}'>#{demo[:title]}</a>"
            end
            output += "</div></li></ul>"
            output += "</div>"
          end
          if block[:demos].count >= 1
            if block[:demos].count === 1
              output += "<div class='styleguide__oneup'>"
              output += "<div class='tab-inner'>"
            else
              output += "<div class='styleguide__twoup'>"
              output += "<div class='tab-content'>"
            end
            # output += "<div class='tab-content'>"
            block[:demos].each_with_index do |demo, index|
              randNumber = generate_code(5)
              isActive = index == 0 ? 'active show' : nil
              output += "<div class='tab-pane #{isActive}' id='#{randExamples}--#{index}'>"
    
              if demo[:snippet] && demo[:demo]
                # TABS
                output += ''
                if block[:demos].count >= 2
                  output += '<p class="bold">'+ demo[:title] +'</p>'
                end
                if demo[:description]
                  output += converter.convert(demo[:description])
                end
                output += '<ul class="nav nav-tabs" role="tablist">'
                if demo[:demo]
                  output += '  <li class="nav-item">'
                  output += '    <a class="nav-link active show" href="#demo-'+ randNumber +'" role="tab" data-toggle="tab" aria-toggle="tab" aria-selected="true">Démo</a>'
                  output += '  </li>'
                end
                if demo[:snippet] != "" && demo[:demo]
                  output += '  <li class="nav-item">'
                  output += '    <a class="nav-link" href="#snippet-'+ randNumber +'" role="tab" data-toggle="tab" aria-toggle="tab" aria-selected="false">Snippet</a>'
                  output += '  </li>'
                end
                output += '</ul>'
                
                if (demo[:demo] or demo[:snippet])
                  output += '<div class="tab-content">'
                  if demo[:demo]
                    output += '  <div role="tabpanel" class="tab-pane fade show active" id="demo-'+ randNumber +'">'
                    output += "    <div class='styleguide__demo'>"
                    output += converter.convert(demo[:demo])
                    output += "    </div>"
                    output += '  </div>'
                  end
                  if demo[:snippet]
                    output += '  <div role="tabpanel" class="tab-pane fade" id="snippet-'+ randNumber +'">'
                    output += "    <div class='styleguide__snippet'>"
                    output += converter.convert(demo[:snippet])
                    output += "    </div>"
                    output += '  </div>'
                  end
                  output += '</div>'
                end
              end
              output += '</div>'
            end
            output += "</div></div>"
          end
          output += "</div>"
        end

        
        # if block[:snippet] && block[:demo]
        #   # TABS
        #   output += ''
        #   output += '<ul class="nav nav-tabs list-none list-inline list-separate" role="tablist">'
        #   if block[:demo]
        #     output += '  <li class="nav-item">'
        #     output += '    <a class="nav-link show" href="#demo-'+ randNumber +'" role="tab" data-toggle="tab" aria-toggle="tab" aria-selected="true">Démo</a>'
        #     output += '  </li>'
        #   end
        #   if block[:snippet] != "" && block[:demo]
        #     output += '  <li class="nav-item">'
        #     output += '    <a class="nav-link" href="#snippet-'+ randNumber +'" role="tab" data-toggle="tab" aria-toggle="tab" aria-selected="false">Snippet</a>'
        #     output += '  </li>'
        #   end
        #   output += '</ul>'
          
        #   output += '<div class="tab-content">'
        #   if block[:demo]
        #     output += '  <div role="tabpanel" class="tab-pane fade show active" id="demo-'+ randNumber +'">'
        #     output += "    <div class='styleguide__demo'>"
        #     output += converter.convert(block[:demo])
        #     output += "    </div>"
        #     output += '  </div>'
        #   end
        #   if block[:snippet]
        #     output += '  <div role="tabpanel" class="tab-pane fade" id="snippet-'+ randNumber +'">'
        #     output += "    <div class='styleguide__snippet'>"
        #     output += converter.convert(block[:snippet])
        #     output += "    </div>"
        #     output += '  </div>'
        #   end
        #   output += '</div>'
        # end

        components = (block[:metadata]['components'] != "") ? block[:metadata]['components'] : nil
        if components
          # puts (components['modifiers'])
          # puts (components.block)
          output += "<div class='styleguide_properties'>"
          output += "<h3>Propriétés du block #{components['block']}</h3>"
          if components['modifiers']
            components['modifiers'].each_with_index do |modifier, index|
              if (modifier) 
                output += "<h4>#{modifier['id']}</h4>"
                output += "<div class='table-responsive'>"
                output += "<table class='table'>"
                modifier['items'].each do |item|
                  output += "<tr>"
                  output += "  <td>#{item['class']}</td>"
                  output += "  <td>#{item['title']}</td>"
                  output += "</tr>"
                end
                output += "</table>"
                output += "</div>"
              end
              
            end
          end
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
          if block[:metadata]['versionning'][0]['drupal']
            output += "<li><strong>Origine: <span class='fa fa-drupal' aria-hidden='true'></span> #{block[:metadata]['versionning'][0]['drupal']}</strong></li>"
          end
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
