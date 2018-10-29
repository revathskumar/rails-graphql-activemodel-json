# app/model/user.rb
class User
    include ActiveModel::Serializers::JSON
  
    attr_accessor :name, :id, :username, :email
    
    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end
    
    def attributes
      instance_values
    end
  end
  