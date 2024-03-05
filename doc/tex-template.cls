% \NeedsTexFormat{LaTeX2e}
\ProvidesClass{tex-template}[2024/3/4 engdoc]
% \DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\newenvironment{revisionhistory}
    {\setcounter{secnumdepth}{0}}
    {\setcounter{secnumdepth}{3}}

% Page Layout
\usepackage[%
    letterpaper, % 8.5" x 11" paper size
    margin=1in
    ]{geometry}

% Code Execution and Typesetting
\RequirePackage[%
    pygopt={
        style=bw
        },
    upquote=true
    ]{pythontex}
\setpythontexfv{%
    breaklines,
    breakanywhere,
    frame=leftline,
    framerule=0.8pt,
    firstnumber=last,
    numbers=left,
    numbersep=0pt
    }
\renewcommand{\FancyVerbFormatLine}[1]{\small #1}
\renewcommand{\theFancyVerbLine}{%
    \tiny\rmfamily{\arabic{FancyVerbLine}\,}
    }

% Mathematics
\RequirePackage{mathtools} % Mathematics typesetting
\RequirePackage[% Mathematics with modern fonts
    warnings-off={% Turn off default always-on warnings
        mathtools-colon,
        mathtools-overbracket
        }
    ]{unicode-math} 
\RequirePackage{lualatex-math} % Math fixes for LuaLaTeX
\RequirePackage{siunitx} % Handy typesetting of units

% Font
\RequirePackage{fontspec} % Modern .ttc, .ttf, and .otf fonts
\setmathfont{STIXTwoMath-Regular.otf}
\setmainfont{STIXTwoText-Regular.otf}[%
    Ligatures=TeX,
    ItalicFont=STIXTwoText-Italic.otf,
    BoldFont=STIXTwoText-Bold.otf,
    BoldItalicFont=STIXTwoText-BoldItalic.otf,
    ]
\setsansfont{Iosevka Aile}[%
    Ligatures=TeX,
    Scale=MatchLowercase
    ]
\setmonofont{Iosevka Fixed}[%
    Ligatures=TeX,
    Scale=MatchLowercase
    ]

% Graphics for plots, etc.
\RequirePackage{pgf}

% Localization
\RequirePackage[% Localized context-sensitive quotes
    autostyle=true
    ]{csquotes}

% Headers
\RequirePackage{fancyhdr}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\setlength{\headheight}{24pt}
\fancypagestyle{fancy}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.8pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhead[L]{\sffamily\thedoctitle}
    \fancyhead[R]{\sffamily\small\rightmark}
    \fancyfoot[C]{\sffamily\small\thepage}
}
\pagestyle{fancy}

% Section Title Formatting
\RequirePackage{titlesec}
\titleformat{\section}{\Large\sffamily}{\thesection}{1em}{\Large\sffamily}
\titleformat{\subsection}{\large\sffamily}{\thesubsection}{1em}{\large\sffamily}
\titleformat{\subsubsection}{\normalsize\sffamily}{\thesubsubsection}{1em}{\normalsize\sffamily}
% \AddToHook{cmd/section/before}{\clearpage}

% Table of Contents Formatting
\RequirePackage{titletoc}
\dottedcontents{section}[1em]{}{2em}{0.5em}
\dottedcontents{subsection}[3em]{}{2em}{0.5em}
\dottedcontents{subsubsection}[5em]{}{2em}{0.5em}

%% Pythontex 
% Get lengths (in LaTeX points!)
\newlength\inlength \inlength=1in
\newlength\cmlength \cmlength=1cm
\newlength\mmlength \mmlength=1mm
\newlength\emlength \emlength=1em
\newlength\exlength \exlength=1ex
\newlength\bplength \bplength=1bp
\newlength\ddlength \ddlength=1dd
\newlength\pclength \pclength=1pc

% Get font parameters
\makeatletter

% Font Sizes
\tiny\xdef\thetinysize{\f@size}
\scriptsize\xdef\thescriptsize{\f@size}
\footnotesize\xdef\thefootnotesize{\f@size}
\small\xdef\thesmallsize{\f@size}
\normalsize\xdef\thenormalsize{\f@size}
\large\xdef\thelargesize{\f@size}
\Large\xdef\theLargesize{\f@size}
\LARGE\xdef\theLARGEsize{\f@size}
\huge\xdef\thehugesize{\f@size}
\Huge\xdef\theHugesize{\f@size}

