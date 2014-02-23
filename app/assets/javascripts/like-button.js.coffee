$ -> 
	$("#like-button").click ->
		id=$(this).data('blog')
		$.ajax({
			url: "#{id}/like"
			type: "put"
			success:() ->
				alert("ok")
		})