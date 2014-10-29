class Admin::HomeworkController < AdminController
	skip_authorize_resource :only => [:index]
	def index
	end
end
