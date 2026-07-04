{
  pkgs,
  llm-agents,
  ...
}:
{
  home.packages = with llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    claude-code
    antigravity-cli
    mistral-vibe
    copilot-cli
  ];
}
