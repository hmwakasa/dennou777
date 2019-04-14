# 地球流体電脳倶楽部 LaTeX2e 用マクロ集 version 7 (dennou777.sty)

## 概要

これは、「LaTeX を用いた、マニュアル、論文等の作成に便利な、マクロ定義スタイル集である」
[Dennou6.sty](http://www.gfd-dennou.org/library/cc-env/TeXmacro/dennou/) 
の、古くなった部分は更新し、さらに新しく便利な機能を追加したものである。

**現在開発中である**。この README は、パッケージの使い方や、仕様を記したものではなく、
dennou777.sty を開発する上での覚書である。パッケージのドキュメントは dennou777.pdf
を参照。

## ファイル群

D6 から始まるファイル群は、オリジナルの電脳スタイル version 6 のファイルである
（Dennou6.sty は D6.sty と、version 6 のドキュメントは、D6.pdf とリネームした）。
これらファイルは、オリジナルのままであるので、（リネーム以外の）一切の変更は行っていない。

version 7 におけるファイル群は、dennou777 から始まるファイル、d7 から始まるファイル、
そしてこの README である。

## 開発方針

~~version 6 との互換性を保ちつつ~~ version 6 のファイル群を見た限り、
2001 年以降に更新された形跡がないので、**version 6 との互換性は担保しない**
こととする。

Version 6 と同様な機能を提供しつつ、outdated な記述を削除し、推奨されている
記述に改める。また、version 6 が提供しようとしている機能自体が outdated なものである
場合、*その機能自体を削除することも辞さない*。例えば、D6graphicx.sty などである。

Version 6 の機能を改めると同時に、Version 7 で新しい機能を提供することも考えている。

また、日本語で LaTeX をする方法に、pLaTeX + dvipdfmx 以外の方法、例えば upLaTeX + dvipdfmx
や、XeLaTeX、LuaLaTeX-ja といった方法が増えてきたのを鑑みて、pLaTeX、upLaTeX、
LuaLaTeX、XeLaTeX のいずれにも対応するパッケージとすることを目指す。

+ Version 6 の機能のうち、改修する予定のもの
	- [] D6math.sty が提供するコマンドの、スペース関連のもの。
+ Version 6 の機能のうち、削除したいと考えているもの
	- [] D6graphicx.sty（PostScript を直接取り込む機会はほぼないと思われるため）
	- [] D6prog.sty（高機能な listing パッケージが存在しているため、そちらを使うべきなのでは;
		削除するかは未定）
+ Version 7 で新しく追加したい機能
	- [] lmodern パッケージや、amsmath パッケージのように、毎回読み込むパッケージを
		一括して読み込む機能。
	- [] このパッケージを使う人の層を考えると、LaTeX 初学者が触れる機会が多いので、
		LaTeX の使い方もパッケージのドキュメントに含めるべきか。

## 開発状況

- [2019-04-14] 開発を開始するため、開発方針について、本文書に記載。

## その他

### FAQ

<dl>
	<dt>どうして、dennou7.sty じゃなくて、dennou777.sty なのですか。</dt>
	<dd>
		とあるゲームに由来してます。dennou7 にしろと怒られたら、dennou7 に
		戻るかもしれません。
	</dd>
	<dt>「地球流体電脳倶楽部 LaTeX2e 用マクロ集 version 7.0.0 (Nicole)」の Nicole って何ですか。</dt>
	<dd>
		コードネームです。「777」の元ネタに登場するキャラクターに由来しています。
		ver. 7.1.x では “Haru”、7.2.x では “Musubi” というふうに続く予定です。
	</dd>
</dl>