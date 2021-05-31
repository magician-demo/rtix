document.addEventListener('turbolinks:load', function () {
    $('#table_id').DataTable({
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "info":           false,
        responsive: true
    });
} );
