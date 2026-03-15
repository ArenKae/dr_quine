"""
Outside comment
"""

def output():
    s = '"""\nOutside comment\n"""\n\ndef output():\n    s = %r\n    print(s %% s, end="")\n\ndef main():\n    """\n    Inside comment\n    """\n    output()\n\nmain()\n'
    print(s % s, end="")

def main():
    """
    Inside comment
    """
    output()

main()
