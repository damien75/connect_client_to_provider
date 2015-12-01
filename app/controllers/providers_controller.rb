class ProvidersController < ApplicationController
    def provider_params
      params.require(:provider).permit(:name, :status, :specialty)
    end

    def new
      @all_statuses = ['other' , 'private' , 'public']
	    @all_specialties = ['specialty 1' , 'specialty 2' , 'specialty 3']
    end

    def index
        @providers = Provider.all
    end

    def create
      @provider = Provider.create!(provider_params)
      flash[:notice] = "#{@provider.name} was successfully created"
      redirect_to providers_path #TODO: change in a redirect to the edit page of the provider just created
    end
end
