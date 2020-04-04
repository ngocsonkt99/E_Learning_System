# frozen_string_literal: true

class LessonWord < ApplicationRecord
  belongs_to :word
  belongs_to :lesson
  belongs_to :word_answer

  validates :word_id, presence: true
  validates :lesson_id, presence: true
  validates :word_answer_id, presence: true
end
