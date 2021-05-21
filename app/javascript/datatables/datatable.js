$(document).ready( function () {
  $('#table_id').DataTable({
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true,
      "columnDefs": [
        { "width": "20%", "targets": 3}
      ]
  });
} );



