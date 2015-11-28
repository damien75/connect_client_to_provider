class ProvidersController < ApplicationController
    def new
        @all_statuses = ['private' , 'public']
	    @all_specialties = ['specialty 1' , 'specialty 2' , 'specialty 3']
    end
end
