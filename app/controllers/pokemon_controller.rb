class PokemonController < ApplicationController

	def capture
		p = Pokemon.find(params[:id])
		p.trainer_id = current_trainer
		# redirect_to PREFIX_PATH
	end

	def damage
		p = Pokemon.find(params[:id])
		p.health = p.health - 10
		# redirect_to PREFIX_PATH
	end 

	def new
	end

	def create
		@pokemon = Pokemon.create(pokemon_params, level:1, health:100)
		@pokemon.trainer_id = current_trainer
		if @pokemon.save
			#redirect_to  trainer profile
		else 
			render "new"
			flash[:error] = @pokemon.errors.full_messages.to_sentence 
		end
	end

	private

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end 


end
