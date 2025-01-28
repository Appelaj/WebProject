
    // const HM = document.querySelector("aside_half");
    // HM.style.visibility = "hidden";
    // document.querySelector("sidebar").style.visibility = "hidden"

function hide_menu(){
    const HM = document.querySelector("aside_half");
    const FM = document.querySelector("aside_full");
    FM.style.visibility = "hidden";
    HM.style.visibility = "visible";
  
}
function show_menu(){
    const HM = document.querySelector("aside_half");
    const FM = document.querySelector("aside_full");
    FM.style.visibility = "visible";
    HM.style.visibility = "hide";
  
}

function usermenu_show(){
    const sm = document.getElementsByClassName("user_menu");
    sm.style.visibility = "visible";
}

