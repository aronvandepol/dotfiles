return {
	"shellRaining/hlchunk.nvim",
	event = "BufReadPost",
	config = function()
		require("configs.hlchunk")
	end,
}
