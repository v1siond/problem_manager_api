module Inputs
  class OptionEditInput < Types::BaseInputObject
    argument :id, ID, required: true
    argument :body, String, required: true
    argument :correct_answer, Boolean, required: true
  end
end