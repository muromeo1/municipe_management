class MunicipesController < ApplicationController
  def new
    @municipe = Municipe.new
  end

  def index
    @municipes = Municipe.all
  end

  def create
    result = Municipes::Creator.call(municipe_params)

    if result.success?
      redirect_to municipe_url(result.municipe), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(
      :full_name,
      :cpf,
      :cns,
      :email,
      :birthdate,
      :phone,
      :photo,
      :active
    )
  end
end
