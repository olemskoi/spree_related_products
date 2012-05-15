Admin::TaxonsController.class_eval do
  before_filter :check_json_authenticity, :only => :index

  def index
    @collection = collection
    respond_with(@collection) do |format|
      format.json { render :json => json_data(@collection) }
    end
  end

  def related
    @taxon = Taxon.find params[:id]
    @relation_types = Taxon.relation_types
  end

  private

  def collection
    return [] unless params[:q]
    Taxon.where(["name like ?", "%#{params[:q]}%"]).uniq
  end

  def json_data(collection)
    collection.map { |t| { 'id' => t.id, 'name' => t.name } }.to_json
  end
end
