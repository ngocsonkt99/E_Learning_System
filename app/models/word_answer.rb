# frozen_string_literal: true

class WordAnswer < ApplicationRecord
  belongs_to :word

  validates :content, presence: true, length: { maximum: 20 }
end
