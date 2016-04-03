update-plugins:
	NORC=1 vim -E -u test.vimrc -S plugins.vim +PlugUpdate +qall > /dev/null || true

test: update-plugins
	vroom -u test.vimrc --system-strictness RELAXED --crawl tests
