class TagsController < ApplicationController
  def update
    tag = Tag.find(params[:id])

    if tag.update(tag_params)
      redirect_to spaces_path, notice: "Tag Updated!"
    else
      notice: "sumins rong"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :tag_fg, :tag_bg)
  end
end