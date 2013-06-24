class TestscriptPdf < Prawn::Document
  def initialize(order, view)
    super(top_margin: 80)
    @testscripts = order
    @view = view
    t=Time.new

    logo
    headding
    put_table
    move_down 100
    number_pages "<page>  ",size: 20, style: :bold,:at => [250, 0]
    number_pages "#{t.strftime("%d/%B/%Y")} ",size: 20,:at => [410,750]
    move_down 70
  end
 
  def headding
    text "Testscripts", size: 30, style: :bold,align: :center
  end
  
 def put_table
    move_down 20
 
    data=Array.new
    data << ["Audience", "Goal", "Approach", "Script Body"]    
   @testscripts.each do |ts| 
   	data << [ts.audience,ts.goal,ts.approach,ts.script_body]
   end

   table data do
      row(0).font_style = :bold
      row(0).align = :center
      columns(1..4).width=150
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
 end
 
def date
#    move_down 40
   t=Time.new
   text "#{t.strftime("%d/%m/%Y")} ", :size => 13
   
  end 
  
def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath
  end  
end
