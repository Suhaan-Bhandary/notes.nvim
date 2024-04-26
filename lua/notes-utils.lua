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

local function getRootFolderName()
    local project_folder = vim.fn.getcwd()
    local root_dir = getLastPathComponent(project_folder)

    return root_dir
end

M.getFilePathFromRootDir = function(notes_files_dir)
    -- Get the current root folder
    local root_dir = getRootFolderName()

    -- Check if the notes file for it is available or not
    local notes_file_path = string.format("%s/%s.md", notes_files_dir, root_dir)

    return notes_file_path
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

M.saveAndCloseBufferWithFilePath = function(file_path)
    local buffers = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        local bufname = vim.fn.bufname(bufnr)
        if bufname == file_path then
            -- Save and close
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd('wq')
            end)

            -- Close the buffer
            vim.api.nvim_buf_delete(bufnr, { force = true })
            return
        end
    end
end

M.isBufferOpen = function(file_path)
    local buffers = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buffers) do
        local bufname = vim.fn.bufname(bufnr)
        if bufname == file_path then
            return true
        end
    end

    return false
end

return M
