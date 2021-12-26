-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mike/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/mike/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/mike/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/mike/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mike/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["github-nvim-theme"] = {
    config = { "\27LJ\1\2£\1\0\0\3\0\n\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\a\0003\2\b\0:\2\t\1>\0\2\1G\0\1\0\vcolors\1\0\1\17bg_highlight\f#f6f8fa\1\0\1\16theme_style\nlight\nsetup\17github-theme\frequire\nlight\15background\bopt\bvim\0" },
    loaded = true,
    path = "/home/mike/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2†\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\3\25component_separators\5\23section_separators\5\ntheme\vgithub\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/mike/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mike/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mike/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/mike/.local/share/nvim/site/pack/packer/start/vim-terraform"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2†\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\3\25component_separators\5\23section_separators\5\ntheme\vgithub\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
try_loadstring("\27LJ\1\2£\1\0\0\3\0\n\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0003\1\a\0003\2\b\0:\2\t\1>\0\2\1G\0\1\0\vcolors\1\0\1\17bg_highlight\f#f6f8fa\1\0\1\16theme_style\nlight\nsetup\17github-theme\frequire\nlight\15background\bopt\bvim\0", "config", "github-nvim-theme")
time([[Config for github-nvim-theme]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
