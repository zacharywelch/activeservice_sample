module ActionDispatch
  class Request
    def query_parameters_with_parse_booleans
      query_parameters_without_parse_booleans.transform_values do |value|
        if %w(true false).include?(value)
          ActiveRecord::Type::Boolean.new.type_cast_from_user(value)
        else
          value
        end
      end
    end

    alias_method_chain :query_parameters, :parse_booleans
  end
end
