all:
	stow --verbose --target=$$HOME/.config --no-folding --restow .config*/

delete:
	stow --verbose --target=$$HOME/.config --delete .config*/
