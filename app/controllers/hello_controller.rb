class HelloController < ApplicationController
  def index
    # Direkt HTML render et
    render html: "<h1 style='color: RED'>HELLO WORLD</h1><p></p>".html_safe
  end
end