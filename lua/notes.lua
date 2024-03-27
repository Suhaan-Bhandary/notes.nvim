local utils = require("utils")

local data_path = vim.fn.stdpath("data")
local notes_files_dir = string.format("%s/notes-files", data_path)

local M = {}

M.setup = function()
    print("Files are stored in:", notes_files_dir)
end

M.OpenNotes = function()
    -- Create directory to store files
    utils.createDirectoryIfNotExists(notes_files_dir)

    -- Get the current root folder
    local root_dir = utils.getRootFolderName()

    -- Check if the notes file for it is available or not
    local notes_file_path = string.format("%s/%s.md", notes_files_dir, root_dir)
    utils.createFileIfNotPresent(notes_file_path)

    -- Open file in a vertical split
    utils.openFileInVerticalSplit(notes_file_path)
end

return M
