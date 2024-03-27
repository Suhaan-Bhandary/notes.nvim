> !IMPORTANT
> Plugin is working properly but some features are in development.

# Notes Neovim

Plugin to maintain separate notes for each project. It creates a markdown file for each project and can be accessed from it.
Root directory is used to define a project.

![preview](./assets/demo.png)

## Contents

- [Features](#features)
- [Installation](#installation)
- [Contributing](#contributing)

## Features

- Open a markdown file to store Notes of the project.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
    "Suhaan-Bhandary/notes.nvim",
    lazy = false,
}
```

Set keymap to open notes:

```lua
-- Notes for each project
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua require(\"notes\").OpenNotes()<CR>", { noremap = true })
```

## Contributing

Feature and pull requests are welcome.
