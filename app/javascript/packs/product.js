window.addEventListener("load", function() {
    
    /*var options = {
        data: ["John", "Paul", "George", "Ringo"]
};
$('#product').val('abc');
$('*[data-behavior="autocomplete"]').easyAutocomplete(options);*/

    $input = $('*[data-behavior="autocomplete"]')

    var options = {
        url: function(phrase) {
          return "/products/search.json?q=" + phrase;
        },
        getValue: "title",
        template: {
            type: "links",
            fields: {
                link: "link"
            }
          },
      };
    
      $input.easyAutocomplete(options);
    
    });
    