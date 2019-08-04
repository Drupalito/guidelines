
class Jekyll::Converters::Markdown::Pandoc
  def initialize(config)
    # require 'pandoc-ruby'
    @config = config
  # rescue LoadError
  #   STDERR.puts 'You are missing a library required for Markdown. Please run:'
  #   STDERR.puts '  $ [sudo] gem install pandoc-ruby'
  #   raise FatalException.new("Missing dependency: pandoc-ruby")
  end
  def convert(content)
    puts content
    # The .force_encoding(Encoding::UTF_8) is a hack from
    # https://github.com/jekyll/jekyll/issues/2629
    # ::PandocRuby.new(content).to_html.force_encoding(Encoding::UTF_8)
    # TODO: Make the converter take into consideration extensions
  end
end
