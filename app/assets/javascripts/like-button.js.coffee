$ -> 
	$("#like-button").click ->
		$.ajax({
			url: "blogs/like"
			type: "put"
			success:() ->
        		alert("OK")
		})