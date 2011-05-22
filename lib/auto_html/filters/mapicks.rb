AutoHtml.add_filter(:mapicks).with(:width => 425, :height => 350, :frameborder => 0) do |text, options|
  regex = /http:\/\/(www.)?mapicks\.com\/maps\/(\d+)(.*)?(\&\S+)?/
  text.gsub(regex) do
    map_id = $2
    url_text = $3
    width = options[:width]
    height = options[:height]
    frameborder = options[:frameborder]
    %{<br />
      <iframe width="#{width}" height="#{height}" frameborder="#{frameborder} scrolling="no" marginheight="0" marginwidth="0" src="http://mapicks.com/maps/#{map_id}#{url_text}/mini"></iframe>
      <br /><small><a href="http://mapicks.com/maps/#{map_id}#{url_text}" target='_blank' style="font-size:16px;color:#97A305;text-align:left">mapicks.com</a></small>
    }
  end
end
