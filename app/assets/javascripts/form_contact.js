

if(document.location.pathname == "/contacts/new"){
  console.log("IT worked!");
  document.getElementById('contact_form_location').addEventListener("change", function(e) {update_contact_location(e);});

  function update_contact_location(e){
  let option = document.getElementById('contact_form_location')[document.getElementById('contact_form_location').selectedIndex];
  if (option.value == 'Choose_location'){

  } else if(option.value == 'contact_fake_location'){
      console.log("1");
      document.getElementById('contact_location_dropdown').style.display = 'block';

  } else{
      console.log("2");
      document.getElementById('contact_location_dropdown').style.display = 'none';
  }

}


  console.log("IT worked!");
  document.getElementById('contact_form_tag1').addEventListener("change", function(e) {update_contact_tag1(e);});

  function update_contact_tag1(e){
  let option = document.getElementById('contact_form_tag1')[document.getElementById('contact_form_tag1').selectedIndex];
  if (option.value == 'Choose_tag'){

  } else if(option.value == 'contact_fake_tag1'){
      console.log("1");
      document.getElementById('contact_tag1_dropdown').style.display = 'block';
  } else{
      console.log("2");
      document.getElementById('contact_tag1_dropdown').style.display = 'none';
  }
}



  console.log("IT worked!");
  document.getElementById('contact_form_tag2').addEventListener("change", function(e) {update_contact_tag2(e);});

  function update_contact_tag2(e){
  let option = document.getElementById('contact_form_tag2')[document.getElementById('contact_form_tag2').selectedIndex];
  if (option.value == 'Choose_tag'){

  } else if(option.value == 'contact_fake_tag2'){
      console.log("1");
      document.getElementById('contact_tag2_dropdown').style.display = 'block';
  } else{
      console.log("2");
      document.getElementById('contact_tag2_dropdown').style.display = 'none';
  }
}


document.getElementById('newbutton').addEventListener('click', function(){

  if(document.getElementById('contact_form_location').options[document.getElementById('contact_form_location').selectedIndex].value == 'Choose_location'){
  alert("Please choose a location")
  } else if (document.getElementById('contact_first_name').value == "" &&  document.getElementById('contact_last_name').value == ""){
  alert("Please enter first or last name ")
  } else if (document.getElementById('contact_first_contact_type').value == "" || document.getElementById('contact_first_contact_type').value == 'Choose contact point*'){
  alert("Please choose contact point ")
  }else{
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
}
});


}











