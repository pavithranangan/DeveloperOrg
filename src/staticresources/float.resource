<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">                
        $(document).ready(function() {
			var objWindow = $(window);
			var floatingDiv = $('#floating');
			var footer = $('#footer');
			var didScroll = false;
			
			window.onscroll = function() {
				didScroll = true;
			}			
			
			setInterval(function() {
				if ( didScroll ) {
					didScroll = false;
					var footerOffset = footer.offset().top;
					if ((objWindow.height() + objWindow.scrollTop()) < footerOffset) {
						PositionFloatingDiv(floatingDiv, 'fixed', 'top', 'bottom', 0);
					} else {
						PositionFloatingDiv(floatingDiv, 'absolute', 'bottom', 'top', footerOffset);
					}					
				}
			}, 100);				
        });
		
		function PositionFloatingDiv(floatingDiv, positionType, positionToClear, positionToSet, value){
			floatingDiv.css('position', positionType);
			floatingDiv.css(positionToClear, '');
			floatingDiv.css(positionToSet, value + 'px');		
		}
    </script>