% Fonts 
\sffamily\mdseries\upshape\xdef\thesffont{\expandafter\string\the\font}
\ttfamily\mdseries\upshape\xdef\thettfont{\expandafter\string\the\font}
\rmfamily\mdseries\upshape\xdef\thermfont{\expandafter\string\the\font}
\sffamily\bfseries\upshape\xdef\theboldsffont{\expandafter\string\the\font}
\ttfamily\bfseries\upshape\xdef\theboldttfont{\expandafter\string\the\font}
\rmfamily\bfseries\upshape\xdef\theboldrmfont{\expandafter\string\the\font}
\sffamily\mdseries\itshape\xdef\theitalicsffont{\expandafter\string\the\font}
\ttfamily\mdseries\itshape\xdef\theitalicttfont{\expandafter\string\the\font}
\rmfamily\mdseries\itshape\xdef\theitalicrmfont{\expandafter\string\the\font}
\sffamily\bfseries\itshape\xdef\thebolditalicsffont{\expandafter\string\the\font}
\ttfamily\bfseries\itshape\xdef\thebolditalicttfont{\expandafter\string\the\font}
\rmfamily\bfseries\itshape\xdef\thebolditalicrmfont{\expandafter\string\the\font}
\sffamily\mdseries\scshape\xdef\thesmallcapssffont{\expandafter\string\the\font}
\ttfamily\mdseries\scshape\xdef\thesmallcapsttfont{\expandafter\string\the\font}
\rmfamily\mdseries\scshape\xdef\thesmallcapsrmfont{\expandafter\string\the\font}
\sffamily\bfseries\scshape\xdef\theboldsmallcapssffont{\expandafter\string\the\font}
\ttfamily\bfseries\scshape\xdef\theboldsmallcapsttfont{\expandafter\string\the\font}
\rmfamily\bfseries\scshape\xdef\theboldsmallcapsrmfont{\expandafter\string\the\font}
\sffamily\mdseries\slshape\xdef\theslantedsffont{\expandafter\string\the\font}
\ttfamily\mdseries\slshape\xdef\theslantedttfont{\expandafter\string\the\font}
\rmfamily\mdseries\slshape\xdef\theslantedrmfont{\expandafter\string\the\font}
\sffamily\bfseries\slshape\xdef\theboldslantedsffont{\expandafter\string\the\font}
\ttfamily\bfseries\slshape\xdef\theboldslantedttfont{\expandafter\string\the\font}
\rmfamily\bfseries\slshape\xdef\theboldslantedrmfont{\expandafter\string\the\font}

% Math Fonts
\xdef\themathfont{\expandafter\string\the\textfont0}
\xdef\themathfontone{\expandafter\string\the\textfont1}
\xdef\themathfonttwo{\expandafter\string\the\textfont2}
\xdef\themathfontthree{\expandafter\string\the\textfont3}

\makeatother

