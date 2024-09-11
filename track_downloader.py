import os
import sys

for track in sys.argv[1:]:
    for exercise in os.listdir("clojure"):
        os.system(f'exercism download --track={track} --exercise={exercise}')
