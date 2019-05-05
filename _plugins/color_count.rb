require 'io/console'

class AdsInlineTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

    REGEX_HEADER = /^\s*---\s(.*?)\s---[\r]?$/m
    REGEX_CODE   = /(```[a-z ](.*?)\n[\s\S]*?\n```)/

    def read_file(file_name)
      file = File.open(file_name, "r")
      data = file.read
      file.close
      return data
    end

    def get_scss(source)
      output = []
      Dir.glob(source + "/**/*.min.css") do |file|
        output.push(file)
      end
      output
    end

  def render(context)

    site = context.registers[:site]

    # Split the input variable (omitting error checking)
    input_split = split_params(@input)
    adclient = input_split[0].strip
    adslot = input_split[1].strip


    config = site.config

    dirfiles = "#{ config['ROOT'] }/#{ config['OWNER_NAME'] }/#{ config['DIR'] }"
    sourceFiles = dirfiles + "/site/www/sites/all/themes/custom/#{ config['SITE_PROJECT'] }/css"

    filesTree = []
    allfilesTree = []

    getFilesScss = get_scss(sourceFiles)

    getFilesScss.each_with_index do |file, index|
      basename = File.basename(file)

      folder = file.gsub(sourceFiles, '').gsub(File.basename(file), '').split('/')
      folderBrick = folder[1]

      brick = folderBrick != nil ? folderBrick : "screen"

      css = IO.read(file)

      # find all hex color values
      hex = css.scan(/#([0-9a-fA-F]{6}|[0-9a-fA-F]{3})/).flatten.map(&:strip)

      # convert the short code colors into long versions
      hex.map! { |color| color.length == 3 ? (c = color.split('')).zip(c).join : color }

      if %w(debug.grid.min.css base.editor.min.css).any? { |s| basename.include? s }
      else
        filesTree.push(
          :basename   => basename,
          :hex        => hex,
          :hex_unique => hex.uniq!
        )
        allfilesTree.push(hex)
      end

    end

    combineColorz = allfilesTree.flatten.compact.uniq!
    gchjjcuiy = allfilesTree.flatten.compact

    dsfdfdsfs = gchjjcuiy.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

    output  = ''

    output += '<h2>combineColorz couleurs</h2><div class="row row-xs-noborder">'
    dsfdfdsfs.each_with_index do |color, index|
      output += "<div class='col-xs-4 col-sm-2'><div class='pas' style='background:##{color[0]};height:120px;width:100%;'><span style='background:#fff;color:#222'>##{color[0]}<br/>x#{color[1]} fois</span></div></div>"
    end

    output += '</div><h2>Autres couleurs</h2>'
    filesTree.each_with_index do |file, index|
      # if file[:basename] != && file[:basename]

      if %w(debug.grid.min.css base.editor.min.css).any? { |s| file[:basename].include? s }
      else
        if file[:hex][0]
          output += '<h3>' + file[:basename] + '</h3><div class="row row-xs-noborder">'
          file[:hex].each_with_index do |color, index|
          output += '<div class="col-xs-4 col-sm-2"><div class="pas" style="background:#' + color + ';height:120px;width:100%;">' + color + '</div></div>'
          end
          output += '</div>'
        else
          output += ''
        end
      end
    end
    # Render it on the page by returning it
    return output;
  end

  def split_params(params)
    params.split("|")
  end
end
Liquid::Template.register_tag('colorzTree', AdsInlineTag)