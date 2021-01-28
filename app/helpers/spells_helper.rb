module SpellsHelper

    def display_index_header
        if @spellbook 
        content_tag(:h1, "#{@spellbook.title}  Spells")
        else 
        content_tag(:h1, "All Spells")
        end 
   end
    def display_new_header
        if @spellbook 
        content_tag(:h1, "Create a #{@spellbook.title} Spell")
        else 
        content_tag(:h1, "Create a Spell")
        end 
   end
    def book_form_fields(f)
        if @spellbook   # params[:brand_id]
         f.hidden_field :book_id, value: @spellbook.id 
        else 
         render partial: "spellbook_fields", locals: { f: f } 
        end 
    end

end
