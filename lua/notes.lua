local utils = require("notes-utils")

local data_path = "~"
local notes_files_dir = string.format("%s/nvim-notes", data_path)

local M = {}

M.setup = function()
    print("Files are stored in:", notes_files_dir)
end

M.OpenNotes = function()
    -- Create directory to store files
    utils.createDirectoryIfNotExists(notes_files_dir)

    -- Get the file path
    local notes_file_path = utils.getFilePathFromRootDir(notes_files_dir)
    utils.createFileIfNotPresent(notes_file_path)

    -- Open file in a vertical split
    utils.openFileInVerticalSplit(notes_file_path)
end

M.CloseNotes = function()
    -- Get the file path
    local notes_file_path = utils.getFilePathFromRootDir(notes_files_dir)

    utils.saveAndCloseBufferWithFilePath(notes_file_path)
end

M.ToggleNotes = function()
    -- Get the file path
    local notes_file_path = utils.getFilePathFromRootDir(notes_files_dir)

    local isOpen = utils.isBufferOpen(notes_file_path)
    if isOpen then
        M.CloseNotes()
    else
        M.OpenNotes()
    end
end

M.ViewAllNotes = function()
    require("telescope.builtin").find_files({ cwd = notes_files_dir })
end

return M
