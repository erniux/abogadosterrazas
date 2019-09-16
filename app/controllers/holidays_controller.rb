class HolidaysController < ApplicationController
	before_action :set_holiday, only: [:edit, :update, :destroy]
	access admin: :all

	def index
		@holidays = Holiday.all
	end

	def new
		@holiday = Holiday.new
	end

	def edit

	end

	def create
    	@holiday = Holiday.new(holiday_params)

    	respond_to do |format|

      		if @holiday.save
        		format.html { redirect_to holidays_path, notice: 'Regsitro creado correctamente.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end

  	def update
  	  respond_to do |format|
  	    if @holiday.update(holiday_params)
  	      format.html { redirect_to  holidays_path, notice: 'Regsitro actualizado correctamente.' }
  	    else
  	      format.html { render :edit }
  	    end
  	  end
  	end

  	def destroy
  	  @holiday.destroy
  	  respond_to do |format|
  	    format.html { redirect_to holidays_path, notice: 'Regsitro eliminado correctamente.' }
  	  end
  	end

  	private
    
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    def holiday_params
      params.require(:holiday).permit(:id, :fecha, :asignado, :comentarios, :expediente_id)
    end

end

 