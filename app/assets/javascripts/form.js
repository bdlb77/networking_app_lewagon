

if(document.location.pathname == "/contacts/new"){
  console.log("IT worked!");
Array.from(document.getElementById('form_s').children).forEach(function(option){
  if(option.value == 'show'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('location_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('location_dropdown').style.display = 'none';
    })

  }
});


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('form_s').options[document.getElementById('form_s').selectedIndex].value == 'Add another location'){

  }
  else{
    document.getElementById('location_dropdown').value = document.getElementById('form_s').options[document.getElementById('form_s').selectedIndex].value
  }
  document.getElementById('submit_button').click()
});


}
