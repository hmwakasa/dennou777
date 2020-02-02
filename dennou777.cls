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
\ProvidesClass{dennou777}[2020-02-01 version 7.0.7 (Nicole)]

%: BXdvidriver
%  no_driver_detective オプションで BXdvidriver を無効化。
\DeclareOption{no_driver_detective}{\let\dsss@option@no@driver@detective=t}
\ProcessOptions\relax
\ifx\dsss@option@no@driver@detective\@undefined\relax
	\RequirePackage[dvipdfmx]{bxdvidriver}
\fi

%: dennou777 を読み込んでいることのフラグ
\let\dsss@dsss@loaded=t

%: xparse を読み込む（マクロ定義）
\RequirePackage{xparse}

%: \dsss@document@class にスタイルの種別を格納
%% オプションで指定された場合
\DeclareOption{book}{\let\dsss@document@class=b}
\DeclareOption{report}{\let\dsss@document@class=r}
\DeclareOption{article}{\let\dsss@document@class=a}
\ProcessOptions\relax
%% 指定されなかった場合
\ifx\dsss@document@class\@undefined\relax
	\let\dsss@document@class=a % article
\fi

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

%: dennou777 styles を読み込む
{\let\bf\bfseries % アカン（あかん）
\RequirePackage{d777packages}}

%: d777autoload.sty
%  no_auto_load_packages オプションで d777autoload.sty を無効化。
\DeclareOption{no_auto_load_packages}{\let\dsss@option@no@auto@load@packages=t}
\ProcessOptions\relax
\ifx\dsss@option@no@auto@load@packages\@undefined\relax
	\RequirePackage{d777autoload}
\fi

%: jlreq のセットアップ
% \jlreqsetup{
% 	
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%: jlreq 依存なので、D6style 相当の機能はここに。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%: fancyhdr でヘッダー・フッターを実装
\RequirePackage{fancyhdr}

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

%: Dtitle など
\let\dsss@style@title\relax
\NewDocumentCommand\Dtitle{o m}{
	\IfValueTF{#1}
		{\def\dsss@style@title{#1}}
		{\def\dsss@style@title{#2}}
	\title{#2}
}
\let\dsss@style@author\relax
\let\dsss@style@author@bracketed\relax
\NewDocumentCommand\Dauthor{o m}{
	\IfValueTF{#1}
		{\def\dsss@style@author{#1}}
		{\def\dsss@style@author{#2}}
	\author{#2}
}
\def\dsss@style@author@bracketed{（\dsss@style@author）}
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

%%: ページスタイルの定義
\NewPageStyle{DAheadings}{}
\NewPageStyle{Dmyheadings}{}
\NewPageStyle{Dnofoot}{}

%%: DAheadings
\ModifyPageStyle{DAheadings}{
	odd_running_head={\dsss@style@title},
	even_running_head={\dsss@style@title},
	running_head_font=\footnotesize\gtfamily\sffamily,
	running_head_position=top-left,
	nombre_font=\bfseries,
	nombre_position=top-right,
	running_head_ii_position=top-right,
	odd_running_head_iii={\dsss@style@date\dsss@style@author@bracketed},
	even_running_head_iii={\dsss@style@date\dsss@style@author@bracketed},
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
		odd_running_head_ii=_subsection,
		even_running_head_ii=_section,
	}
\else
	\ModifyPageStyle{DAheadings}{
		mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
		},
		odd_running_head_ii=_section,
		even_running_head_ii=_chapter,
	}
\fi

%%: Dmyheadings
\ModifyPageStyle{Dmyheadings}{
	odd_running_head={\dsss@style@title},
	even_running_head={\dsss@style@title},
	running_head_font=\footnotesize\gtfamily\sffamily,
	running_head_position=top-left,
	nombre_font=\bfseries,
	nombre_position=top-right,
	running_head_ii_position=top-right,
	odd_running_head_iii={\dsss@style@date\dsss@style@author@bracketed},
	even_running_head_iii={\dsss@style@date\dsss@style@author@bracketed},
	running_head_iii_position=bottom-right,
	nombre_ii={\dsss@style@path\ \dsss@style@file\ \dsss@style@finp@bracketed},
	nombre_ii_font=\footnotesize\ttfamily\mdseries,
	nombre_ii_position=bottom-left,
}
% 文書クラスによって右サブタイトル、左サブタイトルを変える
% mark_format も変える
\ifx a\dsss@document@class
	\ModifyPageStyle{Dmyheadings}{
		mark_format={
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
		odd_running_head_ii=_subsection,
		even_running_head_ii=_section,
	}
\else
	\ModifyPageStyle{Dmyheadings}{
		mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
		odd_running_head_ii=_section,
		even_running_head_ii=_chapter,
	}
\fi

%%: Dnofoot
\ModifyPageStyle{Dnofoot}{
	odd_running_head={\dsss@style@title},
	even_running_head={\dsss@style@title},
	running_head_font=\footnotesize\gtfamily\sffamily,
	running_head_position=top-left,
	nombre_font=\bfseries,
	nombre_position=top-right,
	running_head_ii_position=top-right,
}
% 文書クラスによって右サブタイトル、左サブタイトルを変える
% mark_format も変える
\ifx a\dsss@document@class
	\ModifyPageStyle{Dnofoot}{
		mark_format={
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
		odd_running_head_ii=_subsection,
		even_running_head_ii=_section,
	}
\else
	\ModifyPageStyle{Dnofoot}{
		mark_format={
			_chapter={第\thechapter 章\quad #1},
			_section={\thesection\ #1},
			_subsection={\thesubsection\ #1}
		},
		odd_running_head_ii=_section,
		even_running_head_ii=_chapter,
	}
\fi

\pagestyle{DAheadings}
