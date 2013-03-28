$ ->
	$(body).bind "keydown", (e) ->
		lastKeyPressCode = e.keyCode
		if(lastKeyPressCode == 32)
			text = $("#body").val().split(" ").filter((item)->
			  item != "" && item != null
			).reverse()[0]
			path = "/emails/check"
			params = { body: text }
			return if !text?
			$("#match-results").html(' ')
			$.post(
				"/emails/check"
				params
				((data) ->
			  	$("#match-results").append($("<p>").html(record.content)) for record in data
			  	)
			  "json"
			)