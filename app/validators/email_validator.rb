class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /\A\w+(@admin.com)\Z/ && record.age < 30
      record.errors[:age] << "Your age need greater then 30, you: #{record.age}"
    end
  end
end
