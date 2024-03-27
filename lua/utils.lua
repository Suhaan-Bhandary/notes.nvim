local M = {}

M.createDirectoryIfNotExists = function(directory)
    os.execute("mkdir -p " .. directory)
end

local function getLastPathComponent(path)
    -- Split the path into components
    local components = vim.split(path, "/")

    -- Return the last component
    return components[#components]
end

M.getRootFolderName = function()
    local project_folder = vim.fn.getcwd()
    local root_dir = getLastPathComponent(project_folder)

    return root_dir
end

M.createFileIfNotPresent = function(file_path)
    local file = io.open(file_path, "a")
    if file then
        file:close()
    else
        print("Failed to create file:", file_path)
    end
end

M.openFileInVerticalSplit = function(file_path)
    local file_open_command = string.format("rightbelow vsplit %s", file_path)
    vim.cmd(file_open_command)
end

return M
