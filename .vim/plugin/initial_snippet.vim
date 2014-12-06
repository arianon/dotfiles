" C

au FileType c
			\ if line("$") == 1 && getline(1) == "" |
			\ call C_NewFile() |
			\ endif

fu! C_NewFile()
	" Prepend the headers
	let s:headers = ["<stdio.h>", "<stdlib.h>", "<stdbool.h>"]

	for headers in reverse(s:headers)
		call append(0, "#include " . headers)
	endfor
	
	" Append the Q/initial snippet
	let s:snippet = [
				\ 'int main(int argc, char* argv[]) {',
				\ '	',
				\ '}',
				\ '',
				\ '// vim: ts=4:sts=4:sw=4:noet'
				\	]

	call append("$", s:snippet)

	" Send cursor to the main() function
	call cursor(6, 0)
endfu

" Python

au FileType python
			\ if line("$") == 1 && getline(1) == "" |
			\ call Python_NewFile() |
			\ endif

fu! Python_NewFile()
	" Prepend the imports
	let s:imports = ["sys", "os"]

	for imports in s:imports
		call append(0, "import " . imports)
	endfor
	
	" Append the initial snippet
	let s:snippet = [
				\ 'def main(*args, **kwargs):',
				\ '	',
				\ '',
				\ 'if __name__ == "__main__":',
				\ '	try:',
				\ '		main()',
				\ '	except KeyboardInterrupt:',
				\ '		pass',
				\ '',
				\ '# vim: ts=4:sts=4:sw=4:noet'
				\	]

	call append("$", s:snippet)

	" Send cursor to the main() function
	call cursor(5, 0)
endfu

fu! Python_AutoImports()
	let x = "kek"
endfu

