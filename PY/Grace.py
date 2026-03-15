"""
Since python does not have proper macros/define, we use top-level binding and a lambda function instead.
"""
S = '"""\nSince python does not have proper macros/define, we use top-level binding and a lambda function instead.\n"""\nS = %r\nF = %r\nRUN = lambda: open(F, "w").write(S %% (S, F))\nRUN()\n'
F = 'Grace_kid.py'
RUN = lambda: open(F, "w").write(S % (S, F))
RUN()
