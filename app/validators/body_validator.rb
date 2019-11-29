class BodyValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.split(/ +/).size >= 10
      record.errors[attribute] << 'Post need has at least 10 words'
    end
  end
end
