module ApplicationHelper
    include Pagy::Frontend
    def user_avatar(user)
        if user.avatar.attached?
            user.avatar
        else
            'default_avatar.jpg'
        end
    end
end
