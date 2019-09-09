$(document).ready(function () {
  $('#example').DataTable({
    "pagingType": "full_numbers",
    "lengthMenu": [[6, 12, 24, -1], [6, 12, 24, "All"]]
  });
});