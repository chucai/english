$ ->
	words = []
	word = ""
	last = null
	$(body).bind "keydown", (e) ->
		lastKeyPressCode = e.keyCode
		console.log words
		if(lastKeyPressCode >= 65 && lastKeyPressCode <= 90)
			value = String.fromCharCode(lastKeyPressCode).toLowerCase()
			word += value
			true
		else
			words.push word if word? && word != "" && word.length != 1
			word = ""
			size = words.length
			text = words[size-1]
			if(lastKeyPressCode == 32)
				return if last == text
				last = text
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
