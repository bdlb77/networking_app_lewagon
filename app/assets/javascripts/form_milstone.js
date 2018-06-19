if(window.location.href.indexOf("contacts") > -1) {
  if(window.location.toString().includes("new") || window.location.toString().includes("edit")){
    console.log('heyyyy')
    console.log("IT worked!");
    document.getElementById('milestone_form_location').addEventListener("change", function(e) {update_location(e);});

    function update_location(e){
      let option = document.getElementById('milestone_form_location')[document.getElementById('milestone_form_location').selectedIndex];
      if (option.value == 'Choose_tag'){

    } else if(option.value == 'milestone_fake_location'){
          console.log("1");
          document.getElementById('milestone_location_dropdown').style.display = 'block';
    } else{

        console.log("2");
        document.getElementById('milestone_location_dropdown').style.display = 'none';
  }
}


  console.log("IT worked!");
  document.getElementById('milestone_form_tag1').addEventListener("change", function(e) {update_tag1(e);});

  function update_tag1(e){
    let option = document.getElementById('milestone_form_tag1')[document.getElementById('milestone_form_tag1').selectedIndex];
  if (option.value == 'Choose_tag'){

  } else if(option.value == 'milestone_fake_tag1'){
      console.log("1");
      document.getElementById('milestone_tag1_dropdown').style.display = 'block';

  } else{
      console.log("2");
      document.getElementById('milestone_tag1_dropdown').style.display = 'none';
  }
}




  console.log("IT worked!");
  document.getElementById('milestone_form_tag2').addEventListener("change", function(e) {update_tag2(e);});

  function update_tag2(e){
    let option = document.getElementById('milestone_form_tag2')[document.getElementById('milestone_form_tag2').selectedIndex];
  if (option.value == 'Choose_tag'){

  } else if(option.value == 'milestone_fake_tag2'){
      console.log("1");
      document.getElementById('milestone_tag2_dropdown').style.display = 'block';

  } else{
      console.log("2");
      document.getElementById('milestone_tag2_dropdown').style.display = 'none';

  }
}


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('milestone_form_location').options[document.getElementById('milestone_form_location').selectedIndex].value == 'Choose_location'){
  alert("Please choose a location")
  } else if (document.getElementById('milestone_contact_type').value == "" || document.getElementById('milestone_contact_type').value == 'Choose contact point*'){
  alert("Please choose contact point ")
  }else{
  if(document.getElementById('milestone_form_tag2').options[document.getElementById('milestone_form_tag2').selectedIndex].value == 'milestone_fake_tag2'){

  }
  else{
    document.getElementById('milestone_tag2_dropdown').value = document.getElementById('milestone_form_tag2').options[document.getElementById('milestone_form_tag2').selectedIndex].value
  }
   if(document.getElementById('milestone_form_tag1').options[document.getElementById('milestone_form_tag1').selectedIndex].value == 'milestone_fake_tag1'){

  }
  else{
    document.getElementById('milestone_tag1_dropdown').value = document.getElementById('milestone_form_tag1').options[document.getElementById('milestone_form_tag1').selectedIndex].value
  }
   if(document.getElementById('milestone_form_location').options[document.getElementById('milestone_form_location').selectedIndex].value == 'milestone_fake_location'){

  }
  else{
    document.getElementById('milestone_location_dropdown').value = document.getElementById('milestone_form_location').options[document.getElementById('milestone_form_location').selectedIndex].value
  }
  document.getElementById('submit_button').click()
}
});

//
  } else{

  }
}
