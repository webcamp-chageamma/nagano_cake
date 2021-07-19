module Public::DestinationsHelper

  def button_text
    if action_name == "index"
      "新規登録"
    elsif action_name == "edit"
      "変更内容を保存"
    end
  end
end
