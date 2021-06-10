document.addEventListener("turbolinks:load", function(){ 
  if($("#q")){
  let options = {
    url: function(phrase) {
      return "/events/search.json?q=" + phrase
    },
    getValue: "title",
    placeholder: '搜尋活動',
    list: {
      onChooseEvent: function() {
        let url = $("#q").getSelectedItemData().url
        $("#q").val("")
        Turbolinks.visit(url)
      }
    }
  }
  $("#q").easyAutocomplete(options)
  }
})