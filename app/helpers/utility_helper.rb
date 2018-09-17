module UtilityHelper

  def login_out_link
    current_user && logout_link || login_link
  end

  def login_link
    link_to new_user_session_path, class: "login-btn", remote: true do
      icon("glyphicon-log-in") + I18n.t("login")
    end
  end

  def signup_link
    link_to new_user_registration_path, class: "signup-btn", remote: true do
      icon("glyphicon-user") + I18n.t("sign_up")
    end
  end

  def icon(type)
    (content_tag( :span,class: "glyphicon #{type}") do "" end + " ").html_safe
  end

  def dynamic_title(title)
    content_for :title do  title  end
  end

  def logout_link
    link_to destroy_user_session_path, method: :delete do
      icon("glyphicon-log-in") + I18n.t("logout")
    end    
  end

  def signup_link_and_welcm_msg
    (current_user && welcme_user) || signup_link
  end

  def welcme_user
    link_to "javascript:void(0)" do
      icon("glyphicon-user") + I18n.t("welcm_user", {val: current_user.user_name})
    end
  end

  def welcome_msg
    (current_user && I18n.t("welcome_user_message") )|| I18n.t("welcome_msg")
  end

end
