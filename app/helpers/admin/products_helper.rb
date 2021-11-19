module Admin::ProductsHelper
  def button_text
    if action_name == "new"
      "新規登録"
    elsif action_name == "edit"
      "変更を保存"
    end
  end
end
