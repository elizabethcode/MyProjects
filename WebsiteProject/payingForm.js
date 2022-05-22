function validation()
{
	var owner = document.getElementById("owner");
	var CVV = document.getElementById("CVV");
	var cardNum = document.getElementById("cardNumber");
	var exMonth = document.getElementById("expiryMonth");
	var exYear = document.getElementById("expiryYear");
	
	if(owner.value =="" || CVV.value.trim() =="" || cardNum.value.trim()==""size=="16" || exMonth.value.trim() =="" || exYear.value.trim()=="")
	{
		alert("Your payment method was declined. Please fill in all of the boxes or update your information. ");
		return false;
	} else
	{
		true;
	}
	
	/* when the boxes are not filled in popup message */
	if(owner.value=="")
	{
		alert("Blank Username");
		return false;
	} 
	else if(CVV.value.trim()=="")
	{
		alert("Blank CVV");
		return false;
	} 
	else if(cardNum.value.trim()=="")
	{
		alert("Blank Card Number");
		return false;
	} 
	else if(exMonth.value.trim()=="")
	{
		alert("Blank Expiry Month");
		return false;
	} 
	else if(exYear.value.trim()=="")
	{
		alert("Blank Expiry Year");
		return false;
	} 
	
	/* determining the length of the inputs */
	else if (CVV.value.trim().length<5)
	{
		alert("Invalid CVV");
		return false;
	}
	else if (CVV.value.trim().length<5)
	{
		alert("Invalid CVV");
		return false;
	}
	else if (cardNum.value.trim().length<16)
	{
		alert("Invalid Card Number");
		return false;
	}
	else if (exMonth.value.trim().length<2)
	{
		alert("Invalid Month");
		return false;
	}
	else if (exYear.value.trim().length<2)
	{
		alert("Invalid Year");
		return false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

































/* $(function() {

    const owner = $('#owner');
    const cardNumber = $('#cardNumber');
    const cardNumberField = $('#card-number-field');
    const CVV = $("#cvv");
    const mastercard = $("#mastercard");
    const confirmButton = $('#confirm-purchase');
    const visa = $("#visa");
    const amex = $("#amex");

    // Use the payform library to format and validate
    // the payment fields.

    cardNumber.payform('formatCardNumber');
    CVV.payform('formatCardCVC');


    cardNumber.keyup(function() {

        amex.removeClass('transparent');
        visa.removeClass('transparent');
        mastercard.removeClass('transparent');

        if ($.payform.validateCardNumber(cardNumber.val()) == false) {
            cardNumberField.addClass('has-error');
        } else {
            cardNumberField.removeClass('has-error');
            cardNumberField.addClass('has-success');
        }

        if ($.payform.parseCardType(cardNumber.val()) == 'visa') {
            mastercard.addClass('transparent');
            amex.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) == 'amex') {
            mastercard.addClass('transparent');
            visa.addClass('transparent');
        } else if ($.payform.parseCardType(cardNumber.val()) == 'mastercard') {
            amex.addClass('transparent');
            visa.addClass('transparent');
        }
    });

    confirmButton.click(function(e) {

        e.preventDefault();

        const isCardValid = $.payform.validateCardNumber(cardNumber.val());
        const isCvvValid = $.payform.validateCardCVC(CVV.val());

        if(owner.val().length < 5){
            alert("Wrong owner name");
        } else if (!isCardValid) {
            alert("Wrong card number");
        } else if (!isCvvValid) {
            alert("Wrong CVV");
        } else {
            // Everything is correct. Add your form submission code here.
            alert("Everything is correct");
        }
    });
});
 */