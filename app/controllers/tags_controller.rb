class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      clickup_service.update_tag(@tag.space_id, @tag.name, tag_params)
      redirect_to spaces_path, notice: "Tag Updated!"
    else
      redirect_to spaces_path, notice: "sumins rong"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tag_fg, :tag_bg)
  end

  def clickup_service
    @clickup_service ||= ClickupApiService.new
  end
end
