$ -> 
	$("#like-button").click ->
		id=$(this).data('blog')
		$.ajax({
			url: "#{id}/like"
			type: "put"
			success:() ->
				$("#like-button").effect('bounce', {times: 5}, 'slow')
		})