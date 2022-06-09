-- https://github.com/redhat-developer/yaml-language-server
return {
	settings = {
		yaml = {
			-- validate = false,
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			format = {
				enable = true,
				singleQuote = true,
			},
		},
	},
}
