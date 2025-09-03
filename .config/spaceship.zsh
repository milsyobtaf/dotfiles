# ORDER
SPACESHIP_PROMPT_ORDER=(
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status + [git_commit](default off))
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
  red            # Red section
  elm            # Elm section
  elixir         # Elixir section
  xcode          # Xcode section
  xcenv          # xcenv section
  swift          # Swift section
  swiftenv       # swiftenv section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  haskell        # Haskell Stack section
  scala          # Scala section
  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  julia          # Julia section
  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  venv           # virtualenv section
  conda          # conda virtualenv section
  uv             # uv virtualenv section
  dotnet         # .NET section
  ocaml          # OCaml section
  vlang          # V section
  zig            # Zig section
  purescript     # PureScript section
  erlang         # Erlang section
  gleam          # Gleam section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  async          # Async jobs indicator
  line_sep       # Line break
  battery        # Battery level and status
  sudo           # Sudo indicator
  char           # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exec_time      # Execution time
  time           # Time stamps section
  jobs           # Background jobs indicator
  exit_code      # Exit code section
)

# Enable prefixes in RPROMPT
SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW=true

# Spaceship prompt settings
SPACESHIP_CHAR_SYMBOL="💰 "
SPACESHIP_PROMPT_SEPARATE_LINE=true

# Display of time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_PREFIX=""
SPACESHIP_TIME_COLOR="white"

# Display of execution time
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="that took "
SPACESHIP_EXEC_TIME_SUFFIX=" at "
SPACESHIP_EXEC_TIME_COLOR="blue"
SPACESHIP_EXEC_TIME_PRECISION=0
