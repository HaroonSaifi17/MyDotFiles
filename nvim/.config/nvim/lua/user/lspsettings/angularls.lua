local util = require("lspconfig.util")

return {
  root_dir = function(fname)
    return util.root_pattern("angular.json")(fname) or util.root_pattern("project.json")(fname)
  end,
}
