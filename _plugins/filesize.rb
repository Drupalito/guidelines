
module Jekyll
  module FileSize
    def filesize(size)

      # size = @text
      suffixes = [' bytes', ' KB', ' MB', ' GB']
      suffix_index = 0

      while size >= 10 * 1024 and suffix_index < suffixes.length
        suffix_index += 1
        size /= 1024
      end

      "#{size}#{suffixes[suffix_index]}"

    end
  end
end

Liquid::Template.register_filter(Jekyll::FileSize)
