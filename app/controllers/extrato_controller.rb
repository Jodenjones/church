class ExtratoController < ApplicationController
  def index
    @movs = Mov.all.order(dtlanc: :asc)
  end
end
