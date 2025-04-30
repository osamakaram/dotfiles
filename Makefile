.PHONY: install defaults apply sync check

install:
	./bootstrap.sh

defaults:
	./scripts/macos-defaults.sh

apply:
	chezmoi apply

sync:
	brew bundle --file Brewfile
	chezmoi update && chezmoi apply
  
check:
	@echo "» Running syntax checks"
	@bash -n bootstrap.sh
	@bash -n scripts/macos-defaults.sh
	@echo "» Validating Brewfile (requires Homebrew)"
	@if command -v brew >/dev/null 2>&1; then \
		brew bundle check --file Brewfile; \
	else \
		echo "⚠️  brew not installed; skipping Brewfile check"; \
	fi
	@echo "» Validating chezmoi configuration"
	@if command -v chezmoi >/dev/null 2>&1; then \
		chezmoi init --source=. --verbose --dry-run; \
	else \
		echo "⚠️  chezmoi not installed; skipping chezmoi check"; \
	fi
	@echo "» Rendering chezmoi.yaml template"
	@if command -v chezmoi >/dev/null 2>&1; then \
		chezmoi execute-template < chezmoi.yaml.templ > /dev/null; \
	else \
		echo "⚠️  chezmoi not installed; skipping template render"; \
	fi
	@echo "✅  All checks passed (or were skipped intentionally)."