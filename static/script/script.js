
    // const HM = document.querySelector("aside_half");
    // HM.style.visibility = "hidden";
    // document.querySelector("sidebar").style.visibility = "hidden"

function hide_menu(){
    const HM = document.querySelector("aside_half")
    const FM = document.querySelector("aside_full")
    const Post_css = document.getElementsByClassName('post')
    FM.style.visibility = "hidden";
    HM.style.visibility = "visible";
    // Post_css.style.background-color = 'black';
    console.log(1)
  
}
function show_menu(){
    const HM = document.querySelector("aside_half")
    const FM = document.querySelector("aside_full")
    // const post_css = document.getElementsByClassName("post");
    FM.style.visibility = "visible";
    HM.style.visibility = "hide";
    
    console.log(1)
}

function usermenu_show(){
    const menu = document.querySelector("usermenu");
    if(menu.style.visibility == "hidden"){
        menu.style.visibility = "visible";
        console.log(1);
    }else{
        menu.style.visibility = "hidden";
        console.log(2);
    }
    
  
}

