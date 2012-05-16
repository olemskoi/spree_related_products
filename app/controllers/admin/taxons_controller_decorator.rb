Admin::TaxonsController.class_eval do
  def related
    @taxon = Taxon.find params[:id]
    @relation_types = Taxon.relation_types
  end
end