% Define Python Context
\setpythontexcontext{%
    romanfont=\thermfont,
    romanboldfont=\theboldrmfont,
    romanitalicfont=\theitalicrmfont,
    romanbolditalicfont=\thebolditalicrmfont,
    sansfont=\thesffont,
    sansboldfont=\theboldsffont,
    sansitalicfont=\theitalicsffont,
    sansbolditalicfont=\thebolditalicsffont,
    monofont=\thettfont,
    monoboldfont=\theboldttfont,
    monoitalicfont=\theitalicttfont,
    monobolditalicfont=\thebolditalicttfont,
    mathfont=\themathfont,
    mathfontone=\themathfontone,
    mathfonttwo=\themathfonttwo,
    mathfontthree=\themathfontthree,
    scsansfont = \thesmallcapssffont,
    scromanfont = \thesmallcapsrmfont,
    scmonofont = \thesmallcapsttfont,
    scsansboldfont = \theboldsmallcapssffont,
    scromanboldfont = \theboldsmallcapsrmfont,
    scmonoboldfont = \theboldsmallcapsttfont,
    slantedsansfont = \theslantedsffont,
    slantedromanfont = \theslantedrmfont,
    slantedmonofont = \theslantedttfont,
    slantedsansboldfont = \theboldslantedsffont,
    slantedromanboldfont = \theboldslantedrmfont,
    slantedmonoboldfont = \theboldslantedttfont,
    tiny=\thetinysize,
    scriptsize=\thescriptsize,
    footnotesize=\thefootnotesize,
    small=\thesmallsize,
    normalsize=\thenormalsize,
    large=\thelargesize,
    Large=\theLargesize,
    LARGE=\theLARGEsize,
    huge=\thehugesize,
    Huge=\theHugesize,
    baselineskip=\the\baselineskip,
    % baselinestretch=\the\baselinestretch,
    columnsep=\the\columnsep,
    columnwidth=\the\columnwidth,
    evensidemargin=\the\evensidemargin,
    linewidth=\the\linewidth,
    oddsidemargin=\the\oddsidemargin,
    paperwidth=\the\paperwidth,
    paperheight=\the\paperheight,
    parindent=\the\parindent,
    parskip=\the\parskip,
    textheight=\the\textheight,
    textwidth=\the\textwidth,
    topmargin=\the\topmargin,
    unitlength=\the\unitlength,
    in=\the\inlength,
    cm=\the\cmlength,
    mm=\the\mmlength,
    em=\the\emlength,
    ex=\the\exlength,
    bp=\the\bplength,
    dd=\the\ddlength,
    pc=\the\pclength
}

\AtBeginDocument{
    \renewcommand{\abstractname}{Introduction}
    \addtocontents{toc}{\protect\thispagestyle{empty}}
}

\begin{pythontexcustomcode}{py}
import os

import numpy as np # Python numerical computing library
import matplotlib as mpl

from cycler import cycler # Property cycler utilities
from matplotlib import pyplot as plt # Pyplot API
from matplotlib import rcParams as rc # Matplotlib plot styling
from matplotlib.ticker import EngFormatter # Plot tick formatting

class Environment():

    build_directory = os.path.abspath(os.getcwd())
    output_directory = os.sep.join(build_directory.split(os.sep)[:-1])
    figures_directory = os.path.join(output_directory, 'figures')
    pgf_directory = os.path.join(figures_directory, 'pgf')
    pdf_directory = os.path.join(figures_directory, 'pdf')

    def __init__(self):
        figure_directories = [ self.figures_directory, self.pgf_directory, self.pdf_directory ]
        for directory in figure_directories:
            if not os.path.exists(directory):
                os.mkdir(directory)

environment = Environment()

def metallic_ratio(n):
    return 0.5 * ( n + np.sqrt(n**2 + 4) )
    
def eng_format(arg: str):
    return EngFormatter(unit=arg, sep=r'\,')

def save_pythontex_figure(figure, figure_name):
    if type(figure) == mpl.figure.Figure:
        figure.savefig(os.path.join(environment.pgf_directory, f'{figure_name}.pgf'))
        figure.savefig(os.path.join(environment.pdf_directory, f'{figure_name}.pdf'))
    return figure

class Geometry():

    # Convert from (LaTeX!) points to inches 
    # There is ~ 0.14 micron floating point error here
    in_length = float(pytex.context['in'][:-2]) / 72.27
    cm_length = float(pytex.context['cm'][:-2]) / 72.27
    mm_length = float(pytex.context['mm'][:-2]) / 72.27
    em_length = float(pytex.context['em'][:-2]) / 72.27
    ex_length = float(pytex.context['ex'][:-2]) / 72.27
    bp_length = float(pytex.context['bp'][:-2]) / 72.27
    dd_length = float(pytex.context['dd'][:-2]) / 72.27
    pc_length = float(pytex.context['pc'][:-2]) / 72.27

    column_width = float(pytex.context['columnwidth'][:-2]) / 72.27
    text_width = float(pytex.context['textwidth'][:-2]) / 72.27
    text_height = float(pytex.context['textheight'][:-2]) / 72.27
    figure_width = column_width - 2 * em_length
    figure_height = figure_width / metallic_ratio(1) # Define figure height as a function of the figure width and the golden ratio

    axis_dimensions = (0, 0, 1, 1) # 0 lr margin, 0 tb margin, 100% figure size

