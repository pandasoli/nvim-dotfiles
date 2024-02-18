local jdtls = require 'jdtls'

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require 'jdtls.setup'.find_root(root_markers)

local workspace_folder = '/home/panda/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require 'cmp_nvim_lsp'.default_capabilities(capabilities)

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  on_attach = nil,
  root_dir = root_dir,
	capabilities = capabilities,

  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
      -- Specify any completion options
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*'
        },
        filteredTypes = {
          'com.sun.*',
          'io.micrometer.shaded.*',
          'java.awt.*',
          'jdk.*', 'sun.*'
        }
      }
    }
  },
  cmd = {
		'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',

    '-jar', '/home/panda/.local/bin/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', '/home/panda/.local/bin/jdt-language-server-1.9.0-202203031534/config_linux',

    '-data', workspace_folder
  }
}

jdtls.start_or_attach(config)
