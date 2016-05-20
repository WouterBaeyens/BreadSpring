jQuery(document).ready(function($) {
    $(".clickable-row").click(function(e) {
        if($(e.target).is('button')){
			return;
		}
		window.document.location = $(this).data('url');
                //post('/contact/', {name: 'Johnny Bravo'});        (example)
    });
});

// Post to the provided URL with the specified parameters.
function post(path, parameters) {
    var form = $('<form></form>');

    form.attr("method", "post");
    form.attr("action", path);

    $.each(parameters, function(key, value) {
        var field = $('<input></input>');

        field.attr("type", "hidden");
        field.attr("name", key);
        field.attr("value", value);

        form.append(field);
    });

    // The form needs to be a part of the document in
    // order for us to be able to submit it.
    $(document.body).append(form);
    form.submit();
}

//Modify the payment modal so it is linked to the person of which the (+)button is clicked
function setAddPaymentId(id){
    $('#addPaymentForm').attr('action','payment/add/' + id + '.htm');
}