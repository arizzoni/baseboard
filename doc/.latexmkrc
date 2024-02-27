# .latexmkrc

$emulate_aux = 1;
$out_dir = '.';
$aux_dir = 'build';
$pdflatex = 'lualatex -file-line-error %O -shell-escape %S';
$pdf_mode = 1;
$cleanup_includes_cusdep_generated = 1;

add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
sub pythontex { return system("pythontex --interpreter 'python:/home/air/.local/share/python/pythontex/bin/python3' \"$_[0]\""); }
