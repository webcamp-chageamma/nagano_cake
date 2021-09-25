module Public::DestinationsHelper

  def button_text
    if action_name.in?(['index', 'create'])
      "新規登録"
    elsif action_name.in?(['edit', 'update'])
      "変更内容を保存"
    end
  end
end
