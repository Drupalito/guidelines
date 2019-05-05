
module Jekyll
  class Guidelines < Page
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

  class GuidelinesGenerator < Generator
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

    def read_headers(comment)
      comment_match = REGEX_HEADER.match(comment)
      data = YAML::load(comment_match[1])
      return data
    end

    def read_comment(comment)
      comment_match = REGEX_HEADER.match(comment)

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

      output = []
      output.push(
        :markdown    => markdown,
        :markdowncode=> comment,
        :syntax_lang => language,
        :snippet     => snippet,
        :demo        => demo
      )

      return output
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


        if basename.include? "-rtl"
        else
          if folderBrick != nil && folderBrick != ""

            content = read_file(file)

            decorated_snippet = {}
            decorated_snippet_snippet = []

            hologram_comments = content.scan(/\s*\/\*doc(.*?)\*\//m)

            hologram_comments.each_with_index do |comment_block, index|

              headers = self.read_headers(comment_block[0])
              comment = self.read_comment(comment_block[0])

              # puts headers.inspect

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

  end
end
