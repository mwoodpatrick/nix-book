from html_sanitizer import Sanitizer
sanitizer = Sanitizer()  # default configuration

original='<span style="font-weight:bold">some text</span>'
print('original: ', original)

sanitized=sanitizer.sanitize(original)
print('sanitized: ', sanitized)
