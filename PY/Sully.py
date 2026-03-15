i = 5
import subprocess
s = 'i = %d\nimport subprocess\ns = %r\nif "Sully_" in __file__:\n    i -= 1\nif i >= 0:\n    name = f"Sully_{i}.py"\n    with open(name, "w") as f:\n        f.write(s %% (i, s))\n    subprocess.run(["python3", name])\n'
if "Sully_" in __file__:
    i -= 1
if i >= 0:
    name = f"Sully_{i}.py"
    with open(name, "w") as f:
        f.write(s % (i, s))
    subprocess.run(["python3", name])
