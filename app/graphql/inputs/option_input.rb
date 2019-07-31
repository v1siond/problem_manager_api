module Inputs
  class OptionInput < Types::BaseInputObject
    name "OptionInput"
    argument :body, String, required: true
    argument :correct_answer, Boolean, required: true
  end
end