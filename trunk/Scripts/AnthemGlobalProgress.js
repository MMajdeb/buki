// JScript File
   
        //functions used for the progress control 
        function getPageScrollTop(){ 
          var yScrolltop; 
          if (self.pageYOffset) { 
            yScrolltop = self.pageYOffset; 
          } else if (document.documentElement && document.documentElement.scrollTop){   // Explorer 6 Strict 
            yScrolltop = document.documentElement.scrollTop; 
          } else if (document.body) {// all other Explorers 
            yScrolltop = document.body.scrollTop; 
          } 
          return yScrolltop; 
        } 

        function getPageScrollLeft(){ 
          var xScrollleft; 
          if (self.pageXOffset) { 
            xScrollleft = self.pageXOffset; 
          } else if (document.documentElement && document.documentElement.scrollLeft ){   // Explorer 6 Strict 
            xScrollleft = document.documentElement.scrollLeft; 
          } else if (document.body) {// all other Explorers 
            xScrollleft = document.body.scrollLeft; 
          } 
          return xScrollleft; 
        } 
        function getPageWidth(){ 
          var de = document.documentElement; 
          var w = (de&&de.clientWidth) || document.body.clientWidth || window.innerWidth || self.innerWidth; 
          return w; 
        } 
        function getPageHeight(){ 
          var de = document.documentElement; 
          var h = (de&&de.clientHeight) || document.body.clientHeight || window.innerHeight || self.innerHeight; 
          return h; 
        } 

        function getMousePosX(e){ 
          var posx = 0; 
          if (!e){ e = window.event; } 
          if (e.pageX) { 
            posx = e.pageX; 
          } 
          else if (e.clientX) { 
            posx = e.clientX + getPageScrollLeft(); 
          } 
          return posx; 
        } 

        function getMousePosY(e){ 
          var posy = 0; 
          if (!e){ e = window.event; } 
          if (e.pageY) { 
            posy = e.pageY; 
          } 
          else if (e.clientY) { 
            posy = e.clientY + getPageScrollTop(); 
          } 
          return posy; 
        }
        
        function getMainFolder(){
            var theFoldArr=location.pathname.split("/");
            return theFoldArr[1];
        }        
    
    
		function Anthem_PreCallBack() {
			var loading = document.createElement("div");
			loading.id = "loading";
			loading.style.color = "black";
			loading.style.backgroundColor = "infobackground";
			loading.style.border = "activecaption 1px dotted";			
			loading.style.paddingLeft = "5px";
			loading.style.paddingRight = "5px";
			loading.style.paddingTop = "5px";
			loading.style.paddingBottom = "5px";
			loading.style.position = "absolute";
			loading.style.right = "4px";				
			loading.style.top = (getPageScrollTop() + 4) + "px";
			loading.style.top = '4px';
			loading.style.zIndex = "9999";
			loading.innerHTML = "<img src='/" + getMainFolder() + "/images/animated_bar_blue.gif' /><br />Contacting Server...<iframe style='display:block;position:absolute;top:0;left:0;z-index:-1;filter:mask();width:100%;height:100%;' frameborder=no scrolling=no></iframe>";					
			document.body.appendChild(loading);				
		}
		function Anthem_PostCallBack() {
			var loading = document.getElementById("loading");
			document.body.removeChild(loading);
		}
