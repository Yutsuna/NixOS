{
  config,
  pkgs,
  lib,
  llm-agents,
  ...
}:
{
  home.packages = [
    llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.claude-code
    pkgs.clang-tools
  ];

  home.activation.claudePlugins = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    CLAUDE_DIR="${config.home.homeDirectory}/.claude"
    PLUGINS_DIR="$CLAUDE_DIR/plugins"

    $DRY_RUN_CMD mkdir -p "$PLUGINS_DIR"

    for f in "$CLAUDE_DIR/settings.json" "$PLUGINS_DIR/installed_plugins.json" "$PLUGINS_DIR/known_marketplaces.json"; do
      if [ -L "$f" ]; then
        $DRY_RUN_CMD rm -f "$f"
      fi
    done

    $DRY_RUN_CMD cat << 'EOF' > "$PLUGINS_DIR/known_marketplaces.json"
    {
      "claude-plugins-official": {
        "source": {
          "source": "github",
          "repo": "anthropics/claude-plugins-official"
        },
        "installLocation": "${config.home.homeDirectory}/.claude/plugins/marketplaces/claude-plugins-official",
        "lastUpdated": "2026-07-18T14:05:03.748Z"
      }
    }
    EOF
    $DRY_RUN_CMD chmod 644 "$PLUGINS_DIR/known_marketplaces.json"

    if [ ! -f "$CLAUDE_DIR/settings.json" ]; then
      $DRY_RUN_CMD cat << 'EOF' > "$CLAUDE_DIR/settings.json"
    {
      "model": "claude-fable-5[1m]",
      "theme": "dark-ansi",
      "enabledPlugins": {
        "clangd-lsp@claude-plugins-official": true
      }
    }
    EOF
    fi
    $DRY_RUN_CMD chmod 644 "$CLAUDE_DIR/settings.json"

    $DRY_RUN_CMD cat << 'EOF' > "$PLUGINS_DIR/installed_plugins.json"
    {
      "plugins": {
        "clangd-lsp@claude-plugins-official": [
          {
            "scope": "user",
            "name": "clangd-lsp",
            "marketplace": "claude-plugins-official",
            "version": "1.0.0",
            "enabled": true
          }
        ]
      }
    }
    EOF
    $DRY_RUN_CMD chmod 644 "$PLUGINS_DIR/installed_plugins.json"
  '';
}
