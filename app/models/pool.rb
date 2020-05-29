class Pool < ActiveRecord::Base 
    belongs_to :user 

    def food?
        if has_food == true 
            "Yes" 
        else 
            "No"
        end 
    end 

    def hh?
        if has_happy_hour == true
            "Yes"
        else
            "No"
        end
    end

    

end 