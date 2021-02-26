//inputSelector = input Jquery Selector =>  '.distinct' || '#distinct'
//labelId = ID label to show => '500/500'
//limit = limit of input => 500
//TODO: SOLO JAVASCRIP QUITAR JQUERY
function labelInputLengthLimit(inputSelector, labelId, limit) {
    $(inputSelector).keyup(event => {
        const countText = $('#' + labelId)
        let { value } = event.target
        value = (value.trim() === '') ? value.trim() : value;

        const textLength = value.length
        if (textLength > limit) {
            value = value.substring(0, limit)
        } else {
            countText.text(textLength + '/' + limit.toString())
        }
        event.target.value = value
    })
    const descriptionText = $(inputSelector).val()
    $('#' + labelId).text(descriptionText.length + '/' + limit.toString())
}