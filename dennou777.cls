%%  地球流体電脳倶楽部 LaTeX2e 用クラス version 7 (dennou777) %%
%%
%% This is file `dennou777.cls'
%% previous version is `D6style.sty'
%%
%%       Auther: Hitomi-san (a.k.a. Carele Smith)
%%       Original Auther is Manabu YAMADA
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dennou777}[2019-04-00 version 7.0.0 (Nicole)]

%: dennou777 を読み込んでいることのフラグ
\let\dsss@dsss@loaded=t

%: d777helper
\RequirePackage{d777helper}


%: jlreq を読み込む
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jlreq}}
\ProcessOptions\relax
\LoadClassWithOptions{jlreq}

%: dennou777 styles を読み込む
\let\bf\bfseries % アカン（あかん）
\RequirePackage{dennou777}

%: LuaLaTeX 以外なら graphicx と colorx に dvipdfmx オプションを投げる。
%  no_graphicx オプションがあれば、何も処理をしない。
\DeclareOption{no_graphicx}{\let\dsss@option@no@graphicx=t}
\ProcessOptions\relax
\ifx\dsss@option@no@graphicx\@undefined\relax
	\ifx l\jlreq@engine
	\else
		\PassOptionsToPackage{dvipdfmx}{graphicx}
		\PassOptionsToPackage{dvipdfmx}{xcolor}
	\fi
	\RequirePackage{graphicx,xcolor}
\fi


%: 改ページしない \chapter
\ifx\chapter\@undefined\relax
\else
	\SaveHeading{chapter}{\chapterwithpagebreak}
	\ModifyHeading{chapter}{pagebreak=nariyuki}
\fi


%: 章番号など
\renewcommand{\thesection}{{\arabic{chapter}.\arabic{section}}}
\renewcommand{\thesection}{{\arabic{chapter}.\arabic{section}}}
\renewcommand{\theequation}{{\arabic{chapter}.\arabic{equation}}}
\renewcommand{\thepage}{{\arabic{page}}} % 数字
\renewcommand{\thepage}{{\roman{page}}} % ローマ数字
\renewcommand{\thetable}{{\arabic{chapter}.\arabic{section}.\arabic{table}}}
\renewcommand{\thefootnote}{{\arabic{footnote} )}}
\renewcommand{\thefigure}{{\arabic{chapter}.\arabic{section}.\arabic{figure}}}


