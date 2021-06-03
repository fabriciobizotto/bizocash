class ApplicationController < ActionController::Base
    before_action :configure_permited_parameters, if: :devise_controller?
    around_action :rescue_from_fk_contraint, only: [:destroy]
    around_action :rescue_from_un_contraint, only: [:create, :update]

    protected

    def configure_permited_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end    


    private

    def rescue_from_fk_contraint
        begin
            yield
        rescue ActiveRecord::InvalidForeignKey
            respond_to do |format|
            # flash[:alert] = 'Não foi possível excluir este ítem. Existem registros vinculados.'
            format.html { redirect_to url_for(request.path) }
            end
        end
    end

    def rescue_from_un_contraint
        begin
            yield
        rescue ActiveRecord::RecordNotUnique => error
            
            respond_to do |format|
                flash[:alert] = error.message
                format.html { redirect_to url_for(request.path) }
            end
        end
    end
end