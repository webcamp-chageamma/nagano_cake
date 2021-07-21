module Admin::CommoditiesHelper
  
  def commodity_button
    if action_name == "new"
      "新規登録"
    elsif action_name == "edit"
      "変更を保存"
    end
  end
  
  
end
