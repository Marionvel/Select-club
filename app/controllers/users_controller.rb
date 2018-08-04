class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            flash[:success] = 'Utilisateur créé'
            #flash quand il y a un redirect_to (retourne une action et renvoie sur new view)
            log_in @user
            #Dès que le user a créé son compte il est loggé
            redirect_to @user
        else
            flash.now[:danger] = 'Erreur'
            #Flash.now quand il y a un render (pas d'action. Affiche seulement une vue)
            render 'new'
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end


    private
    #Methodes autres que CRUD

    def user_params
        params.require(:user).permit(:first_name, :last_name, :pseudo, :email, :password)
        #Pour l'attribut :user, prendre les infos demandées. Peuvent etre utilisées plus facilement
    end
end
