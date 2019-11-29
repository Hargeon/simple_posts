class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([A-Z][a-z]+) ([A-Z][a-z]+)\Z/
      record.errors[attribute] << 'Need name and surname with capital first letters'
    end
  end
end
