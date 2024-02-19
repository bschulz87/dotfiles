all:
	stow --verbose --target=$$HOME/.config --no-folding --restow .config*/
	stow --verbose --target=$$HOME --restow home

delete:
	stow --verbose --target=$$HOME/.config --delete .config*/
	stow --verbose --target=$$HOME --delete home
