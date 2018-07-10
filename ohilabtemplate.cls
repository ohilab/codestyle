%
%	Template per documenti dell'Associazione Culturale Open Hardware Ideas Lab
%
%	Copyright (C) 2012-2018 OHILab
%
%	Authors:
%		Marco Giammarini <m.giammarini@warcomeb.it>
%
%	ChangeLog:
%       2018/07/09 v2.0 - Nuova versione del documento
%		2012/10/06 v1.0a - Aggiunta la Partita Iva
%		2012/09/11 v1.0 - Versione iniziale
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ohilabtemplate}[2018/07/09 v2.0 OHILab Documents Template]

\RequirePackage{ifthen,etoolbox}

\newif\ifohi@pagenum \ohi@pagenumfalse
\newif\ifohi@procedure \ohi@procedurefalse
\newif\ifohi@english \ohi@englishfalse
\newif\ifohi@opensource \ohi@opensourcefalse
\newif\ifohi@temp \ohi@tempfalse

%% Dichiaro le opzioni
\DeclareOption{pagenum}{\ohi@pagenumtrue}
\DeclareOption{procedure}{\ohi@proceduretrue}
\DeclareOption{english}{\ohi@englishtrue}
\DeclareOption{opensource}{\ohi@opensourcetrue}
\DeclareOption{temp}{\ohi@temptrue}

\DeclareOption*{
  \ClassError{ohilabtemplate}%
    {L'opzione \CurrentOption\space non e' valida}%
    {Premi X per terminare e correggi}%
}

%% Carico la classe
\ProcessOptions\relax

\LoadClass[10pt,a4paper,oneside]{scrartcl}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

\ifohi@english
\usepackage[english]{babel}
\else
\usepackage[italian]{babel}
\usepackage{indentfirst}
\fi

\usepackage{hyperref}
\pdfcompresslevel=9
\pdfadjustspacing=1

\usepackage{xspace}
\usepackage{xparse}

