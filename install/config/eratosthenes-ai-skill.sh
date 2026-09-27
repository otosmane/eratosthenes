# Place in each assistant's global skills directory so the Eratosthenes skill is available on first install
mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$ERATOSTHENES_PATH/default/eratosthenes-skill" ~/.agents/skills/eratosthenes
ln -sfn "$ERATOSTHENES_PATH/default/eratosthenes-skill" ~/.claude/skills/eratosthenes
ln -sfn "$ERATOSTHENES_PATH/default/eratosthenes-skill" ~/.codex/skills/eratosthenes
ln -sfn "$ERATOSTHENES_PATH/default/eratosthenes-skill" ~/.pi/agent/skills/eratosthenes
