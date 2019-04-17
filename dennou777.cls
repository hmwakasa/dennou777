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

%: xparse を読み込む（マクロ定義）
\RequirePackage{xparse}

%: d777helper
% \dsss@helper@guessengine を読み込む。
% 暗黙の空白トークン \dsss@space を作る。
\RequirePackage{d777helper}

%: \dsss@engine にエンジンの種別を格納
%% オプションで指定された場合
\DeclareOption{uplatex}{\let\dsss@engine=u}
\DeclareOption{platex}{\let\dsss@engine=p}
\DeclareOption{lualatex}{\let\dsss@engine=l}
\ProcessOptions\relax
%% 指定されなかった場合
\ifx\dsss@engine\@undefined\relax
	\let\dsss@engine\dsss@result
\fi

%: jlreq を読み込む
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jlreq}}
\ProcessOptions\relax
\LoadClassWithOptions{jlreq}

%: \dsss@document@class にスタイルの種別を格納
%% オプションで指定された場合
\DeclareOption{book}{\let\dsss@document@class=b}
\DeclareOption{report}{\let\dsss@document@class=r}
\ProcessOptions\relax
%% 指定されなかった場合
\ifx\dsss@document@class\@undefined\relax
	\let\dsss@document@class=a % article
\fi

%: dennou777 styles を読み込む
\let\bf\bfseries % アカン（あかん）
\RequirePackage{dennou777}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%: LuaLaTeX 以外なら graphicx と colorx に dvipdfmx オプションを投げる
%  no_graphicx オプションがあれば、何も処理をしない
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{no_graphicx}{\let\dsss@option@no@graphicx=t}
\ProcessOptions\relax
\ifx\dsss@option@no@graphicx\@undefined\relax
	\ifx l\dsss@engine
	\else
		\PassOptionsToPackage{dvipdfmx}{graphicx}
		\PassOptionsToPackage{dvipdfmx}{xcolor}
	\fi
	\RequirePackage{graphicx,xcolor}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%: jlreq 依存なので、D6style 相当の機能はここに。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%: article 以外で変更
\ifx a\dsss@document@class\else
	% 改ページしない \chapter
	% 本来の \chapter は \chapterwithpagebreak で利用可能。
	\SaveHeading{chapter}{\chapterwithpagebreak}
	\ModifyHeading{chapter}{pagebreak=nariyuki}
	% 章番号など（article クラスでないときにのみ変更）
	\renewcommand{\thesection}{{\arabic{chapter}.\arabic{section}}}
	\renewcommand{\thesection}{{\arabic{chapter}.\arabic{section}}}
	\renewcommand{\theequation}{{\arabic{chapter}.\arabic{equation}}}
	\renewcommand{\thetable}{{\arabic{chapter}.\arabic{section}.\arabic{table}}}
	\renewcommand{\thefigure}{{\arabic{chapter}.\arabic{section}.\arabic{figure}}}
\fi

\renewcommand{\thefootnote}{{\arabic{footnote})}}
\renewcommand{\thepage}{{\arabic{page}}} % 数字
%%: roman_nombre オプションで、ローマ数字のノンブル
\DeclareOption{roman_nonbre}{\renewcommand{\thepage}{{\roman{page}}}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%: ヘッダー、フッターのスタイル 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%: Dﾅﾝﾄｶ の定義
\let\dsss@style@title\relax
\NewDocumentCommand\Dtitle{o m}{
	\IfValueTF{#1}
		{\def\dsss@style@title{#1}}
		{\def\dsss@style@title{#2}}
	\title{#2}
}
\let\dsss@style@author\relax
\NewDocumentCommand\Dauthor{o m}{
	\IfValueTF{#1}
		{\def\dsss@style@author{#1}}
		{\def\dsss@style@author{#2}}
	\author{#2}
}
\let\dsss@style@date\today
\let\dsss@style@date@bracketed\relax
\newcommand{\Ddate}[1]{
	\def\dsss@style@date{#1}
	\date{#1}
}
\def\dsss@style@date@bracketed{（\dsss@style@date）}
\let\dsss@style@path\relax
\newcommand{\Dpath}[1]{\def\dsss@style@path{#1}}
\def\dsss@style@file{\jobname.tex}
\newcommand{\Dfile}[1]{\def\dsss@style@file{#1}}
\let\dsss@style@finp\relax \let\dsss@style@finp@bracketed\relax
\newcommand{\Dfinp}[1]{\def\dsss@style@finp{#1}\def\dsss@style@date@bracketed{(#1)}}
%%: DAheadings
\NewPageStyle{DAheadings}{
	odd_running_head={\dsss@style@title},
	even_running_head={\dsss@style@title},
	running_head_font=\footnotesize\gtfamily\sffamily,
	running_head_position=top-left,
	nombre_font=\bfseries,
	nombre_position=top-right,
	running_head_ii_position=top-right,
	odd_running_head_iii={\dsss@style@author\dsss@style@date@bracketed},
	even_running_head_iii={\dsss@style@author\dsss@style@date@bracketed},
	running_head_iii_position=bottom-right,
	nombre_ii={\dsss@style@path\ \dsss@style@file\ \dsss@style@finp@bracketed},
	nombre_ii_font=\footnotesize\ttfamily\mdseries,
	nombre_ii_position=bottom-left,
}
% 文書クラスによって右サブタイトル、左サブタイトルを変える
% mark_format も変える
\ifx a\dsss@document@class
	\ModifyPageStyle{DAheadings}{
		mark_format={
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1},
		},
		odd_running_head_ii=_section,
		even_running_head_ii=_subsection,
	}
\else
	\ModifyPageStyle{DAheadings}{
		mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
		},
		odd_running_head_ii=_chapter,
		even_running_head_ii=_section,
	}
\fi
%%: Dmyheadings
\NewPageStyle{Dmyheadings}{
	mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
	odd_running_head={\dsss@style@title},
	even_running_head={\dsss@style@title},
	running_head_font=\footnotesize\gtfamily\sffamily,
	running_head_position=top-left,
	nombre_font=\bfseries,
	nombre_position=top-right,
	running_head_ii_position=top-right,
	odd_running_head_iii={\dsss@style@author\dsss@style@date@bracketed},
	even_running_head_iii={\dsss@style@author\dsss@style@date@bracketed},
	running_head_iii_position=bottom-right,
	nombre_ii={\dsss@style@path\ \dsss@style@file\ \dsss@style@finp@bracketed},
	nombre_ii_font=\footnotesize\ttfamily\mdseries,
	nombre_ii_position=bottom-left,
}
% 文書クラスによって右サブタイトル、左サブタイトルを変える
% mark_format も変える
\ifx a\dsss@document@class
	\ModifyPageStyle{DAheadings}{
		mark_format={
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
	}
\else
	\ModifyPageStyle{DAheadings}{
		mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
	}
\fi

%%: 罫線を入れるために fancyhdr.sty を使う
%   本当は使いたくない。
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}

\pagestyle{DAheadings}


