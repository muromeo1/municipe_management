module Addresses
  class Creator
    include Interactor
    include BaseInteractor

    requires :cep,
             :street,
             :neighborhood,
             :city,
             :state,
             :municipe

    def call
      create_address
    rescue RuntimeError, ActiveRecord::RecordInvalid => e
      context.fail!(error: e.message)
    end

    private

    def address
      context.address ||= Address.new(context.to_h)
    end

    def create_address
      address.save!
    end
  end
end
