$(function() {
  setTimeout(function(){
    $('.flash-msg').slideUp(800);
  }, 1500);
});


window.onload = function() {
  $("#loader").hide();
}

$( document ).on('turbolinks:load', function() {
  $('#myModal').on('click', '.modal-body',  function() {
    $("#new_user").validate({
      rules: {
        "user[user_name]": {
          required: true,
          maxlength: 30
        },
        "user[email]": {
          required: true,
          maxlength: 30
        },
        "user[password]":{
          required: true
        }
      },
      messages: {
        "user[user_name]": {
            required:  I18n.t("web.enter_val", {val: I18n.t("model.user.user_name")}),
            maxlength: I18n.t("web.character_validation", {val: I18n.t("model.pokemon.height"), num: 30})
        },
        "user[email]": {
            required:  I18n.t("web.enter_val", {val: I18n.t("model.user.email")}),
            maxlength: I18n.t("web.character_validation", {val: I18n.t("model.pokemon.height"), num: 30})
        },
        "user[password]": {
            required:  I18n.t("web.enter_val", {val: I18n.t("model.user.password")})
        }
      }
    });
  });
})
