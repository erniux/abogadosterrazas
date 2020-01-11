class LinksController < ApplicationController
	before_action :set_link, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@links = Link.all
	end

	def new
		@link = Link.new
	end

	def edit

	end

	def create
    	@link = Link.new(link_params)

    	respond_to do |format|

      		if @link.save
        		format.html { redirect_to links_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @link.update(link_params)
  	      format.html { redirect_to  links_path, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  if @link.destroy
  	   respond_to do |format|
  	    format.html { redirect_to links_path, notice: 'Regsitro eliminado correctamente.' }
  	   end
     end
  	end
  	 

  	private
    
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:id, :entidad, :link)
    end

end