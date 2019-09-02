function check_PLP(){
var element=window.document.getElementsByClassName("panel-body cc_body").innerText;
var status;
if(element=="No Results Found"){
status="PLP not coming up";
}
else{status="PLP is good"}
return status;
}