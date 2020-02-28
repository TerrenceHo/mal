SRCS = step0_repl.hs
GHC = stack ghc --
# OTHER_SRCS = Readline.hs Types.hs Reader.hs Printer.hs Env.hs Core.hs
BINS = $(SRCS:%.hs=%)
ghc_flags = -Wall
HIST = ".mal_history"

all: $(BINS)

dist: mal

mal: $(word $(words $(BINS)),$(BINS))
	cp $< $@

$(BINS): %: %.hs $(OTHER_SRCS)
	$(GHC) ${ghc_flags} --make $< -o $@

clean:
	rm -f $(BINS) $(HIST) mal *.hi *.o
