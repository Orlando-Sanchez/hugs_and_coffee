function validateForm() {
	var fullname = document.forms["profile-form"]["fullname"].value;
	// var occupation = document.forms["profile-form"]["occupation"].value;
	// var biography = document.forms["profile-form"]["biography"].value;
  // var coffee_price = document.forms["profile-form"]["coffee_price"].value;
  // var currency_sign = document.forms["profile-form"]["currency_sign"].value;

  if (fullname.length<1) {
    document.getElementById('error-fullname').innerHTML = "El campo es obligatorio"
  }
  if(fullname.length<1){
    return false;
  }
}

// 	if (fullname.length<1) {
//         document.getElementById('error-name').innerHTML = " Please Enter Your Name *"
//     }
//   if (occupation.length<1) {
//       document.getElementById('error-occupation').innerHTML = " Please Enter Your occupation *";
//   }
//   if (biography.length<1) {
//       document.getElementById('error-biography').innerHTML = " Please Enter Your biography *";      
//   }
//   if (coffee_price.length<1) {
//       document.getElementById('error-message').innerHTML = " Please Enter Your Message *";
//   }      
//   if (currency_sign.length<1) {
//     document.getElementById('error-message').innerHTML = " Please Enter Your Message *";
//   }     
//   if(fullname.length<1 || occupation.length<1 || biography.length<1 || coffee_price.length<1 || currency_sign.length<1){
//     return false;
//   }            
// }
