class TestscriptsController < ApplicationController
  def index
    @testscripts = current_user.testscripts.all

 respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testscripts }
    end
  end
  
  def get_pdf

        @ts=Testscript.all
                 
        pdf = TestscriptPdf.new(@ts, view_context)
        
 	send_data pdf.render,filename: "temp", type: "application/pdf",disposition: "inline"
  end

