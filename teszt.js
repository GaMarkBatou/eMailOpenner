

/* inputElement.addEventListener('input', function(event) {
    const inputValue = event.target.value;
	console.log('01'); 
    const replacedValue = inputValue.replace(/THX/g, 'Thank you in advance');
	console.log('02'); 
    event.target.value = replacedValue;
	
	//--
	
	const initialValue = inputElement.value;
	console.log('03'); 
    const replacedInitialValue = initialValue.replace(/THX/g, 'Thank you in advance');
	console.log('04'); 
    inputElement.value = replacedInitialValue;
	
}); */

const inputElement = document.getElementById('yourInputId');
//const inputElement = document.querySelectorAll('input');


 inputElement.addEventListener('input', function(event) {
            const inputValue = event.target.value;
			let replacedValue = inputValue;
            replacedValue = replacedValue.replace(/THX/gi, 'Thank you in advance');
			replacedValue = replacedValue.replace(/WTF/gi, 'What the ...');
			replacedValue = replacedValue.replace(/GB/gi, 'Good bye');
            event.target.value = replacedValue;
        });
