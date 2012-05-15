format_taxon_autocomplete = function(data) {
  return '<div><h4>' + data['taxon']['name'] + '</h4></div>';
}

$.fn.taxon_autocomplete = function() {
  var token = encodeURIComponent($('meta[name=csrf-token]').attr('content'));
  var url = '/admin/taxons.json?authenticity_token=' + token;

  $(this).autocomplete(url, {
    parse: function(data) {
      return $.map(eval(data), function(row) {
        return {
          data: { taxon: row },
          value: row['name'],
          result: row['name']
        }
      })
    },
    formatItem: function(data) {
      return format_taxon_autocomplete(data);
    }
  }).result(function(event, data, formatted) {
    if (data) {
      $('#add_taxon_id').val(data['taxon']['id']);
    }
  });
}

$(document).ready(function() {
  $('#add_taxon_name').taxon_autocomplete();
});
