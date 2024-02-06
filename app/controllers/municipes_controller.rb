class MunicipesController < ApplicationController
  def index
    @municipes = Municipe.all
  end

  def new
    @municipe = Municipe.new
  end

  def create
    result = Municipes::Creator.call(municipe_params)

    if result.success?
      # redirect_to municipe_url(result.municipe), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def municipe_params
    params.permit(
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

  def address_params
    params.permit(
      :cep,
      :street,
      :complement,
      :neighborhood,
      :city,
      :state,
      :ibge_code
    )
  end
end
