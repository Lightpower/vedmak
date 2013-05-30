<% module_namespacing do -%>
class <%= controller_class_name %>Controller < <%= admin? and base_controller_name rescue "ApplicationController" %>

  #before_filter :authenticate_user!
  before_filter :assign_<%= singular_table_name %>, only: for_crud
  respond_to :html, :json

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    respond_with(@<%= plural_table_name %>)
  end

  # GET <%= route_url %>/1
  def show
    respond_with(@<%= singular_table_name %>)
  end

  # GET <%= route_url %>/new
  def new
    respond_with(@<%= singular_table_name %>)
  end

  # GET <%= route_url %>/1/edit
  def edit
    respond_with(@<%= singular_table_name %>)
  end

  # POST <%= route_url %>
  def create
    @<%= orm_instance.save %> and
      flash[:notice] = "<%= human_name %> was successfully created"

    respond_with(@<%= singular_table_name %>)
  end

  # PUT <%= route_url %>/1
  def update
    @<%= orm_instance.update_attributes("params[:#{singular_table_name}]") %> and
      flash[:notice] = "<%= human_name %> was successfully updated"

    respond_with(@<%= singular_table_name %>)
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    @<%= orm_instance.destroy %> and
      flash[:notice] = "<%= human_name %> was successfully destroyed"

    respond_with(@<%= singular_table_name %>)
  end

  private

    def assign_<%= singular_table_name %>
      @<%= singular_table_name %> = params[:id] ?
        <%= orm_class.find(class_name, "params[:id]") %> :
        <%= orm_class.build(class_name, "params[:#{singular_table_name}]") %>
    end
end
<% end -%>
