webpackJsonp([7],{0:function(e,t,r){"use strict";var i=r(1),s=r(142),o=r(272);i.render(s.createElement(o,{url:_url,redirect_url:_redirect_url,is_archived:_is_archived}),document.getElementById("toggle_button"))},272:function(e,t,r){(function(t){"use strict";var i=r(142);e.exports=i.createClass({displayName:"exports",archiveItem:function(){var e=this;t.ajax({url:this.props.url,type:"POST",data:{archive:!this.props.is_archived},success:function(t){window.location.href=e.props.redirect_url},error:function(e,t,r){window.alert("uh, oh. That didn't work."),console.log(e.status+": "+e.responseText)}})},render:function(){if(this.props.is_archived)var e="Restore",t="ui positive button";else var e="Remove",t="ui negative button";return i.createElement("div",{className:t,onClick:this.archiveItem},e)}})}).call(t,r(155))}});
//# sourceMappingURL=item_remove_button.js.map