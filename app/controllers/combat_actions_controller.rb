class CombatActionsController < ApplicationController
	def new
		@action = CombatAction.new
	end

	def create
		@user = current_user
		@action = @user.combat_actions.new(action_params)
		@action.save
		redirect_to @user
	end

############

	def action_params
		params.require(:combat_action).permit(:name,:damage,:area,:onset,:saving_throw,:saving_value,
				:frequency,:limit,:cure)
	end
end