$(document).ready(function() {
    // Update button click handler
    $('.update-btn').click(function() {
        var propertyId = $(this).data('property-id');
        // AJAX request to fetch property details
        $.get('fetch-property?id=' + propertyId, function(data) {
            // Populate update form with fetched data
            $('#type').val(data.type);
            $('#price').val(data.price);
            $('#address').val(data.address);
            $('#image').val(data.image);
            $('#description').val(data.description);
            $('#favorite').prop('checked', data.favorite);
            // Show update modal
            $('#updateModal').modal('show');
        });
    });

    // Delete button click handler
    $('.delete-btn').click(function() {
        var propertyId = $(this).data('property-id');
        // Show delete confirmation modal
        $('#deleteModal').modal('show');
        // On confirmation, send AJAX request to delete property
        $('#confirmDelete').click(function() {
            $.post('delete-property', { id: propertyId }, function(data) {
                // Handle response, e.g., refresh DataTable
                // Hide delete confirmation modal
                $('#deleteModal').modal('hide');
            });
        });
    });
});




 