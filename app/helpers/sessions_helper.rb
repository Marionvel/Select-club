module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
        #Création d'un cookie temporaire contenant une version cryptée de l'identifiant de l'utilisateur, 
        #ce qui nous permet de récupérer l'identifiant sur les pages suivantes en utilisant session [: user_id]. 
        #Methode sera utilisé à plusieurs endroit. Appelé grace au helper dans différents controller.
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        #Précupére l'ID du user actuel (current_user) sur les pages suivantes. Seul le current_user pourra acceder à 
        #ses actions (update, delete) et son profil
    end

    def logged_in?
      !current_user.nil?
      #Un utilisateur est connecté s'il y a un current_user dans la session, 
      #c'est-à-dire si current_user n'est pas nul.
    end

    def log_out
        session.delete(:user_id)
        #Deconnecter le current_user
        @current_user = nil
      end

end
