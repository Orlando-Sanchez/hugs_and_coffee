var isPublished = null;
var profileId = null;
var buttonClickable = null;
var toggleBtn = null;
var btnLabel = null;

document.addEventListener("turbolinks:load", function() {
  let innerCircle = document.querySelector('#inner_circle');
  toggleBtn = document.querySelector('#toggle_btn');
  btnLabel = document.querySelector('#btn_label');
  buttonClickable = document.querySelector('#btn-wrapper');

  if (buttonClickable && innerCircle) {
    isPublished = innerCircle.dataset['ispublished'] == 'true';
    profileId = innerCircle.dataset.id;
    buttonClickable.addEventListener('click', handleToggle);
  };

  if (toggleBtn && btnLabel) {
    if (isPublished == true) {
      toggleBtn.classList.add('active');
      btnLabel.innerText = "Despublicar perfil";
    } else {
      btnLabel.innerText = "Publicar perfil";
    };
  };
});

let handleToggle = () => {
  console.log('click');
  buttonClickable.style.pointerEvents = "none";
  var url = 'http://127.0.0.1:3000/toggle_profile';
  var data = { id: profileId, is_published: !isPublished };
  fetch(url, {
    method: 'PUT', // or 'PUT'
    body: JSON.stringify(data), // data can be `string` or {object}!
    headers:{
      'Content-Type': 'application/json'
    }
  }).then(res => res.json())
  .then(response => {
    if (response.result === true) {
      isPublished = response.profile.is_published;
      if (isPublished == true) {
        toggleBtn.classList.add('active');
        btnLabel.innerText = "Despublicar perfil";
      } else {
        toggleBtn.classList.remove('active');
        btnLabel.innerText = "Publicar perfil";
      };
      buttonClickable.style.pointerEvents = "auto";
      console.log('success');
      // Mostrar success en una notificacion
    }
  })
  .catch(error => {
    console.error('Error:', error)
    buttonClickable.style.pointerEvents = "auto";
    // Mostrar error en una notificacion
  })
}