
module Jekyll
  class RulesizeGraph < Liquid::Tag
    def initialize(tag_name, object, tokens)
      super
      @object = object
    end
    def render(context)

      site = context.registers[:site]
      data = site.data
      cssStats = data

      output = []
      array = []

      cssStats.each do |(a, b)|

        rules = cssStats[a]['rules']
        if rules
          rules.each_with_index do |(c,d),index|

            arrayDecla = c['declarations'].collect {|key,value| key }

            array.push(
              'selectorIndex' => index+1,
              'selector' => "#{ c['selector'] }",
              'y' => arrayDecla.size
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

Liquid::Template.register_tag('rulesizegraph', Jekyll::RulesizeGraph)
