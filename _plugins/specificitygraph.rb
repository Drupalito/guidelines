
module Jekyll
  class SpecificityGraph < Liquid::Tag
    def initialize(tag_name, object, tokens)
      super
      @object = object
    end
    def render(context)

      site = context.registers[:site]
      data = site.data

      output = []
      array = []
      
      data.each do |(a, b)|

        selectors = data[a]['selectors']
        if selectors
          selectors.each_with_index do |(c,d),index|

            array.push(
              'selectorIndex' => index+1,
              'selector' => "#{ c['selector'] }",
              'specificity' => "#{ c['specificity'] }",
              'y' => c['specificity_10']
            )

          end
        end
      end

      output.push(
        'name' => 'screen',
        'data' => array
      )

      return output.to_json

    end
  end
end

Liquid::Template.register_tag('specificitygraph', Jekyll::SpecificityGraph)
