class Admin::RelationsController < Admin::BaseController
  before_filter :load_data, :only => [:create, :destroy]

  respond_to :js

  def create
    @relation = Relation.new(params[:relation])
    @relation.relatable = @taxon
    @relation.related_to = Taxon.find(params[:relation][:related_to_id])
    @relation.save
    respond_with(@relation)
  end

  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_with(@relation)
  end

  private

    def load_data
      @taxon = Taxon.find(params[:taxon_id])
    end

end