geometry = Geometry()

# Determine font parameters
class Font():
    # Font faces
    roman = pytex.context['romanfont'].split('/')[1][:-3]
    bold_roman = pytex.context['romanboldfont'].split('/')[1][:-3]
    bold_italic_roman = pytex.context['romanbolditalicfont'].split('/')[1][:-3]
    italic_roman = pytex.context['romanitalicfont'].split('/')[1][:-3]
    sans = pytex.context['sansfont'].split('/')[1][:-3]
    mono = pytex.context['monofont'].split('/')[1][:-3]
    math = pytex.context['mathfont'].split('/')[1][:-3]
    
    # Font sizes
    tiny = pytex.context['tiny']
    script_size = pytex.context['scriptsize']
    footnote_size = pytex.context['footnotesize']
    small = pytex.context['small']
    normal_size = pytex.context['normalsize']
    large = pytex.context['large']
    llarge = pytex.context['Large']
    lllarge = pytex.context['LARGE']
    huge = pytex.context['huge']
    hhuge = pytex.context['Huge']

font = Font() # Instantiate the class for use

# figure settings
cmap = plt.get_cmap('grey') # Select colormap
num_plot_styles = 4 # number of colors for plotting

# Initialize empty lists for plot colors and styles
plot_colors = []
line_styles = []
for i in range(num_plot_styles): # Populate the color and style lists
    plot_colors.append(cmap(1.0 * i/num_plot_styles))
    line_styles.append((0, (i+1, i)))

# Define the main cycler with the two component lists 
style_cycler = cycler(color=plot_colors, linestyle=line_styles)

# Document-wide Matplotlib Configuration
rc.update({
        'backend': 'pgf',
        'lines.linewidth': 1,
        'font.family': 'serif',
        'font.size': font.script_size,
        'text.usetex': True,
        'axes.prop_cycle': style_cycler,
        'axes.labelsize': font.footnote_size,
        'axes.linewidth': 0.8,
        'xtick.direction': 'in',
        'xtick.top': True,
        'xtick.bottom': True,
        'xtick.minor.visible': True,
        'ytick.direction': 'in',
        'ytick.left': True,
        'ytick.right': True,
        'ytick.minor.visible': True,
        'legend.fontsize': font.footnote_size,
        'legend.fancybox': False,
        'figure.figsize': (geometry.figure_width, geometry.figure_height),
        'figure.dpi': 600,
	'figure.constrained_layout.use': True,
        'figure.constrained_layout.hspace': 0,
        'figure.constrained_layout.wspace': 0,
        'figure.constrained_layout.w_pad': 0,
        'figure.constrained_layout.h_pad': 0,
        'savefig.format': 'pgf',
        'savefig.bbox': 'tight',
        'savefig.transparent': True,
        'pgf.rcfonts': False,
	'pgf.preamble': '\n'.join([
                r'\usepackage{mathtools}',
                r'\usepackage[warnings-off={mathtools-colon, mathtools-overbracket}]{unicode-math}',
                r'\usepackage{lualatex-math}',
                r'\usepackage{siunitx}',
                r'\usepackage{fontspec}',
                r'\setmainfont{%s}[Ligatures=TeX, ItalicFont=%s, BoldFont=%s, BoldItalicFont=%s]' %(font.roman, font.italic_roman, font.bold_roman, font.bold_italic_roman),
                r'\setmathfont{%s}' %(font.math),
                r'\setsansfont{%s}[Ligatures=TeX, Scale=MatchLowercase]' %(font.sans),
                r'\setmonofont{%s}[Ligatures=TeX, Scale=MatchLowercase]' %(font.mono),
		r'\usepackage[USenglish]{babel}',
                r'\usepackage[autostyle=true]{csquotes}'
	]),
        'pgf.texsystem': 'lualatex', # default is xetex, but lualatex is preferred
})

\end{pythontexcustomcode}

\AtBeginDocument{
    \renewcommand{\abstractname}{Introduction}
    \addtocontents{toc}{\protect\thispagestyle{empty}}
}
