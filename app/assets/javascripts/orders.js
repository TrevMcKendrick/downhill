$(document).ready(function() { 
  $("#join_team").select2();

    $("input[name='team']").change(function(){
        // alert("yes1"); 
      if ($("#team_Join_Team").is(':checked')) 
      {
        $('#s2id_join_team').show();
        $('#create_team').hide();
      }
      else if ($("#team_No_Team").is(':checked')) {
        $('#s2id_join_team').hide();
        $('#create_team').hide();
      }
      else {
        $('#s2id_join_team').hide();
        $('#create_team').show();
      }
     
  });
});