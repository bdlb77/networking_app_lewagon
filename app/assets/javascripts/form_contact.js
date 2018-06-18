

if(document.location.pathname == "/contacts/new"){
  console.log("IT worked!");
Array.from(document.getElementById('contact_form_location').children).forEach(function(option){
  if(option.value == 'contact_fake_location'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('contact_location_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('contact_location_dropdown').style.display = 'none';
    })

  }
});

}



if(document.location.pathname == "/contacts/new"){
  console.log("IT worked!");
Array.from(document.getElementById('contact_form_tag1').children).forEach(function(option){
  if(option.value == 'contact_fake_tag1'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('contact_tag1_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('contact_tag1_dropdown').style.display = 'none';
    })

  }
});

}




if(document.location.pathname == "/contacts/new"){
  console.log("IT worked!");
Array.from(document.getElementById('contact_form_tag2').children).forEach(function(option){
  if(option.value == 'contact_fake_tag2'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('contact_tag2_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('contact_tag2_dropdown').style.display = 'none';
    })

  }
});


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('contact_form_tag2').options[document.getElementById('contact_form_tag2').selectedIndex].value == 'contact_fake_tag2'){

  }
  else{
    document.getElementById('contact_tag2_dropdown').value = document.getElementById('contact_form_tag2').options[document.getElementById('contact_form_tag2').selectedIndex].value
  }
   if(document.getElementById('contact_form_location').options[document.getElementById('contact_form_location').selectedIndex].value == 'contact_fake_location'){

  }
  else{
    document.getElementById('contact_location_dropdown').value = document.getElementById('contact_form_location').options[document.getElementById('contact_form_location').selectedIndex].value
  }
  if(document.getElementById('contact_form_tag1').options[document.getElementById('contact_form_tag1').selectedIndex].value == 'contact_fake_tag1'){

  }
  else{
    document.getElementById('contact_tag1_dropdown').value = document.getElementById('contact_form_tag1').options[document.getElementById('contact_form_tag1').selectedIndex].value
  }
  document.getElementById('submit_button').click()
});


}












