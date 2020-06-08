
$(function () {
  function buildHTML(message) {
    let html = `<div class="pay-categories-menus__pay-categories-menu">
                  <div class="pay-category-color" style="color:${pay_category.color}">
                    ${pay_category.name}
                  </div>
                </div>`
    return html;  
  }

  $("#pay-category-form").on("submit", function (e) {
    e.preventDefault()
    console.log(this)
    let formData = new FormData(this);
    let url = $(this).attr("action")
    $.ajax({
      url:  "/pay_categories.js",
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function (data) {
      let html = buildHTML(data);
      $('.pay-categories-menus').append(html);
      $('form')[0].reset();
      $('.form__submit').prop("disabled", false);

    })
    .fail(function () {
      alert("メッセージ送信に失敗しました");
    });
  });
});

