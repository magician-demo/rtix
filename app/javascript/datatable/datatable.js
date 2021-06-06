import { $ } from 'datatables.net'
import { Responsive } from 'datatables.net-responsive'

document.addEventListener('turbolinks:load', function () {
    $('#table_id').DataTable({
        "scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        "info":           false,
        responsive: true
    });
} );
