const pay = () => {
  const pullDownButton = document.getElementById("lists");
  const pullDownParents = document.getElementById("pull-down");

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#c1e1c1;");
  });
  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#afda9b;");
  });
  pullDownButton.addEventListener('click', function(){
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  });
};

// window.addEventListener("load", pay);