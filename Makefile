.PHONY: all
all: bat ripgrep fzf jq httpie ytfzf cheat filewatcher


.PHONY: bat
bat:
	cd bat && cargo install --force --locked bat


.PHONY: ripgrep
ripgrep:
	cd ripgrep && cargo install --force --locked ripgrep


.PHONY: fzf
fzf:
	cd fzf && ./install


.PHONY: jq
jq:
	cd jq && git submodule update --init && autoreconf -fi && ./configure --with-oniguruma=builtin --disable-maintainer-mode --prefix=$(HOME) && make && make install


.PHONY: httpie
httpie:
	cd httpie && python3 -m pip install .


.PHONY: ytfzf
ytfzf:
	sudo apt install -y youtube-dl
	cp ./ytfzf/ytfzf ~/src/bin/ytfzf
	chmod +x ~/src/bin/ytfzf


.PHONY: cheat
cheat:
	cp ./cheat.sh/share/cht.sh.txt ~/src/bin/cht
	chmod +x ~/src/bin/cht


.PHONY: filewatcher
filewatcher:
	cd filewatcher && go build -o ~/src/bin/filewatcher
