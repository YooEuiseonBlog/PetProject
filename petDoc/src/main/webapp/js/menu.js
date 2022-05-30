const list = document.querySelectorAll('.list');
function activeLink() {
    list.forEach((item) =>
    item.classList.remove('active'));
    this.classList.add('active');
}

list.forEach((item) =>
    item.addEventListener('click', activeLink));
    
const Top1 = document.querySelector('.Top_logo');  
const Top2 = document.querySelector('#Top_profile');
const Top3 = document.querySelector('#Top_info');  
 function changeOpacity1(){
	Top1.style.opacity = "0.0";
	Top2.style.opacity = "0.0";
	Top3.style.opacity = "0.0";
}

function changeOpacity2(){
	Top1.style.opacity = "1";
	Top2.style.opacity = "1";
	Top3.style.opacity = "1";
}

const con = document.querySelector('.Top_container');

con.onmouseover=changeOpacity2;
con.onmouseout=changeOpacity1;
