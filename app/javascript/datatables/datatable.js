$(document).ready( function () {
    $('#table_id').DataTable({
        "scrollY":        "150px",
        "scrollCollapse": true,
        "paging":         false,
        "info":           false,
        responsive: true,
        "columnDefs": [
            { "width": "20%", "targets": 1 }
          ]
    });

} );







