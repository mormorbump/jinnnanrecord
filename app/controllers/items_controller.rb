class ItemsController < ApplicationController
def new
end
def show
  @sano = Sano.all
  # 佐野さんの全てです
end

end
