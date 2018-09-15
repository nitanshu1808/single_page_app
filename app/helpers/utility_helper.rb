module UtilityHelper
  def login_link
    link_to "javascript:void(0)" do
      icon("glyphicon-log-in") + I18n.t("login")
    end
  end

  def signup_link
    link_to "javascript:void(0)", class: "signup-btn" do
      icon("glyphicon-user") + I18n.t("sign_up")
    end
  end

  def icon(type)
    (content_tag( :span,class: "glyphicon #{type}") do "" end + " ").html_safe
  end

  def dynamic_title(title)
    content_for :title do  title  end
  end

end