\newcommand{\docTitle}[1]{\def\ohi@doctitle{#1\xspace}}
\newcommand{\docSubject}[1]{\def\ohi@docsubject{#1\xspace}}
\newcommand{\docRevision}[1]{\def\ohi@docrevision{#1\xspace}}
\newcommand{\docData}[1]{\def\ohi@docdata{#1\xspace}}
\newcommand{\docCode}[1]{\def\ohi@doccode{#1\xspace}}
\newcommand{\docProjectCode}[1]{\def\ohi@docprojectcode{#1\xspace}}
\newcommand{\docDesigner}[1]{\def\ohi@docdesigner{#1\xspace}}
\newcommand{\docDesignerMail}[1]{\def\ohi@docmail{#1\xspace}}

\newcommand{\associazione}{\href{http://www.ohilab.org}{\textbf{Associazione Culturale Open Hardware Ideas Lab}}\xspace}
\newcommand{\sigla}{\href{http://www.ohilab.org}{\textbf{OHILab}}\xspace}

\usepackage{scrpage2}

\usepackage{graphicx}

\usepackage{url}

\renewcommand{\sfdefault}{helvetica}

% Setto lo stile della pagina
\pagestyle{scrheadings}

\setlength{\topmargin}{-2.5cm}
\setlength{\headheight}{3.5cm}
\setlength{\footskip}{1cm}
\setlength{\headsep}{0.5cm}
\setlength{\textheight}{22cm}

\ifohi@temp
\usepackage{draftwatermark}
\SetWatermarkText{DRAFT}
\SetWatermarkScale{5}
\fi

\renewcommand{\maketitle}{%

    \hypersetup{%
        colorlinks=true, linktocpage=true, pdfstartpage=3, pdfstartview=FitV,%
        % uncomment the following line if you want to have black links (e.g., for printing)
        %colorlinks=false, linktocpage=false, pdfborder={0 0 0}, pdfstartpage=3, pdfstartview=FitV,% 
        breaklinks=true, pdfpagemode=UseNone, pageanchor=true, pdfpagemode=UseOutlines,%
        plainpages=false, bookmarksnumbered, bookmarksopen=true, bookmarksopenlevel=1,%
        hypertexnames=true, pdfhighlight=/O,%nesting=true,%frenchlinks,%
        urlcolor=webbrown, linkcolor=RoyalBlue, citecolor=webgreen, %pagecolor=RoyalBlue,%
    %	urlcolor=Black, linkcolor=Black, citecolor=Black, %pagecolor=Black,%
        pdftitle={\ohi@doctitle},%
        pdfauthor={\textcopyright\ Associazione Culturale Open Hardware Ideas Lab},%
        pdfsubject={\ohi@docsubject},%
        pdfkeywords={},%
        pdfcreator={pdfLaTeX},%
        pdfproducer={ohitemplate v2.0 and pdfLaTeX}%
    }
	
	\thispagestyle{plain}
	\vspace*{5cm}
    \noindent\begin{minipage}[t]{\textwidth}
	\begin{center}%
		{\Large{\ohi@doctitle}}\\%
		\vspace{.5cm}
		{\large{\ohi@docsubject}}\\%
		\vspace{.5cm}
		\rule{\textwidth}{1pt}%
		\vspace{.5cm}
		\ifohi@procedure
			{}
		\else
			{\ohi@docdesigner}\\%
		\fi
		\vspace{.3cm}
		\ifohi@english
			{\small{Rev.~\ohi@docrevision of~\ohi@docdata}}\\%
		\else
			{\small{Rev.~\ohi@docrevision del~\ohi@docdata}}\\%
		\fi
	\end{center}%
	\end{minipage}
	\vspace*{1cm}
	\clearpage
}

\usepackage{lastpage}
% Creo header e footer
\newcommand{\makeheadfoot}{%
	\clearscrheadfoot

	\setheadwidth{textwithmarginpar}
	%\setfootwidth{textwithmarginpar}

	\ohead[]{}
	\ihead[]{}
	\chead[%
        \ifohi@procedure
            \ifohi@english
                \begin{tabularx}{\columnwidth}{|p{3cm}|X|p{1.2cm}p{1.7cm}|}
                \hline
                \multirow{4}{*}{\includegraphics[width=3cm]{images/logo}} & \multirow{2}{*}{\centering{\small\ohi@doctitle}} & {\tiny{Prj Code:}} & {\tiny{\ohi@docprojectcode}} \\
                \cline{3-4}
                & {} & {\scriptsize{Doc Nr:}} & {\tiny{\ohi@doccode}} \\
                \cline{3-4}
                & \multirow{2}{*}{\centering{\small\ohi@docsubject}} & {\tiny{Revision:}} & {\tiny{\ohi@docrevision\ -~\ohi@docdata}} \\
                \cline{3-4}
                & {} & {\tiny{Page:}} & {\tiny{\thepage\ of \pageref{LastPage}}} \\
                \hline
                \end{tabularx}
            \else
                \begin{tabularx}{\columnwidth}{|p{3cm}|X|p{1.2cm}p{1.7cm}|}
                \hline
                \multirow{4}{*}{\includegraphics[width=3cm]{images/logo}} & \multirow{2}{*}{\centering{\small\ohi@doctitle}} & {\tiny{Prj Code:}} & {\tiny{\ohi@docprojectcode}} \\
                \cline{3-4}
                & {} & {\tiny{Doc Nr:}} & {\tiny{\ohi@doccode}} \\
                \cline{3-4}
                & \multirow{2}{*}{\centering{\small\ohi@docsubject}} & {\tiny{Revisione:}} & {\tiny{\ohi@docrevision\ -~\ohi@docdata}} \\
                \cline{3-4}
                & {} & {\tiny{Page:}} & {\tiny{\thepage\ di \pageref{LastPage}}} \\
                \hline
                \end{tabularx}
            \fi
        \fi
	]{%
        \ifohi@procedure
            \ifohi@english
                \begin{tabularx}{\columnwidth}{|p{3cm}|X|p{1.2cm}p{1.7cm}|}
                \hline
                \multirow{4}{*}{\includegraphics[width=3cm]{images/logo}} & \multirow{2}{*}{\centering{\small\ohi@doctitle}} & {\tiny{Prj Code:}} & {\tiny{\ohi@docprojectcode}} \\
                \cline{3-4}
                & {} & {\scriptsize{Doc Nr:}} & {\tiny{\ohi@doccode}} \\
                \cline{3-4}
                & \multirow{2}{*}{\centering{\small\ohi@docsubject}} & {\tiny{Revision:}} & {\tiny{\ohi@docrevision\ -~\ohi@docdata}} \\
                \cline{3-4}
                & {} & {\tiny{Page:}} & {\tiny{\thepage\ of \pageref{LastPage}}} \\
                \hline
                \end{tabularx}
            \else
                \begin{tabularx}{\columnwidth}{|p{3cm}|X|p{1.2cm}p{1.7cm}|}
                \hline
                \multirow{4}{*}{\includegraphics[width=3cm]{images/logo}} & \multirow{2}{*}{\centering{\small\ohi@doctitle}} & {\tiny{Prj Code:}} & {\tiny{\ohi@docprojectcode}} \\
                \cline{3-4}
                & {} & {\tiny{Doc Nr:}} & {\tiny{\ohi@doccode}} \\
                \cline{3-4}
                & \multirow{2}{*}{\centering{\small\ohi@docsubject}} & {\tiny{Revisione:}} & {\tiny{\ohi@docrevision\ -~\ohi@docdata}} \\
                \cline{3-4}
                & {} & {\tiny{Page:}} & {\tiny{\thepage\ di \pageref{LastPage}}} \\
                \hline
                \end{tabularx}
            \fi
        \fi
	}%

	\cfoot[%
        \hrule%
        \vspace{.3cm}
        \ifohi@opensource
            \ifohi@english
                {\scriptsize{\emph{\ohi@doctitle} by OHILab is licensed under a \href{http://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0}}}\\
            \else
                {\scriptsize{\emph{\ohi@doctitle} di OHILab è distribuito con Licenza \href{http://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0}}}\\
            \fi
            {\scriptsize{Associazione Culturale Open Hardware Ideas Lab, C/da Morica 67, 62100 Macerata (MC), \url{http://www.ohilab.org}}}
        \fi
    ]{%
        \hrule%
        \vspace{.3cm}
        \ifohi@opensource
            \ifohi@english
                {\scriptsize{\emph{\ohi@doctitle} by OHILab is licensed under a \href{http://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0}}}\\
            \else
                {\scriptsize{\emph{\ohi@doctitle} di OHILab è distribuito con Licenza \href{http://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons BY-SA 4.0}}}\\
            \fi
            {\scriptsize{Associazione Culturale Open Hardware Ideas Lab, C/da Morica 67, 62100 Macerata (MC), \url{http://www.ohilab.org}}}
        \fi
    }
	\ifoot[]{}
    \ofoot[]{}
%	\ofoot[%
%		\hrule%
%		\vspace{0.2cm}%
%		{\footnotesize\color{rossoLoc}ohi}\\
%		{\scriptsize{Via Fiume 16, 60030 Angeli di Rosora, Ancona, Italy}}\\
%		{\scriptsize{Phone +39 0731 8161 Fax 0731 814700 \url{info@ohi.com}}}\\
%	]{%
%		\hrule%
%		\vspace{0.2cm}%
%		{\footnotesize\color{rossoLoc}ohi}\\
%		{\scriptsize{Via Fiume 16, 60030 Angeli di Rosora, Ancona, Italy}}\\
%		{\scriptsize{Phone +39 0731 8161 Fax 0731 814700 \url{info@ohi.com}}}\\
%	}
}

\NewDocumentCommand{\Revision}{m}{%
	\ifohi@english
	    \section*{Revision History}
	\else
	    \section*{Indice di revisione}
	\fi
	
	\renewcommand\arraystretch{1.2}
	#1%
	\renewcommand\arraystretch{1}

    \clearpage
}

\NewDocumentCommand{\RTable}{m}{%
	\begin{center}
	\begin{tabularx}{\columnwidth}{p{0.25cm}Xp{3cm}XXXX}
		\toprule
		\ifohi@english
			{\scriptsize Rev.} & {\scriptsize Date} & {\scriptsize Description} & {\scriptsize Author} & {\scriptsize Checked} & {\scriptsize Approved} \\
		\else
			{\scriptsize Rev.} & {\scriptsize Data} & {\scriptsize Descrizione} & {\scriptsize Autore} & {\scriptsize Verificato} & {\scriptsize Approvato} \\
		\fi
		\midrule
		#1
		\bottomrule
	\end{tabularx}
	\end{center}
}

% PR ITEM
% 1 - Revisione
% 2 - Data
% 3 - Descrizione
% 4 - Autore
% 5 - Controllo
% 6 - Approvazione
\DeclareExpandableDocumentCommand{\RItem}{m m m m m m}{%
	{\scriptsize #1} & {\scriptsize #2} & {\scriptsize #3} & {\scriptsize #4} & {\scriptsize #5}& {\scriptsize #6}\\[5pt]
}