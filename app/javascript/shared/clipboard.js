import Clipboard from 'clipboard'
$(function(){
  const cp = new Clipboard('.clipboard-btn');
  cp.on( "success", function() {
    alert( "コピーしました！" ) ;
  } ) ;
});