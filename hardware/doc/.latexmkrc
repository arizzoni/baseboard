# .latexmkrc
# Baseboard Design Document

$emulate_aux = 1;
$out_dir = '.';
$aux_dir = 'aux';
$pdflatex = 'lualatex -file-line-error %O %S';
$pdf_mode = 1;

$clean_ext = "../*.fls bbl depytx pytxcode run.xml pythontex-files-%R/* pythontex-files-%R/ ../figures/*.pdf";

add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
sub pythontex { return system("pythontex --interpreter 'python:/home/air/.local/share/python/pythontex/bin/python3' \"$_[0]\""); }
