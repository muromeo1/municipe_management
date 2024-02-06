module Municipes
  class Creator
    include Interactor
    include BaseInteractor

    requires :full_name,
             :cpf,
             :cns,
             :email,
             :birthdate,
             :phone,
             :active

    def call
      create_municipe
    rescue RuntimeError, ActiveRecord::RecordInvalid => e
      context.fail!(error: e.message)
    end

    private

    def municipe
      context.municipe ||= Municipe.new(context.to_h)
    end

    def create_municipe
      municipe.save!
    end
  end
end
