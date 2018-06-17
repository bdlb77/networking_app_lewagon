if(window.location.href.indexOf("contacts") > -1) {
  if(window.location.toString().includes("new") || window.location.toString().includes("edit")){
    console.log('heyyyy')
    console.log("IT worked!");
    Array.from(document.getElementById('milestone_form_location').children).forEach(function(option){
    if(option.value == 'milestone_fake_location'){
        option.addEventListener('click', function(){
          console.log("1");
          document.getElementById('milestone_location_dropdown').style.display = 'block';
      })

    } else{
     option.addEventListener('click', function(){
        console.log("2");
        document.getElementById('milestone_location_dropdown').style.display = 'none';
      })

  }
});


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('milestone_form_location').options[document.getElementById('milestone_form_location').selectedIndex].value == 'milestone_fake_location'){

  }
  else{
    document.getElementById('milestone_location_dropdown').value = document.getElementById('milestone_form_location').options[document.getElementById('milestone_form_location').selectedIndex].value
  }
  document.getElementById('submit_button').click()
});







  console.log("IT worked!");
Array.from(document.getElementById('milestone_form_tag1').children).forEach(function(option){
  if(option.value == 'milestone_fake_tag1'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('milestone_tag1_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('milestone_tag1_dropdown').style.display = 'none';
    })

  }
});


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('milestone_form_tag1').options[document.getElementById('milestone_form_tag1').selectedIndex].value == 'milestone_fake_tag1'){

  }
  else{
    document.getElementById('milestone_tag1_dropdown').value = document.getElementById('milestone_form_tag1').options[document.getElementById('milestone_form_tag1').selectedIndex].value
  }
  document.getElementById('submit_button').click()
});







  console.log("IT worked!");
Array.from(document.getElementById('milestone_form_tag2').children).forEach(function(option){
  if(option.value == 'milestone_fake_tag2'){
    option.addEventListener('click', function(){
      console.log("1");
      document.getElementById('milestone_tag2_dropdown').style.display = 'block';
    })

  } else{
     option.addEventListener('click', function(){
      console.log("2");
      document.getElementById('milestone_tag2_dropdown').style.display = 'none';
    })

  }
});


document.getElementById('newbutton').addEventListener('click', function(){
  if(document.getElementById('milestone_form_tag2').options[document.getElementById('milestone_form_tag2').selectedIndex].value == 'milestone_fake_tag2'){

  }
  else{
    document.getElementById('milestone_tag2_dropdown').value = document.getElementById('milestone_form_tag2').options[document.getElementById('milestone_form_tag2').selectedIndex].value
  }
  document.getElementById('submit_button').click()
});

//
  } else{

  }
}
