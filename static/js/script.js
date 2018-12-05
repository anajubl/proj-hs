function mostra(){
    var d1 = document.getElementById("d1");
    d1.addEventListener("click",function(evt){
       alert(evt.target.innerHTML); 
    });
}

window.onload = mostra;