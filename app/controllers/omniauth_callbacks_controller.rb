class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
  def facebook
    generic_callback( 'facebook' )
  end
=begin
   def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end
=end

  def generic_callback( provider )
    @identity = Identity.find_for_oauth env["omniauth.auth"]

   
    @user = @identity.user || current_user
    if @user.nil?
            puts "TEST 1"

      @user = User.create( email: @identity.email)
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end
    

    
    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      # This is because we've created the user manually, and Device expects a
      # FormUser class (with the validations)
      @user = User.find @user.id
      @user.update_attribute( :name, @identity.name )
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      puts "TEST 2"
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    
    #[:facebook].each do |provider|
    ##provides_callback_for provider
    #end
  end


  

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
