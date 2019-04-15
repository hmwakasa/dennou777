#
#	$Id: Makefile,v 1.13 2001/04/03 13:18:39 mym Exp $
#	Makefile for Dennou style 
#	Copyright (c) 2001 Manabu YAMADA, all rights reserved.
#
#

#
# マクロ定義
#

TEXMF_DIR=texmf/tex/generic/dennou-sty-6
DOCUMENT_DIR=doc/dennou-sty-6

INST_DIR=$(DESTDIR)/$(TEXMF_DIR)


#
#
#
all: generate 


generate: 
	platex Dennou6.ins
	

doc:
	platex Dennou.drv
	makeindex -s gind.ist Dennou
	makeindex -s gglo.ist -o Dennou.gls Dennou.glo
	platex Dennou.drv

doc-dev:
	platex Dennou-dev.drv
	makeindex -s gind.ist Dennou-dev
	makeindex -s gglo.ist -o Dennou-dev.gls Dennou.glo
	platex Dennou-dev.drv


mkdir:
	test -d $(INST_DIR) || install -d  $(INST_DIR)

install: mkdir
	cp *.sty $(INST_DIR)
	cp *.dvi $(DESTDIR)/$(DOCUMENT_DIR)
	texhash


tar: 
	cd ../../; tar cvfz dennou_sty.tar.gz  dennou_sty_6

clean:
	rm -f *.toc *.ilg *.log *.ist *.glo *.gls *.aux *.sty *.drv *.dvi *.idx *.ind

