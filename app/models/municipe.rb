class Municipe < ApplicationRecord
  validates :full_name, :birthdate, :phone, :photo, presence: true

  validates :cpf, presence: true, uniqueness: true
  validates :cns, presence: true, uniqueness: true, length: { is: 15 }

  validates :email, presence: true, uniqueness: true,
                    format: {
                      with: /\A(.+)@(.+)\z/,
                      message: 'invalid'
                    }

  validates :active, inclusion: [true, false]

  validate :legit_cpf, if: -> { cpf.present? }
  validate :legit_cns, if: -> { cns.present? }
  validate :legit_birthdate, if: -> { birthdate.present? }

  private

  def legit_cpf
    errors.add(:cpf, 'invalid') unless !!CPF.valid?(cpf)
  end

  def legit_cns
    errors.add(:cns, 'invalid') unless cns_valid?
  end

  def legit_birthdate
    errors.add(:birthdate, 'invalid') if birthdate_invalid?
  end

  def cns_valid?
    (cns.chars.map.with_index { |digit, i| digit.to_i * (15 - i) }.sum % 11).zero?
  end

  def birthdate_invalid?
    birthdate.to_date < '01/01/1900'.to_date || birthdate.to_date.future?
  rescue StandardError
    true
  end
end
