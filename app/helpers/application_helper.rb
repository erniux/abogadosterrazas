module ApplicationHelper

	def datetimepicker_input form, field
    content_tag :div, :data => { 'date-format' => 'yyyy-mm-dd hh:mm', 'date-autoclose' => 'false'} do
    	form.text_field field, class: 'input-group date', id: 'datetimepicker', placeholder: 'YYYY-MM-DD hh:mm'
    end
  end

end


# ESto se debe acomodar en la vista:
#<div class='input-group date' id='datetimepicker1'>
#          <%= datetimepicker_input f, :fecha %>
#          <span class="input-group-addon">
#            <span class="glyphicon glyphicon-calendar"></span>
#          </span>
#        </div>
