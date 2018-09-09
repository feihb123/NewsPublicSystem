window.onload=function(){
 var obtn=document.getElementById("btn");
 var clientHeight=document.documentElement.clientHeight||ocument.body.clientHeight;
 var isTop=true;
 var timer=null;
 window.onscroll=function(){
 var topH=document.documentElement.scrollTop||document.body.scrollTop;
 if(topH>clientHeight){
  obtn.style.display="block";
 }else{
  obtn.style.display="none";
 }
 }
 obtn.onclick=function(){
 timer=setInterval(function(){
  var topH=document.documentElement.scrollTop||document.body.scrollTop;
  var stepLength=Math.ceil(topH/5);
  document.documentElement.scrollTop=document.body.scrollTop=topH-stepLength;
  if(topH==0){
  clearInterval(timer);
  }
 },30);
 }
}