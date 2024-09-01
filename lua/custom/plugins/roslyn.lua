return {
  'seblj/roslyn.nvim',
  ft = { 'cs', 'sln', 'fs', 'cshtml' },
  opts = {
    exe = {
      'dotnet',
      vim.fs.joinpath(vim.fn.stdpath 'data', 'roslyn', 'Microsoft.CodeAnalysis.LanguageServer.dll'),
    },
    filewatching = true,
  },
}
