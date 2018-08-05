module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
        #Création d'un cookie temporaire contenant une version cryptée de l'identifiant de l'utilisateur, 
        #ce qui nous permet de récupérer l'identifiant sur les pages suivantes en utilisant session [: user_id]. 
        #Methode sera utilisé à plusieurs endroit. Appelé grace au helper dans différents controller.
    end

     # Remembers a user in a persistent session.
    def remember(user)
         user.remember
         cookies.permanent.signed[:user_id] = user.id
         cookies.permanent[:remember_token] = user.remember_token
    end

    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
              log_in user
              @current_user = user
            end
          end
        #Précupére l'ID du user actuel (current_user) sur les pages suivantes. Seul le current_user pourra acceder à 
        #ses actions (update, delete) et son profil
    end

    def logged_in?
      !current_user.nil?
      #Un utilisateur est connecté s'il y a un current_user dans la session, 
      #c'est-à-dire si current_user n'est pas nul.
    end

    # Forgets a persistent session.
    def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        #Deconnecter le current_user
        @current_user = nil
    end

    def destroy
        log_out if logged_in?
        redirect_to root_url
    end

end
